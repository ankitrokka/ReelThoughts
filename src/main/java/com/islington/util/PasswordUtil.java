package com.islington.util;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class PasswordUtil {
    private static final String ENCRYPT_ALGO = "AES/GCM/NoPadding";
    private static final int TAG_LENGTH_BIT = 128; // Must be 128, 120, 112, 104, or 96
    private static final int IV_LENGTH_BYTE = 12;  // 12 bytes for GCM
    private static final int SALT_LENGTH_BYTE = 16; // 16 bytes salt
    private static final Charset UTF_8 = StandardCharsets.UTF_8;
    private static final Logger logger = Logger.getLogger(PasswordUtil.class.getName());

    // Generate random nonce (IV or salt)
    public static byte[] getRandomNonce(int numBytes) {
        byte[] nonce = new byte[numBytes];
        new SecureRandom().nextBytes(nonce);
        return nonce;
    }

    // Generate AES secret key
    public static SecretKey getAESKey(int keysize) throws NoSuchAlgorithmException {
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        keyGen.init(keysize, SecureRandom.getInstanceStrong());
        return keyGen.generateKey();
    }

    // Derive AES key from password and salt
    public static SecretKey getAESKeyFromPassword(char[] password, byte[] salt) {
        try {
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(password, salt, 65536, 256);
            return new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
            logger.log(Level.SEVERE, "Key derivation failed", ex);
            return null;
        }
    }

    /**
     * Encrypt a password using AES-GCM.
     * 
     * @param userIdentifier Unique user identifier (e.g., email) used for key derivation
     * @param password Plaintext password to encrypt
     * @return Base64-encoded string containing IV + salt + ciphertext
     */
    public static String encryptPassword(String userIdentifier, String password) {
        try {
            // Generate random IV and salt
            byte[] iv = getRandomNonce(IV_LENGTH_BYTE);
            byte[] salt = getRandomNonce(SALT_LENGTH_BYTE);

            // Derive key from user identifier and salt
            SecretKey aesKey = getAESKeyFromPassword(userIdentifier.toCharArray(), salt);
            if (aesKey == null) return null;

            // Initialize cipher
            Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
            cipher.init(Cipher.ENCRYPT_MODE, aesKey, new GCMParameterSpec(TAG_LENGTH_BIT, iv));

            // Encrypt
            byte[] cipherText = cipher.doFinal(password.getBytes(UTF_8));

            // Combine IV + salt + ciphertext
            byte[] encryptedData = ByteBuffer.allocate(iv.length + salt.length + cipherText.length)
                .put(iv)
                .put(salt)
                .put(cipherText)
                .array();

            return Base64.getEncoder().encodeToString(encryptedData);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Encryption failed", ex);
            return null;
        }
    }

    /**
     * Decrypt a password using AES-GCM.
     * 
     * @param encryptedPassword Base64-encoded string from encryptPassword()
     * @param userIdentifier Same identifier used during encryption
     * @return Decrypted password or null if failed
     */
    public static String decryptPassword(String encryptedPassword, String userIdentifier) {
        try {
            byte[] decoded = Base64.getDecoder().decode(encryptedPassword);
            ByteBuffer bb = ByteBuffer.wrap(decoded);

            // Extract IV, salt, and ciphertext
            byte[] iv = new byte[IV_LENGTH_BYTE];
            bb.get(iv);

            byte[] salt = new byte[SALT_LENGTH_BYTE];
            bb.get(salt);

            byte[] cipherText = new byte[bb.remaining()];
            bb.get(cipherText);

            // Reconstruct key
            SecretKey aesKey = getAESKeyFromPassword(userIdentifier.toCharArray(), salt);
            if (aesKey == null) return null;

            // Decrypt
            Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
            cipher.init(Cipher.DECRYPT_MODE, aesKey, new GCMParameterSpec(TAG_LENGTH_BIT, iv));
            byte[] plainText = cipher.doFinal(cipherText);

            return new String(plainText, UTF_8);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Decryption failed", ex);
            return null;
        }
    }

    /**
     * Verify a password against its encrypted version.
     */
    public static boolean verifyPassword(String inputPassword, String encryptedPassword, String userIdentifier) {
        try {
            String decryptedPassword = decryptPassword(encryptedPassword, userIdentifier);
            return inputPassword.equals(decryptedPassword);
        } catch (Exception ex) {
            return false;
        }
    }
}