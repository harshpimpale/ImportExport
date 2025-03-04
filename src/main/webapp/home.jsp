
<!doctype html>
<html lang="en">
    <head>
        <title>Import Export System</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
        <link rel="icon" type="image/x-icon" href="favicon.ico">
    </head>

    <body>
        <header>
            <nav
                class="navbar navbar-expand-sm navbar-dark bg-black"
            >
                <div class="container">
                    <a class="navbar-brand" href="#"><img
                        src="logo.png"
                        class="img-fluid rounded-circle"
                        alt=""
                        height="100px"
                        width="100px"
                    />
                    </a>
                    <button
                        class="navbar-toggler d-lg-none"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapsibleNavId"
                        aria-controls="collapsibleNavId"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                    >
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="collapsibleNavId">
                        <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" href="home.jsp" aria-current="page"
                                    >Home
                                    <span class="visually-hidden">(current)</span></a
                                >
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link active" href="about_us.jsp" aria-current="page"
                                    >About Us
                                    <span class="visually-hidden">(current)</span></a
                                >
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="contact_us.jsp" aria-current="page"
                                    >Contact Us
                                    <span class="visually-hidden">(current)</span></a
                                >
                            </li>
                            
                            
                        </ul>
                        <form class="d-flex my-2 my-lg-0" action="register.jsp">
                            
                            <button
                                class="btn btn-outline-success my-2 my-sm-0"
                                type="submit"
                            >
                                Register 
                            </button>
                        </form>
                        <form class="d-flex my-2 my-lg-0" action="login.jsp">
                            
                            <button
                                class="btn btn-outline-success my-2 my-sm-0"
                                type="submit"
                            >
                                Login 
                            </button>
                        </form>
                    </div>
                </div>
            </nav>
            
        </header>
        <main>

            <div
                class="container"
            >
            <h1 class="text-center fst-italic fw-bold my-2">Welcome to Import Export System</h1>
                <div id="carouselId" class="carousel slide my-5" data-bs-ride="carousel">
                    <ol class="carousel-indicators">
                        <li
                            data-bs-target="#carouselId"
                            data-bs-slide-to="0"
                            class="active"
                            aria-current="true"
                            aria-label="First slide"
                        ></li>
                        <li
                            data-bs-target="#carouselId"
                            data-bs-slide-to="1"
                            aria-label="Second slide"
                        ></li>
                        <li
                            data-bs-target="#carouselId"
                            data-bs-slide-to="2"
                            aria-label="Third slide"
                        ></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img
                                src="https://images.unsplash.com/photo-1578575437130-527eed3abbec?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1wb3J0JTIwZXhwb3J0fGVufDB8fDB8fHww"
                                class="w-100 d-block"
                                alt="First slide"
                                height="650px"
                            />
                        </div>
                        <div class="carousel-item">
                            <img
                                src="https://plus.unsplash.com/premium_photo-1661879449050-069f67e200bd?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1wb3J0JTIwZXhwb3J0fGVufDB8fDB8fHww"
                                class="w-100 d-block"
                                alt="Second slide"
                                height="650px"
                            />
                        </div>
                        <div class="carousel-item">
                            <img
                                src="https://c0.wallpaperflare.com/preview/446/180/836/cargo-containers-crate-export-import.jpg"
                                class="w-100 d-block"
                                alt="Third slide"
                                height="650px"
                            />
                        </div>
                    </div>
                    <button
                        class="carousel-control-prev"
                        type="button"
                        data-bs-target="#carouselId"
                        data-bs-slide="prev"
                    >
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button
                        class="carousel-control-next"
                        type="button"
                        data-bs-target="#carouselId"
                        data-bs-slide="next"
                    >
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                
            </div>

            <div
                class="container my-5"
            >
                <h1 class="text-center">Our Services</h1>
                <div
                    class="row justify-content-center align-items-center g-2"
                >
                    <div class="col-4"><div class="card">
                        <img class="card-img-top" src="data:image/jpeg;base64,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" />
                        <div class="card-body text-center">
                            <h4 class="card-title">Tech Products</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam ad harum, distinctio quos nihil dolorem nesciunt provident doloremque quisquam. Odio?</p>
                            <a
                                name=""
                                id=""
                                class="btn btn-primary"
                                href="services.html"
                                role="button"
                                >For More..</a
                            >
                            
                        </div>
                    </div>
                    </div>
                    <div class="col-4"><div class="card">
                        <img class="card-img-top" height="260px" weight="260px"
                        src="https://www.agrknowledge.com/wp-content/uploads/2022/05/indusrial.jpg" />
                        <div class="card-body text-center">
                            <h4 class="card-title">Industrial & Engineering Goods</h4>
                            <p class="card-text">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ducimus vitae repellat similique modi animi. Voluptatibus dignissimos tempora accusantium magni facilis?</p>
                            <a
                                name=""
                                id=""
                                class="btn btn-primary"
                                href="services.html"
                                role="button"
                                >For More..</a
                            >
                        </div>
                    </div></div>
                    <div class="col-4"><div class="card">
                        <img class="card-img-top" height="270px" weight="270px" src="https://images.unsplash.com/photo-1607619056574-7b8d3ee536b2?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGhhcm1hY2V1dGljYWx8ZW58MHx8MHx8fDA%3D" />
                        <div class="card-body text-center">
                            <h4 class="card-title">Chemicals & Pharmaceuticals</h4>
                            <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit mollitia facere rerum animi laudantium. Ex dolor officiis nihil perferendis assumenda?</p>
                            <a
                                name=""
                                id=""
                                class="btn btn-primary"
                                href="services.html"
                                role="button"
                                >For More..</a
                            >
                        </div>
                    </div></div>
                </div>
                
            </div>


            


            
            
        </main>
        <footer>
            <!-- place footer here -->
             <div
              class="container-fluid bg-black text-center text-white"
             >
             <h4> &copy; 2025 Global Import-Export Solutions. All Rights Reserved.</h4>
             </div>
             
            <!--Footer ends-->
          </footer>
        <!-- Bootstrap JavaScript Libraries -->
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
