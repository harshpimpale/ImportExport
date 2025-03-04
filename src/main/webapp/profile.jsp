<%@ page import="java.sql.*" %>
<%@ page import="model.Pojo_user" %>
<%
   String role = (String) session.getAttribute("role");
   Pojo_user user = (Pojo_user) request.getAttribute("user");
   
   String redirect = role.equals("consumer") ? "consumerDashboard" : "sellerDashboard";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%= role %> Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
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
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card p-4 shadow-lg border-0" style="width: 400px; backdrop-filter: blur(10px); background: rgba(255, 255, 255, 0.1); border-radius: 15px;">
            <h3 class="text-center text-light mb-3"><%= role %> Profile</h3>
            <form id="profileForm" action="profileControllers" method="post" novalidate>
                
                <!-- Port ID (Non-Editable) -->
                <div class="mb-3">
                    <label for="portId" class="form-label text-light">Port ID</label>
                    <input type="text" class="form-control" id="portId" name="portId" value="<%= user.getPort_id() %>" readonly>
                </div>
                
                <!-- Role (Non-Editable) -->
                <div class="mb-3">
                    <label for="role" class="form-label text-light">Role</label>
                    <input type="text" class="form-control" id="role" name="role" value="<%= user.getRole() %>" readonly>
                </div>
                
                <!-- Location (Editable) -->
                <div class="mb-3">
                    <label for="location" class="form-label text-light">Location</label>
                    <input type="text" class="form-control" id="location" name="locat" value="<%= user.getLocation() %>" required>
                    <div class="invalid-feedback">Please enter your location.</div>
                </div>
                
                <!-- Password (Editable) with Show Password Option -->
                <div class="mb-3">
                    <label for="password" class="form-label text-light">New Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="password" name="pass" required>
                        <button class="btn btn-outline-light" type="button" id="togglePassword">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="invalid-feedback">Please enter a password.</div>
                </div>
                
                <!-- Save Changes Button -->
                <button type="submit" class="btn btn-primary w-100">Save Changes</button>
                
                <!-- Go to Home Button -->
                <div class="text-center mt-3">
                    <a href="<%= redirect %>" class="btn btn-outline-light w-100">Go to Home</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Show/Hide Password
        document.getElementById("togglePassword").addEventListener("click", function () {
            let passwordField = document.getElementById("password");
            let icon = this.querySelector("i");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                passwordField.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        });
    </script>
</body>
</html>

