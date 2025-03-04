<%@ page import="java.util.Map" %>
<%@ page import="model.Pojo_products" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            color: white;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
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
        .cart-container {
            max-width: 700px;
            margin: auto;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }
        .cart-item {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        .btn-primary {
            background: #f39c12;
            border: none;
        }
        .btn-primary:hover {
            background: #e67e22;
        }
        .alert-box {
            display: none;
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(0, 255, 0, 0.9);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 255, 0, 0.3);
            transition: opacity 0.5s ease-in-out;
        }
        .logo {
            width: 50px;
            height: 50px;
            margin-right: 15px;
            border-radius: 50%;
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
<body>


    <nav class="navbar navbar-expand-lg bg-dark text-light">
        <div class="container-fluid d-flex align-items-center">
            <img src="logo.png" alt="Logo" class="logo">
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-light" href="consumerDashboard">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="ordersControllers">Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-light active" href="cart.jsp">View Cart</a></li>
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

<div class="container mt-4">
    <h2 class="text-center mb-4">Shopping Cart</h2>
    <div class="cart-container">
        <% 
            // Retrieve cart from session
            Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
            }

            List<Pojo_products> productList = new ArrayList<>();
            double totalPrice = 0;

            if (!cart.isEmpty()) {
                for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                    Pojo_products product = new Pojo_products().getProductById(entry.getKey());
                    int quantity = entry.getValue();
                    totalPrice += product.getPrice() * quantity;
                    productList.add(product);
        %>
        <form action="addToCart" method="post">
            <div class="cart-item d-flex justify-content-between align-items-center">
                <div>
                    <h5>Product : <%= product.getProdName() %></h5>
                    <p>Price: ₹<%= product.getPrice() %></p>
                </div>
                <div>
                    <input type="number" name="quantity_<%= product.getProdId() %>" value="<%= quantity %>" min="1" class="form-control text-center" style="width: 60px;">
                </div>
            </div>
            <% } } else { %>
            <p class="text-center">Your cart is empty.</p>
            <% } %>
            
            <% if (!cart.isEmpty()) { %>
            <h4 class="text-center">Total: ₹<%= totalPrice %></h4>
            <div class="text-center">
                <button type="submit" name="action" value="update"  class="btn btn-primary">Update Cart</button>
                <button type="submit" name="action" value="checkout" class="btn btn-success" >Proceed to Checkout</button>
            </div>
            <% } %>
        </form>
    </div>
</div>

<!-- Checkout Alert Box -->
<%
    String checkoutMessage = (String) session.getAttribute("checkoutSuccess");
    if (checkoutMessage != null) {
%>
    <div class="alert-box" id="alert-box">
        <%= checkoutMessage %>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let alertBox = document.getElementById("alert-box");
            if (alertBox) {
                alertBox.style.display = "block";
                setTimeout(() => {
                    alertBox.style.opacity = "0";
                    setTimeout(() => alertBox.style.display = "none", 500);
                }, 3000);
            }
        });
    </script>
<%
    session.removeAttribute("checkoutSuccess"); // Clear message after displaying
    session.removeAttribute("cart"); // Clear cart after checkout
}
%>

</body>
</html>
