<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/home.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/header.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<script src="https://kit.fontawesome.com/your-kit-code.js" crossorigin="anonymous"></script>

</head>
<body>
	<!-- Header -->
    <header>
        <nav class="navbar">
            <a href="#" class="logo">ReelThoughts</a>
            
            <div class="nav-links">
                <a href="#">Home</a>
                <a href="#">Movies</a>
                <a href="#">TV Shows</a>
                <a href="#">News</a>
            </div>
            
            <div class="search-bar">
                <input type="text" placeholder="Search movies, TV shows...">
            </div>
            
            <div class="auth-buttons">
                <a href="#" class="login">Log In</a>
                <a href="#" class="signup">Sign Up</a>
            </div>
        </nav>
    </header>

    <main class="container">
        <section class="movie-slider">
            <div class="slider-container">
              <div class="slider-wrapper">
                <!-- Slide 1 -->
                <div class="slide">
                  <img src="images/batman.avif" alt="" />
                  <div class="slide-info">
                    <h3>The Batman</h3>
                    <div class="movie-meta">
                      <span class="rating"><i class="fas fa-star"></i> 8.1</span>
                      <span>2022</span>
                      <span>2h 56m</span>
                    </div>
                    <button class="watch-now">Watch Now</button>
                  </div>
                </div>
          
                <!-- Slide 2 -->
                <div class="slide">
                  <img src="images/topgun.jpeg" alt="Top Gun : Maverick" />
                  <div class="slide-info">
                    <h3>Top Gun : Maverick</h3>
                    <div class="movie-meta">
                      <span class="rating"><i class="fas fa-star"></i> 8.2</span>
                      <span>2022</span>
                      <span>2h 10m</span>
                    </div>
                    <button class="watch-now">Watch Now</button>
                  </div>
                </div>
              </div>
          
              <!-- Dots for aesthetics -->
              <div class="slider-dots">
                <span class="dot active"></span>
                <span class="dot"></span>
              </div>
            </div>
          </section>
          <!-- Most Popular Section -->
<section class="most-popular-section">
    <div class="section-header">
        <h2>Most Popular</h2>
        <a href="#" class="see-all">See All</a>
    </div>
    <div class="movie-grid">
        <!-- Movie Card 1 -->
        <div class="movie-card">
            <div class="movie-poster">
                <img src="images/matrix.jpg" alt="Movie Poster">
                <div class="rating-badge">8.7</div>
            </div>
            <div class="movie-info">
                <h3>The Matrix</h3>
                <p class="meta">1999 • Sci-Fi • 2h 16m</p>
                <div class="actions">
                    <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                    <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                </div>
            </div>
        </div>

        <!-- Movie Card 2 -->
        <div class="movie-card">
            <div class="movie-poster">
                <img src="images/interstellar.jpg" alt="Movie Poster">
                <div class="rating-badge">8.6</div>
            </div>
            <div class="movie-info">
                <h3>Interstellar</h3>
                <p class="meta">2014 • Sci-Fi • 2h 49m</p>
                <div class="actions">
                    <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                    <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                </div>
            </div>
        </div>

        <!-- Movie Card 3 -->
        <div class="movie-card">
            <div class="movie-poster">
                <img src="images/inception.webp" alt="Movie Poster">
                <div class="rating-badge">8.8</div>
            </div>
            <div class="movie-info">
                <h3>Inception</h3>
                <p class="meta">2010 • Sci-Fi • 2h 28m</p>
                <div class="actions">
                    <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                    <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                </div>
            </div>
        </div>

        <!-- Movie Card 4 -->
        <div class="movie-card">
            <div class="movie-poster">
                <img src="images/avatar.jpg" alt="Movie Poster">
                <div class="rating-badge">7.8</div>
            </div>
            <div class="movie-info">
                <h3>Avatar</h3>
                <p class="meta">2009 • Action • 2h 42m</p>
                <div class="actions">
                    <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                    <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                </div>
            </div>
        </div>

        <!-- Movie Card 5 -->
        <div class="movie-card">
            <div class="movie-poster">
                <img src="images/spiderman.jpg" alt="Movie Poster">
                <div class="rating-badge">8.4</div>
            </div>
            <div class="movie-info">
                <h3>Spider-Man: No Way Home</h3>
                <p class="meta">2021 • Action • 2h 28m</p>
                <div class="actions">
                    <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                    <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                </div>
            </div>
        </div>
    </div>
</section>

          
        <!-- Trending Movies Section -->
        <section class="trending-section">
            <div class="section-header">
                <h2>Trending This Week</h2>
                <a href="#" class="see-all">See All</a>
            </div>
            <div class="movie-grid">
                <!-- Movie Card 1 -->
                <div class="movie-card">
                    <div class="movie-poster">
                        <img src="images/dune.jpg" alt="Movie Poster">
                        <div class="rating-badge">8.7</div>
                    </div>
                    <div class="movie-info">
                        <h3>Dune: Part Two</h3>
                        <p class="meta">2024 • Sci-Fi • 2h 46m</p>
                        <div class="actions">
                            <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                            <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                        </div>
                    </div>
                </div>

                <!-- Movie Card 2 -->
                <div class="movie-card">
                    <div class="movie-poster">
                        <img src="images/openheimer.jpg" alt="Movie Poster">
                        <div class="rating-badge">7.9</div>
                    </div>
                    <div class="movie-info">
                        <h3>Oppenheimer</h3>
                        <p class="meta">2023 • Biography • 3h</p>
                        <div class="actions">
                            <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                            <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                        </div>
                    </div>
                </div>

                <!-- Movie Card 3 -->
                <div class="movie-card">
                    <div class="movie-poster">
                        <img src="images/the godfather.jpg" alt="Movie Poster">
                        <div class="rating-badge">9.1</div>
                    </div>
                    <div class="movie-info">
                        <h3>The Godfather</h3>
                        <p class="meta">1972 • Crime • 2h 55m</p>
                        <div class="actions">
                            <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                            <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                        </div>
                    </div>
                </div>

                <!-- Movie Card 4 -->
                <div class="movie-card">

                    <div class="movie-poster">
                        <img src="images/parasite.jpg" alt="Movie Poster">
                        <div class="rating-badge">8.4</div>
                    </div>
                    <div class="movie-info">
                        <h3>Parasite</h3>
                        <p class="meta">2019 • Thriller • 2h 12m</p>
                        <div class="actions">
                            <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                            <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                        </div>
                    </div>
                </div>

                <!-- Movie Card 5 -->
                <div class="movie-card">

                    <div class="movie-poster">
                        <img src="images/snowhite.jpg" alt="Movie Poster">
                        <div class="rating-badge">1.6</div>
                    </div>
                    <div class="movie-info">
                        <h3>Snowwhite</h3>
                        <p class="meta">2025 • Fantasy • 1h 49m</p>
                        <div class="actions">
                            <button class="watchlist-btn"><i class="far fa-bookmark"></i> Watchlist</button>
                            <button class="rate-btn"><i class="far fa-star"></i> Rate</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- New Releases Section -->
      

        <!-- Community Highlights -->
        <section class="community-section">
            <div class="section-header">
                <h2>Community Highlights</h2>
            </div>
            <div class="community-grid">
                <div class="highlight-card review-card">
                    <div class="user-info">
                        <img src="images/user avatar.avif" alt="User avatar" class="user-avatar">
                        <span class="username">@filmcritic101</span>
                    </div>
                    <div class="review-content">
                        <h3>Review of "Everything Everywhere All at Once"</h3>
                        <div class="star-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span>4.5/5</span>
                        </div>
                        <p class="review-excerpt">"A mind-bending masterpiece that combines multiverse theory with heartfelt family drama..."</p>
                        <a href="#" class="read-more">Read full review</a>
                    </div>
                </div>

                <div class="highlight-card list-card">
                    <h3>Top 10 Sci-Fi Movies of the Decade</h3>
                    <p class="list-author">by @scifilover</p>
                    <ul class="list-preview">
                        <li>1. Dune (2021)</li>
                        <li>2. Arrival (2016)</li>
                        <li>3. Ex Machina (2014)</li>
                    </ul>
                    <a href="#" class="read-more">View full list</a>
                </div>
            </div>
        </section>

        <!-- Newsletter Signup -->
        <section class="newsletter">
            <div class="newsletter-content">
                <h2>Stay Updated</h2>
                <p>Subscribe to our newsletter for weekly movie recommendations and community highlights</p>
                <form class="signup-form">
                    <input type="email" placeholder="Your email address">
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </section>
    </main>

   
    <!-- slider for the homepage-->
    <script>
        const sliderWrapper = document.querySelector(".slider-wrapper");
        const slides = document.querySelectorAll(".slide");
        const dots = document.querySelectorAll(".dot");
        let currentIndex = 0;
      
        function updateSlider() {
          const slideWidth = slides[0].clientWidth;
          sliderWrapper.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
      
          dots.forEach(dot => dot.classList.remove("active"));
          if (dots[currentIndex]) dots[currentIndex].classList.add("active");
        }
      
        function autoSlide() {
          currentIndex = (currentIndex + 1) % slides.length;
          updateSlider();
        }
      
        let slideInterval = setInterval(autoSlide, 6000);
      
        function resetInterval() {
          clearInterval(slideInterval);
          slideInterval = setInterval(autoSlide, 6000);
        }
      
        dots.forEach((dot, index) => {
          dot.addEventListener("click", () => {
            currentIndex = index;
            updateSlider();
            resetInterval();
          });
        });
      
        const nextBtn = document.createElement("button");
        nextBtn.innerText = "Next";
        nextBtn.classList.add("next-slide-btn");
        document.querySelector(".slider-container").appendChild(nextBtn);
      
        nextBtn.addEventListener("click", () => {
          currentIndex = (currentIndex + 1) % slides.length;
          updateSlider();
          resetInterval();
        });
      
        // Initial setup
        updateSlider();
      </script>
      
      
	
</body>
</html>