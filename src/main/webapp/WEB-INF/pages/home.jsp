<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/header.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<script src="https://kit.fontawesome.com/your-kit-code.js" crossorigin="anonymous"></script>



</head>
<body>
	<div id="header">
		<header>
        <nav class="navbar">
            <div class="logo">ReelThoughts.</div>
            <div class="search-bar">
                <input type="text" placeholder="Search movies...">
            </div>
            <div class="nav-links">
                <a href="#">Recent Releases</a>
                <a href="#">Popular</a>
                <a href="#">News</a>
                <a href="userprofile.jsp"><i class="fa-regular fa-user"></i></a>
            </div>
        </nav>
    </header>
	
	<div id="footer">
	<p>&copy; 2024 Your Company Name. All rights reserved.</p>
	<ul>
		<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
		<li><a href="#"><i class="fab fa-twitter"></i></a></li>
		<li><a href="#"><i class="fab fa-instagram"></i></a></li>
	</ul>
	<a href="contact.jsp">Contact Us</a>
</div>
</div>
	
</body>
</html>