package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Pojo_products;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class consumerDashboard
 */
@WebServlet("/consumerDashboard")
public class consumerDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public consumerDashboard() {
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
		
		Pojo_products p = new Pojo_products();
		List<Pojo_products> prods = p.showAll();
		for(Pojo_products x : prods) {
			System.out.println(x.getProdId());
			System.out.println(x.getProdName());
		}
		
		
		session.setAttribute("prod", prods);
		
		request.getRequestDispatcher("/consumer.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
