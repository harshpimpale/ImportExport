<%@ page import="java.util.List" %>
<%@ page import="model.Pojo_orders" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="favicon.ico">    
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
<body >

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-dark text-light">
        <div class="container-fluid d-flex align-items-center">
            <img src="logo.png" alt="Logo" class="logo">
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-light" href="consumerDashboard">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-light active" href="ordersControllers">Orders</a></li>
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

    <!-- Orders Section -->
    <div class="container mt-5">
        <h2 class="text-center fw-bold mb-4">Your Orders</h2>
        <div class="row">	
            <% 
            List<Pojo_orders> ord = (List<Pojo_orders>) session.getAttribute("ords");
            if (ord != null && !ord.isEmpty()) {
                for (Pojo_orders order : ord) {
            %>
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card shadow-lg border-0" style="border-radius: 15px; background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(10px);">
                    <div class="card-body text-light">
                        <div class="d-flex align-items-center">
                            <div>
                                <h5 class="card-title fw-bold">Product Name: <%= order.getProdName() %></h5>
                                <p class="mb-1"><strong>Order ID:</strong> <%= order.getOrdId() %></p>
                                <p class="mb-1"><strong>Consumer ID:</strong> <%= order.getConsID() %></p>
                                <p class="mb-1"><strong>Quantity:</strong> <%= order.getQuant() %></p>
                                <p class="mb-1"><strong>Order Date:</strong> <%= order.getOrdDate() %></p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between mt-3">
                            <button class="btn btn-success w-50 me-2" data-bs-toggle="modal" data-bs-target="#trackModal<%= order.getOrdId() %>">Track</button>
                            <button class="btn btn-danger w-50 me-2" data-bs-toggle="modal" data-bs-target="#reportModal<%= order.getOrdId() %>">Report</button>
                            <button class="btn btn-warning w-50" data-bs-toggle="modal" data-bs-target="#cancelOrderModal<%= order.getOrdId() %>">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>

<!-- Report Modal -->
<div class="modal fade" id="reportModal<%= order.getOrdId() %>" tabindex="-1" aria-labelledby="reportModalLabel<%= order.getOrdId() %>" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content text-dark">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Report an Issue</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
<form action="ordersControllers" method="post">
    <input type="hidden" name="action" value="reportIssue">
    <input type="hidden" name="prodId" value="<%= order.getProdId() %>">
    <input type="hidden" name="ordId" value="<%= order.getOrdId() %>">
    <label for="issueType<%= order.getOrdId() %>" class="form-label">Select Issue:</label>
    <select class="form-select" id="issueType<%= order.getOrdId() %>" name="issueType" required>
        <option value="delayed">Delayed</option>
        <option value="damage">Damaged</option>
        <option value="not received">Still Not Received</option>
        <option value="missing">Missing</option>
        <option value="wrong product">Wrong Product</option>
    </select>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-danger">Submit Report</button>
    </div>
</form>
        </div>
    </div>
</div>


<!-- Cancel Order Modal -->
<div class="modal fade" id="cancelOrderModal<%= order.getOrdId() %>" tabindex="-1" aria-labelledby="cancelOrderModalLabel<%= order.getOrdId() %>" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content text-dark">
            <div class="modal-header bg-warning text-dark">
                <h5 class="modal-title">Cancel Order</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to cancel this order?</p>
                <p><strong>Order ID:</strong> <%= order.getOrdId() %></p>
<form action="ordersControllers" method="post">
	<input type="hidden" name="prodId" value="<%= order.getProdId() %>">
    <input type="hidden" name="action" value="cancelOrder">
    <input type="hidden" name="ordId" value="<%= order.getOrdId() %>">
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-warning">Confirm Cancel</button>
    </div>
</form>

            </div>
        </div>
    </div>
</div>


            <!-- Track Order Modal -->
            <div class="modal fade" id="trackModal<%= order.getOrdId() %>" tabindex="-1" aria-labelledby="trackModalLabel<%= order.getOrdId() %>" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content text-dark">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title">Track Your Order</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <p><strong>Order ID:</strong> <%= order.getOrdId() %></p>
                            <p><strong>Current Status:</strong> 
                                <% if (order.isDelivered()) { %>
                                    Delivered
                                <% } else if (order.isOutDelivery()) { %>
                                    Out for Delivery
                                <% } else if (order.isShipped()) { %>
                                    Shipped
                                <% } else if (order.isOrdPlaced()) { %>
                                    Order Placed
                                <% } else { %>
                                     Processing
                                <% } %>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <% 
                }
            } else { 
            %>
            <p class="text-center">No orders found.</p>
            <% } %>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
