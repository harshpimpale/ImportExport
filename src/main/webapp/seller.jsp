<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seller Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="icon" type="image/x-icon" href="favicon.ico">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    body {
            background: linear-gradient(to right, #141e30, #243b55);
            color: white;
            font-family: 'Poppins', sans-serif;
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
    .dashboard-container {
      padding: 20px;
    }
    .dashboard-card {
      background: #1e1e1e;
      color: #fff;
      padding: 20px;
      border-radius: 10px;
      margin-bottom: 20px;
      box-shadow: 0 4px 6px rgba(255, 255, 255, 0.1);
      transition: transform 0.3s ease;
    }
    .dashboard-card:hover {
      transform: scale(1.05);
    }
    .btn-primary {
      background: #f39c12;
      border: none;
      transition: background 0.3s ease;
    }
    .btn-primary:hover {
      background: #e67e22;
    }
    .dropdown-menu {
      background: #2c3e50;
    }
    .dropdown-item {
      color: #fff;
    }
    .dropdown-item:hover {
      background: #34495e;
    }
  </style>
</head>
<body>
	<%
		List<Integer> result = (List<Integer>) request.getAttribute("dashRes"); 
		
		
		int totalOrd = 0;
		int totalSal = 0;
		int completed = 0, pending = 0, cancelled = 0;
	    // Monthly sales variables (Jan - Dec)
	    int jan = 0, feb = 0, mar = 0, apr = 0, may = 0, jun = 0, 
	        jul = 0, aug = 0, sep = 0, oct = 0, nov = 0, dec = 0;
		double totalAvg = 0.00;
		if(result != null && !result.isEmpty()){
			totalOrd = result.get(12);
			totalSal = result.get(13);
	        completed = result.get(14) != null ? result.get(14) : 0;
	        pending = result.get(15) != null ? result.get(15) : 0;
	        cancelled = result.get(16) != null ? result.get(16) : 0;
	        // Monthly sales (assuming indexes 0-11 store Jan-Dec data)
	        if (result.size() > 11) {
	            jan = result.get(0) != null ? result.get(0) : 0;
	            feb = result.get(1) != null ? result.get(1) : 0;
	            mar = result.get(2) != null ? result.get(2) : 0;
	            apr = result.get(3) != null ? result.get(3) : 0;
	            may = result.get(4) != null ? result.get(4) : 0;
	            jun = result.get(5) != null ? result.get(5) : 0;
	            jul = result.get(6) != null ? result.get(6) : 0;
	            aug = result.get(7) != null ? result.get(7) : 0;
	            sep = result.get(8) != null ? result.get(8) : 0;
	            oct = result.get(9) != null ? result.get(9) : 0;
	            nov = result.get(10) != null ? result.get(10) : 0;
	            dec = result.get(11) != null ? result.get(11) : 0;
	        }	        
		}
		if(totalOrd == 0){
			totalAvg = totalSal / 1;
		}
		else{
			totalAvg = totalSal / totalOrd;
		}
		
	%>
    <nav class="navbar navbar-expand-lg bg-dark text-light">
        <div class="container-fluid d-flex align-items-center">
            <img src="logo.png" alt="Logo" class="logo">
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-light active" href="sellerDashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link text-light" href="sellerOrdersControllers">Orders</a></li>
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
  <div class="container dashboard-container">
    <h1 class="text-center mb-4">Seller Dashboard</h1>
    <div class="row">
      <div class="col-md-4">
        <div class="dashboard-card">
          <h4>Total Orders</h4>
          <p id="totalOrders"><%= totalOrd %></p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="dashboard-card">
          <h4>Total Sales</h4>
          <p id="totalSales">₹<%= totalSal %></p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="dashboard-card">
          <h4>Average Sales</h4>
          <p id="averageSales">₹<%= totalAvg %></p>
        </div>
      </div>
    </div>
    <div class="row mt-4">
      <div class="col-md-6">
        <div class="dashboard-card">
          <h4>Order Status</h4>
          <canvas id="pieChart"></canvas>
        </div>
      </div>
      <div class="col-md-6">
        <div class="dashboard-card">
          <h4>Monthly Sales</h4>
          <canvas id="barChart"></canvas>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    const pieChartCtx = document.getElementById('pieChart').getContext('2d');
    const pieChart = new Chart(pieChartCtx, {
      type: 'pie',
      data: {
        labels: ['Completed', 'Pending', 'Cancelled'],
        datasets: [{
          data: [<%= completed %>, <%= pending %>, <%= cancelled %>] ,
          backgroundColor: ['#4caf50', '#ffeb3b', '#f44336'],
        }]
      },
      options: {responsive: true}
    });
    const barChartCtx = document.getElementById('barChart').getContext('2d');
    const barChart = new Chart(barChartCtx, {
      type: 'bar',
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
          label: 'Sales (₹)',
          data: [<%= jan %>, <%= feb %>, <%= mar %>, <%= apr %>, <%= may %>, <%= jun %>,<%= jul %>, <%= aug %>, <%= sep %>, <%= oct %>, <%= nov %>, <%= dec %>],
          backgroundColor: '#f39c12',
        }]
      },
      options: {responsive: true}
    });
  </script>
</body>
</html>
