// Simple Slider Functionality
let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const dots = document.querySelectorAll('.dot');

function showSlide(n) {
    slides.forEach(slide => slide.classList.remove('active'));
    dots.forEach(dot => dot.classList.remove('active'));
    
    currentSlide = (n + slides.length) % slides.length;
    slides[currentSlide].classList.add('active');
    dots[currentSlide].classList.add('active');
}

// Auto-advance every 5 seconds
setInterval(() => showSlide(currentSlide + 1), 5000);

// Click handlers for dots
dots.forEach((dot, index) => {
    dot.addEventListener('click', () => showSlide(index));
});