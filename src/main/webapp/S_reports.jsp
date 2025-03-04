<!DOCTYPE html>
<%@page import="model.Pojo_reports"%>
<%@ page import="java.util.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reported Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            color: white;
            font-family: 'Poppins', sans-serif;
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
        .table {
            color: white;
        }
        .table-dark th {
            background-color: #212529;
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
    </style>
</head>
<body>

<!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-dark text-light">
        <div class="container-fluid d-flex align-items-center">
            <img src="logo.png" alt="Logo" class="logo">
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-light" href="sellerDashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="sellerOrdersControllers">Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="sellerProductManage">Products</a></li>
                    <li class="nav-item"><a class="nav-link text-light active" href="reportSellerControllers">Reported Products</a></li>
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
          <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">Seller ID: <%= user %></button>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="profileControllers">Profile</a></li>
            <li><a class="dropdown-item text-danger" href="loginControllers">Logout</a></li>
          </ul>
        </div>
        </div>
    </nav>

<!-- Reported Products Table -->
<div class="container mt-4">
    <div class="card-container">
        <h2 class="text-center text-light">Reported Products</h2>
        <table class="table table-bordered mt-4 table-dark">
            <thead>
                <tr>
                    <th>Report ID</th>
                    <th>Product ID</th>
                    <th>Issue Type</th>
                    <th>Solution</th>
                    <th>Solution Status</th>
                    <th>Report Date</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Pojo_reports> reports = (List<Pojo_reports>) session.getAttribute("report");
                
                if (reports != null && !reports.isEmpty()) {
                    
                for (Pojo_reports rep : reports) { %>
                <tr>
                    <td>RPT-00<%= rep.getRepId() %></td>
                    <td>P-78<%= rep.getProdId() %></td>
                    <td>
                        <%= rep.getIssueType() %>
                    </td>
                    <td>
                        <%= rep.getSolution() %>
                    </td>
                    <td>
                        <%= rep.getSolutionStatus() %>
                    </td>
                    <td> <%= rep.getReportTime() %> </td>
                </tr>
                <% } } %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
