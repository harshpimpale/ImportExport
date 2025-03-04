<%@page import="model.Pojo_products"%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            color: white;
            font-family: 'Poppins', sans-serif;
            font-size: 18px;
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
            font-size: 18px;
        }
        .table-dark th {
            background-color: #212529;
        }
        .btn-edit {
            background-color: #ffc107;
            border: none;
            color: black;
            font-weight: bold;
        }
        .btn-delete {
            background-color: #dc3545;
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
                    <li class="nav-item"><a class="nav-link text-light" href="sellerOrdersControllers">Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-light active" href="sellerProductManage">Products</a></li>
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
<div class="container mt-4">
    <div class="card-container">
        <h2 class="text-center text-light">Product Management</h2>

        <!-- Add Product Form -->
        <form method="post" action="sellerProductManage" class="mb-4">
            <div class="row">
            	<input type="hidden" name="user" value="<%= user %>"> 
                <div class="col-md-3">
                    <input type="text" name="productName" class="form-control" placeholder="Product Name" required>
                </div>
                <div class="col-md-2">
                    <input type="number" class="form-control" name="quantity" placeholder="Quantity" required>
                </div>
                <div class="col-md-2">
                    <input type="number" class="form-control" name="price" placeholder="Price" required>
                </div>
                <div class="col-md-2">
                    <button type="submit" name="action" value="add" class="btn btn-primary w-100">Add Product</button>
                </div>
            </div>
        </form>

        <!-- Product List Table -->
        <table class="table table-bordered mt-4 table-dark">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price per Unit</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <% List<Pojo_products> products = (List<Pojo_products>) session.getAttribute("product"); 
            if (products != null && !products.isEmpty()) {
                for (Pojo_products p : products) { %>
                <tr>
                    <td><%= p.getProdId() %></td>
                    <td><%= p.getProdName() %></td>
                    <td><%= p.getQuant() %></td>
                    <td>$<%= p.getPrice() %></td>
                    <td>
                        <button class="btn btn-edit btn-sm" onclick="openEditModal('<%= p.getProdId() %>', '<%= p.getProdName() %>', '<%= p.getQuant() %>', '<%= p.getPrice() %>')">Edit</button>
                        <form method="post" action="sellerProductManage" style="display:inline;">
                            <input type="hidden" name="prodId" value="<%= p.getProdId() %>">
                            <button type="submit" name="action" value="delete" class="btn btn-delete btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>    
             <% } } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal for Editing -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content text-dark">
      <div class="modal-header">
        <h5 class="modal-title" id="editModalLabel">Edit Product</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="editForm" method="post" action="sellerProductManage">
          <input type="hidden" name="prodId" id="editProdId">
          <div class="mb-3">
            <label class="form-label">Product Name</label>
            <input type="text" class="form-control" name="productName" id="editProdName" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Quantity</label>
            <input type="number" class="form-control" name="quantity" id="editProdQuantity" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Price</label>
            <input type="number" class="form-control" name="price" id="editProdPrice" required>
          </div>
          <input type="hidden" name="action" value="edit">
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-success">Save Changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
function openEditModal(prodId, prodName, quantity, price) {
    document.getElementById('editProdId').value = prodId;
    document.getElementById('editProdName').value = prodName;
    document.getElementById('editProdQuantity').value = quantity;
    document.getElementById('editProdPrice').value = price;
    var editModal = new bootstrap.Modal(document.getElementById('editModal'));
    editModal.show();
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
