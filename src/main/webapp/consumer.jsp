<%@ page import="java.util.List" %>
<%@ page import="model.Pojo_products" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Consumer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            color: white;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }
        .card-container {
            max-width: 900px;
            margin: auto;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: none;
            color: white;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(255, 255, 255, 0.2);
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }
        .navbar-nav .nav-item .nav-link {
            font-size: 1.2rem;
            padding: 10px 20px;
            transition: all 0.3s ease-in-out;
        }
        .navbar-nav .nav-item .nav-link:hover,
        .navbar-nav .nav-item .nav-link.active {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }
        .dropdown-toggle {
            font-size: 1.2rem;
        }
        .logo {
            width: 50px;
            height: 50px;
            margin-right: 15px;
            border-radius: 50%;
        }
        /* Search Bar Styling */
        #search-bar {
            width: 100%;
            max-width: 400px;
            margin: 0 auto 20px auto;
            border-radius: 25px;
            padding: 10px;
            border: none;
            outline: none;
            font-size: 16px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-dark text-light">
        <div class="container-fluid d-flex align-items-center">
            <img src="logo.png" alt="Logo" class="logo">
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-light active" href="consumerDashboard">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="ordersControllers">Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="cart.jsp">View Cart</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="reportsControllers">Reported Products</a></li>
                </ul>
            </div>
         <!--   <div class="dropdown ms-auto">
                <button class="btn btn-outline-light dropdown-toggle" type="button" id="sellerDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    Seller ID: 12345
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="sellerDropdown">
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><a class="dropdown-item" href="#">Logout</a></li>
                </ul>
            </div> -->
            <% String user = (String) session.getAttribute("portId"); %>
                    <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">Customer ID: <%= user %></button>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="profileControllers">Profile</a></li>
            <li><a class="dropdown-item text-danger" href="loginControllers">Logout</a></li>
          </ul>
        </div>
        </div>
    </nav>

    <!-- Dashboard Content -->
    <div class="container mt-4">
        <h2 class="text-center mb-4">Available Products</h2>

        <!-- Search Bar -->
<input type="text" id="search-bar" class="form-control text-center" placeholder="Search products..." onkeyup="filterProducts()">

<div class="row mt-3" id="product-list">
    <% 
    List<Pojo_products> prod = (List<Pojo_products>) session.getAttribute("prod");
    if (prod != null) {
        for(Pojo_products d: prod) {
    %>
    <div class="col-md-4 mb-4 product-card" data-name="<%= d.getProdName().toLowerCase() %>">
        <div class="card p-4 text-center shadow-lg">
            <h5 class="card-title fw-bold"><%= d.getProdName() %></h5>
            <p class="card-text">Price: ₹ <%= d.getPrice() %></p>
            <a href="productPage?productId=<%= d.getProdId() %>" class="btn btn-warning w-100">View More</a>
        </div>
    </div>
    <% 
        } 
    }
    %>
</div>
    </div>

    <script>
        function filterProducts() {
            let input = document.getElementById("search-bar").value.toLowerCase();
            let products = document.querySelectorAll(".product-card");

            products.forEach(product => {
                let name = product.getAttribute("data-name").toLowerCase();
                if (name.includes(input)) {
                    product.style.display = "block";
                } else {
                    product.style.display = "none";
                }
            });
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>