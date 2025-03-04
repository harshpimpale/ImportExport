<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body class="bg-dark text-light" style="background: linear-gradient(to right, #141e30, #243b55);">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card p-4 shadow-lg border-0" style="width: 350px; backdrop-filter: blur(10px); background: rgba(255, 255, 255, 0.1); border-radius: 15px;">
            <h3 class="text-center text-light mb-3">Login</h3>
            <form id="loginForm" action="loginControllers" method="post" novalidate>
                <div class="mb-3">
                    <label for="userId" class="form-label text-light">User ID</label>
                    <input type="text" class="form-control" id="userId" name="portId" required>
                    <div class="invalid-feedback">Please enter your User ID.</div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label text-light">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                    <div class="invalid-feedback">Please enter your password.</div>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label text-light">Role</label>
                    <select class="form-select" id="role" name="role" required>
                        <option value="consumer">Consumer</option>
                        <option value="seller">Seller</option>
                    </select>
                    <div class="invalid-feedback">Please select a role.</div>
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
                <p class="text-center mt-3"><a href="register.jsp" class="text-info">Don't have an account? Register</a></p>
            </form>
        </div>
    </div>

    <script>
        (() => {
            'use strict';
            const forms = document.querySelectorAll('form');
            forms.forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>
