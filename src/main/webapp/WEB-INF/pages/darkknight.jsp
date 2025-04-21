<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>The Dark Knight</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/darkknight.css">
</head>
<body>
  <div class="container">
    <a class="back" href="page.jsp">← Back to Home</a>

    <div class="top-section">
      <img class="poster" src="images.jpeg" alt="The Dark Knight Poster">
      <div class="trailer-wrapper">
        <img class="main-img" src="https://i.ytimg.com/vi/EXeTwQWrcwY/maxresdefault.jpg" alt="The Dark Knight Trailer Thumbnail">
        <a href="https://youtu.be/EXeTwQWrcwY?si=hhfXhpxwr022xQFB" target="_blank">
          <button class="play-trailer-btn">▶ Play Now Trailer</button>
        </a>
      </div>
    </div>

    <div class="tags">
      <span class="tag">Action</span>
      <span class="tag">Crime</span>
      <span class="tag">Drama</span>
      <span class="tag">Thriller</span>
      <span class="tag">Superhero</span>
    </div>

    <div class="description">
      Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, he sets out to dismantle the remaining criminal organizations that plague the city streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.
    </div>

    <div class="release-info">
      <p><strong>Release Date:</strong> July 18, 2008</p>
      <p><strong>Genre:</strong> Action, Crime, Drama, Thriller, Superhero</p>
    </div>

    <div class="info">
      <p><strong>Director:</strong> <a href="#">Christopher Nolan</a></p>
      <p><strong>Stars:</strong> <a href="#">Christian Bale</a>, <a href="#">Heath Ledger</a>, <a href="#">Aaron Eckhart</a></p>
    </div>

    <div class="bottom-section">
      <div class="box">
        <div class="rating">★ 9.0 / 10</div>
        <p>Based on 2.8 million ratings</p>
      </div>

      <div class="box">
        <p>5M liked this</p>
        <p>245K favorites</p>
        <p><a href="#" class="button">Add to Watchlist</a></p>
      </div>
    </div>

    <div class="top-cast">
      <h2>Top Cast</h2>
      <div class="cast-grid">
        <div class="cast-member">
          <img src="C.jpeg" alt="Christian Bale">
          <div class="name">Christian Bale</div>
          <div class="role">Bruce Wayne / Batman</div>
        </div>
        <div class="cast-member">
          <img src="H.jpg" alt="Heath Ledger">
          <div class="name">Heath Ledger</div>
          <div class="role">Joker</div>
        </div>
        <div class="cast-member">
          <img src="A.jpg" alt="Aaron Eckhart">
          <div class="name">Aaron Eckhart</div>
          <div class="role">Harvey Dent</div>
        </div>
        <div class="cast-member">
          <img src="Unknown.jpeg" alt="Unknown Cast">
          <div class="name">Gary Oldman</div>
          <div class="role">James Gordon</div>
        </div>
        <div class="cast-member">
          <img src="Unknown2.jpeg" alt="Unknown Cast">
          <div class="name">Michael Caine</div>
          <div class="role">Alfred</div>
        </div>
        <div class="cast-member">
          <img src="Unknown3.jpeg" alt="Unknown Cast">
          <div class="name">Maggie Gyllenhaal</div>
          <div class="role">Rachel Dawes</div>
        </div>
      </div>
    </div>

    <div class="top-picks">
      <h2>Top Picks</h2>
      <div class="picks-grid">
        <div class="pick">
          <img src="https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SY679_.jpg" alt="Inception">
          <h3>Inception</h3>
          <p>A mind-bending thriller where dreams and reality collide, directed by Christopher Nolan.</p>
          <a href="#" class="button">+ Add to Watchlist</a>
        </div>
        <!-- You can add more picks here -->
      </div>
    </div>

    <div class="user-reviews">
      <h2>User Reviews</h2>
      <div class="review-bar"><span>5 Stars</span><div class="bar bar-1"></div></div>
      <div class="review-bar"><span>4 Stars</span><div class="bar bar-2"></div></div>
      <div class="review-bar"><span>3 Stars</span><div class="bar bar-3"></div></div>
      <div class="review-bar"><span>2 Stars</span><div class="bar bar-4"></div></div>
    </div>
  </div>
</body>
</html>
