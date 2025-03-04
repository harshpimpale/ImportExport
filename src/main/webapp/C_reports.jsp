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
                    <li class="nav-item"><a class="nav-link text-light" href="consumerDashboard">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="ordersControllers">Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="cart.jsp">View Cart</a></li>
                    <li class="nav-item"><a class="nav-link text-light active" href="reportsControllers">Reported Products</a></li>
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
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Pojo_reports> reports = (List<Pojo_reports>) session.getAttribute("report");
                
                if (reports != null && !reports.isEmpty()) {
                
                for (Pojo_reports rep : reports) { %>
                <tr>
                    <td>RPT-00<%= rep.getRepId() %></td>
                    <td><%= rep.getProdId() %></td>
                    <td>
                     
                        <%= rep.getIssueType() %>
                    </td>
                    <td>
                        <%= rep.getSolution() %>
                    </td>
                    <td>
                        <%= rep.getSolutionStatus() %>
                    </td>
                    <td><%= rep.getReportTime() %></td>
                    <td>
                        <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#cancelReportModal<%= rep.getRepId() %>">Cancel Report</button>
                    </td>
                </tr>
                <% } } %>
            </tbody>
        </table>
    </div>
</div>

        <%            
        	if (reports != null && !reports.isEmpty()) {
            for (Pojo_reports rep : reports) { %>
                        <!-- Cancel Report Modal -->
                <div class="modal fade" id="cancelReportModal<%= rep.getRepId() %>" tabindex="-1" aria-labelledby="cancelReportModal<%= rep.getRepId() %>" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content text-dark">
                            <div class="modal-header bg-danger text-white">
                                <h5 class="modal-title">Cancel Report</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                            </div>
                            <form action="reportsControllers" method="post">
                            <div class="modal-body">
                                <p>Are you sure you want to cancel this report?</p>
                                <p><strong>Report ID:</strong> RPT-00<%= rep.getRepId() %></p>
                                <p><strong>Product ID:</strong> <%= rep.getProdId() %></p>
                                <p><strong>Issue:</strong> <%= rep.getIssueType() %></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" value="<%= rep.getRepId() %>" name="reporter" class="btn btn-danger">Confirm Cancel</button>
                            </div>
                           </form>
                        </div>
                    </div>
                </div>
            <% }} %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>