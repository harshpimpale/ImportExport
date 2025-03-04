<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body class="bg-dark text-light" style="background: linear-gradient(to right, #141e30, #243b55);">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card p-4 shadow-lg border-0" style="width: 350px; backdrop-filter: blur(10px); background: rgba(255, 255, 255, 0.1); border-radius: 15px;">
            <h3 class="text-center text-light mb-3">Register</h3>
            <form id="registerForm" action="registerControllers" method="post" novalidate>
                <div class="mb-3">
                    <label for="userId" class="form-label text-light">User ID</label>
                    <input type="text" class="form-control" id="userId" name="userId" required>
                    <div class="invalid-feedback">Please enter your User ID.</div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label text-light">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                    <div class="invalid-feedback">Please enter a password.</div>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label text-light">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    <div class="invalid-feedback">Passwords do not match.</div>
                </div>
                <div class="mb-3">
                    <label for="location" class="form-label text-light">Location</label>
                    <input type="text" class="form-control" id="location" name="location" required>
                    <div class="invalid-feedback">Please enter your location.</div>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label text-light">Role</label>
                    <select class="form-select" id="role" name="role" required>
                        <option value="">Select Role</option>
                        <option value="consumer">Consumer</option>
                        <option value="seller">Seller</option>
                    </select>
                    <div class="invalid-feedback">Please select a role.</div>
                </div>
                <button type="submit" class="btn btn-primary w-100">Register</button>
                <p class="text-center mt-3"><a href="login.jsp" class="text-info">Already have an account? Login</a></p>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById('registerForm');
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmPassword');

            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                if (password.value !== confirmPassword.value) {
                	console.log(password+ " "+confirmPassword)
                    confirmPassword.setCustomValidity("Passwords do not match.");
                } else {
                    confirmPassword.setCustomValidity("");
                }

                form.classList.add('was-validated');
            });

            // Real-time validation for password match
            confirmPassword.addEventListener('input', function() {
                if (password.value === confirmPassword.value) {
                    confirmPassword.setCustomValidity("");
                } else {
                    confirmPassword.setCustomValidity("Passwords do not match.");
                }
            });
        });
    </script>
</body>
</html>
