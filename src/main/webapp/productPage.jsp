<%@ page import="model.Pojo_products" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Details</title>
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
            max-width: 800px;
            margin: auto;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }
        .card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: none;
            color: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: scale(1.02);
            box-shadow: 0 10px 20px rgba(255, 255, 255, 0.2);
        }
        .btn-warning {
            width: 100%;
            font-size: 1.2rem;
        }
        .logo {
            width: 50px;
            height: 50px;
            margin-right: 15px;
            border-radius: 50%;
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
    </style>
    
 <% 
	String id = (String) session.getAttribute("portId");
	String role = (String) session.getAttribute("role");
//	
	if (id == null || id.isBlank()) { // Correct way (Java 11+)
	    response.sendRedirect("loginControllers");
	    return; // Essential: Stop further processing
	}
	if (role == null || role.isBlank() || role.equals("seller")) { // Correct way (Java 11+)
		response.sendRedirect("loginControllers");
		return; // Essential: Stop further processing
	}
 %>
 
</head>
<body >
    <nav class="navbar navbar-expand-lg bg-dark text-light">
        <div class="container-fluid d-flex align-items-center">
            <img src="logo.png" alt="Logo" class="logo">
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-light" href="consumerDashboard">Home</a></li>
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
                    <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">Customer ID: <%= id %></button>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="profileControllers">Profile</a></li>
            <li><a class="dropdown-item text-danger" href="loginControllers">Logout</a></li>
          </ul>
        </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="card-container">
            <% Pojo_products product = (Pojo_products) request.getAttribute("product"); %>
      <form id="cartForm" action="addToCart" method="GET" target="hiddenFrame">
    <input type="hidden" name="productId" id="productId">
</form>
            <!-- Hidden Iframe to Prevent Refresh -->
<iframe name="hiddenFrame" style="display:none;" onload="handleCartResponse()"></iframe>

            <% if (product != null) { %>
                <div class="card p-4 text-center shadow-lg">
                    <h2 class="card-title fw-bold"><%= product.getProdName() %></h2>
                    <p class="card-text">Price: &#8377; <%= product.getPrice() %></p>
                    <p class="card-text">Description: This is description for <%= product.getProdName() %></p>
                    <button class="btn btn-warning" onclick="addToCart(<%= product.getProdId() %>)">Add to Cart</button>
                </div>
            <% } else { %>
                <p class="text-center">Product not found.</p>
            <% } %>
        </div>
    </div>
    <div id="alert-box" class="alert-box">✅ Product added to cart!</div>
    
 <style>
    .alert-box {
        display: none;
        position: fixed;
        bottom: 20px;
        left: 50%;
        transform: translateX(-50%);
        background: rgba(0, 255, 0, 0.9);
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        box-shadow: 0px 0px 10px rgba(0, 255, 0, 0.3);
        transition: opacity 0.5s ease-in-out;
    }
    .fade-out {
        opacity: 0;
    }
</style>

<script>
    function addToCart(productId) {
        document.getElementById("productId").value = productId;
        document.getElementById("cartForm").submit(); // Submit the form without reloading
    }

    function handleCartResponse() {
        let alertBox = document.getElementById("alert-box");

        // Make sure the alert box exists
        if (!alertBox) return;

        alertBox.innerText = "✅ Product added to cart!";
        alertBox.style.display = "block";
        alertBox.style.opacity = "1"; // Ensure it's fully visible

        // Fade out the alert after 3 seconds
        setTimeout(() => {
            alertBox.style.opacity = "0";
            setTimeout(() => alertBox.style.display = "none", 500);
        }, 3000);
    }

</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
