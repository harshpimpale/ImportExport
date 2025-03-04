
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contact Us</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <style>
        /* General Styling */
        body {
            background-color: #f8f9fa;
        }
        .container-center {
            max-width: 700px;
            margin: auto;
        }
        .hidden {
            display: none;
        }

        /* Header Text Styling */
        .section-title {
            font-size: 36px;
            font-weight: bold;
            color: #000306;
            text-transform: uppercase;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }
        .sub-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            text-transform: capitalize;
            margin-bottom: 15px;
        }

        /* Table Styling */
        .table th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
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

<!-- Contact Us Section -->
<main class="text-center my-5">
    <h2 class="section-title">Contact Us</h2>

    <!-- Contact Information Table -->
    <div class="container-center">
        <table class="table table-bordered text-center mt-4">
            <thead>
                <tr>
                    <th scope="col">Information</th>
                    <th scope="col">Details</th>
                </tr>
            </thead>
            <tbody>
                <tr class="table-primary">
                    <td>Company Name</td>
                    <td>Global Import-Export Solutions</td>
                </tr>
                <tr class="table-danger">
                    <td>Address</td>
                    <td>Borivali, Mumbai, India</td>
                </tr>
                <tr class="table-warning">
                    <td>Phone No.</td>
                    <td>+91 9125425054</td>
                </tr>
                <tr class="table-info">
                    <td>Email</td>
                    <td>support@globalimportexport.com</td>
                </tr>
                <tr class="table-success">
                    <td>Working Hours</td>
                    <td>Mon - Fri: 9 AM - 6 PM</td>
                </tr>
                <tr class="table-secondary">
                    <td>Website</td>
                    <td><a href="https://globalimportexport.com" target="_blank">globalimportexport.com</a></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Contact Form -->
    <h3 class="sub-title">Have a Query?</h3>
    <div class="container-center">
        <form id="contactForm">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="name" placeholder="Your Name" required>
                <label for="name">Name</label>
            </div>

            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" placeholder="Your Email" required>
                <label for="email">Email</label>
            </div>

            <div class="form-floating mb-3">
                <textarea class="form-control" id="query" placeholder="Your Query" required></textarea>
                <label for="query">Query</label>
            </div>

            <button type="submit" class="btn btn-primary w-100">Submit</button>
        </form>

        <!-- Success Message -->
        <div id="successMessage" class="alert alert-success mt-3 hidden">
            Submitted Successfully! We will get back to you soon.
        </div>
    </div>

    <!-- Google Map -->
    <div class="container-center mt-4">
        <iframe 
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3767.1886795754394!2d72.85147417498148!3d19.23060708200608!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b02a94fea373%3A0xb6acbbcdd3cf39ce!2sSDAC%20Infotech!5e0!3m2!1sen!2sin!4v1739011487031!5m2!1sen!2sin"
            width="100%" height="350" style="border:0;" allowfullscreen loading="lazy"></iframe>
    </div>
</main>

<!-- Footer -->
<footer class="bg-black text-white text-center py-3 mt-5">
    <h4>&copy; 2025 Global Import-Export Solutions. All Rights Reserved.</h4>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Form Submission Script -->
<script>
    document.getElementById("contactForm").addEventListener("submit", function(event) {
        event.preventDefault();
        document.getElementById("successMessage").classList.remove("hidden");
        setTimeout(() => {
            document.getElementById("successMessage").classList.add("hidden");
        }, 3000);
    });

    const isLoggedIn = true;
    const role = "consumer";
    const username = "JohnDoe";

    if (isLoggedIn) {
        document.getElementById("username").classList.remove("d-none");
        document.getElementById("user-name").innerText = username;
        if (role === "consumer") {
            document.getElementById("orders").classList.remove("d-none");
        }
    }
</script>
</body>
</html>
