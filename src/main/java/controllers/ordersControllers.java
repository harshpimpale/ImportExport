package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Pojo_orders;
import model.Pojo_reports;
import operations.orderOperations;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ordersServlet
 */
@WebServlet("/ordersControllers")
public class ordersControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ordersControllers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
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
		
		Pojo_orders o = new Pojo_orders();
		List<Pojo_orders> ords = o.getAllOrders(id);
		for(Pojo_orders x : ords) {
			System.out.println(x.getOrdId());
			System.out.println(x.getConsID());
		}
		
		
		session.setAttribute("ords", ords);
		
		request.getRequestDispatcher("/C_orders.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");
	    
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("portId");
        String ordId = request.getParameter("ordId");
        String prodId = request.getParameter("prodId");
        String issueType = request.getParameter("issueType");
        System.out.println("Check: "+ordId+":"+prodId);

	    if ("cancelOrder".equals(action)) {

	        if (ordId != null && !ordId.isBlank()) {
	            new Pojo_orders().cancelOrder(Integer.parseInt(ordId));
	        }
	        response.sendRedirect("ordersControllers"); // Reload the orders page
	    } else if ("reportIssue".equals(action)) {

	        if (ordId != null && issueType != null && !ordId.isBlank() && !issueType.isBlank()) {
	            Pojo_reports report = new Pojo_reports();
	            report.setConsId(id);
	            report.setordId(Integer.parseInt(ordId));
	            report.setProdId(Integer.parseInt(prodId));
	            report.setIssueType(issueType);
	            report.addReport(report);
	        }
	        response.sendRedirect("ordersControllers"); // Reload the orders page
	    } else {
	        doGet(request, response);
	    }
	}



}
