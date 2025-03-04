package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Pojo_orders;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class sellerOrdersControllers
 */
@WebServlet("/sellerOrdersControllers")
public class sellerOrdersControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sellerOrdersControllers() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("portId");
		String role = (String) session.getAttribute("role");
//		
		if (id == null || id.isBlank()) { // Correct way (Java 11+)
		    response.sendRedirect("loginControllers");
		    return; // Essential: Stop further processing
		}
		if (role == null || role.isBlank() || role.equals("consumer")) { // Correct way (Java 11+)
			response.sendRedirect("loginControllers");
			return; // Essential: Stop further processing
		}
		
		List<Pojo_orders> orders = new Pojo_orders().getSellerOrders(id);
        request.setAttribute("orders", orders);
//        for(Pojo_orders o: orders) {
//        	System.out.println(o.getOrdId());
//        }
        
        request.getRequestDispatcher("/orders_seller.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String status = request.getParameter("status");
		String odId = request.getParameter("orderId");
		if(!status.equals("")){
//			System.out.println(status+odId);
			new Pojo_orders().updateTracking(status, odId);
		}
		
		doGet(request, response);
	}

}
