<%@ page import="java.util.List, model.Pojo_orders" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Orders</title>
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
        .btn-update {
            background-color: #ffc107;
            color: black;
            border: none;
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
    <nav class="navbar navbar-expand-lg bg-dark text-light">
        <div class="container-fluid d-flex align-items-center">
            <img src="logo.png" alt="Logo" class="logo">
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-light" href="sellerDashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link text-light active" href="sellerOrdersControllers">Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="sellerProductManage">Products</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="reportSellerControllers">Reported Products</a></li>
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

    <div class="container mt-5">
        <div class="card-container">
            <% List<Pojo_orders> orders = (List<Pojo_orders>) request.getAttribute("orders"); %>

            <% if (orders == null || orders.isEmpty()) { %>
                <p class="text-center text-danger">No orders found.</p>
            <% } else { %>
                <h3 class="text-center text-light">Order Products List</h3>
                <table class="table table-bordered mt-4 table-dark">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Consumer ID</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Order Date</th>
                            <th>Status</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Pojo_orders order : orders) { %>
                            <tr>
                                <td><%= order.getOrdId() %></td>
                                <td><%= order.getConsID() %></td>
                                <td><%= order.getProdName() %></td>
                                <td><%= order.getQuant() %></td>
                                <td><%= order.getOrdDate() %></td>
                                <td id="status_<%= order.getOrdId() %>">
                                    <%= order.isDelivered() ? "<span class='badge bg-success'>Delivered</span>" :
                                        order.isOutDelivery() ? "<span class='badge bg-warning'>Out for Delivery</span>" :
                                        order.isShipped() ? "<span class='badge bg-primary'>Shipped</span>" :
                                        	"<span class='badge bg-info'>Order Placed</span>"%>
                                </td>
                                <td>
                                    <button class="btn btn-sm btn-update" onclick="openUpdateModal('<%= order.getOrdId() %>')">Update</button>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>
    </div>

    <!-- Status Update Modal -->
    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content text-dark">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">Update Order Status</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="updateForm" method="post" action="sellerOrdersControllers">
                        <input type="hidden" name="orderId" id="modalOrderId">
                        <div class="mb-3">
                            <label class="form-label">Select New Status</label>
                            <select class="form-select" name="status" id="modalStatus">
                                <option value="Order Placed">Order Placed</option>
                                <option value="Shipped">Shipped</option>
                                <option value="Out for Delivery">Out for Delivery</option>
                                <option value="Delivered">Delivered</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openUpdateModal(orderId) {
            document.getElementById('modalOrderId').value = orderId;
            var updateModal = new bootstrap.Modal(document.getElementById('updateModal'));
            updateModal.show();
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
