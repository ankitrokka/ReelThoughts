<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Movies</title>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/movie-page.css">
</head>
<body>

  <!-- Header Section -->
  <header>
    <nav class="navbar">
      <div class="logo">ReelThoughts.</div>
      <div class="search-bar">
        <input type="text" placeholder="Search movies..." id="searchInput" disabled>
      </div>
      <div class="nav-links">
        <a href="#">Recent Releases</a>
        <a href="${pageContext.request.contextPath}/movie">Popular</a>
        <a href="#">News</a>
        <a href="${pageContext.request.contextPath}/userprofile.jsp">
          <i class="fa-regular fa-user"></i>
        </a>
      </div>
    </nav>
  </header>

  <!-- Main Title -->
  <h1>
    <a href="${pageContext.request.contextPath}/Movies" style="text-decoration: none; color: inherit;">🎬 Movies</a>
  </h1>

  <!-- Static Movie Grid -->
  <div class="movie-grid">
    <div class="movie-card">
      <img class="movie-poster" src="images.jpeg" alt="The Dark Knight">
      <div class="movie-content">
        <div class="movie-title">The Dark Knight</div>
        <div class="movie-genre">Action, Crime, Drama</div>
        <div class="movie-rating">★ 9.0 <span class="stars">★★★★☆</span></div>
      </div>
    </div>

    <div class="movie-card">
      <img class="movie-poster" src="https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SY679_.jpg" alt="Inception">
      <div class="movie-content">
        <div class="movie-title">Inception</div>
        <div class="movie-genre">Action, Sci-Fi, Thriller</div>
        <div class="movie-rating">★ 8.8 <span class="stars">★★★★☆</span></div>
      </div>
    </div>

    <div class="movie-card">
      <img class="movie-poster" src="i.jpeg" alt="Interstellar">
      <div class="movie-content">
        <div class="movie-title">Interstellar</div>
        <div class="movie-genre">Adventure, Drama, Sci-Fi</div>
        <div class="movie-rating">★ 8.6 <span class="stars">★★★★☆</span></div>
      </div>
    </div>

    <div class="movie-card">
      <img class="movie-poster" src="n.jpeg" alt="The Shawshank Redemption">
      <div class="movie-content">
        <div class="movie-title">The Shawshank Redemption</div>
        <div class="movie-genre">Drama</div>
        <div class="movie-rating">★ 9.3 <span class="stars">★★★★★</span></div>
      </div>
    </div>

    <div class="movie-card">
      <img class="movie-poster" src="https://m.media-amazon.com/images/I/71c05lTE03L._AC_SY679_.jpg" alt="Pulp Fiction">
      <div class="movie-content">
        <div class="movie-title">Pulp Fiction</div>
        <div class="movie-genre">Crime, Drama</div>
        <div class="movie-rating">★ 8.9 <span class="stars">★★★★☆</span></div>
      </div>
    </div>
  </div>

</body>
</html>
