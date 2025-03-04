package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pojo_products;

import java.io.IOException;

/**
 * Servlet implementation class productPageController
 */
@WebServlet("/productPage")
public class productPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String productId = request.getParameter("productId");
        if (productId != null && !productId.isBlank()) {
            Pojo_products product = new Pojo_products().getProductById(Integer.parseInt(productId));
            request.setAttribute("product", product);
            request.getRequestDispatcher("/productPage.jsp").forward(request, response);
        } else {
            response.sendRedirect("consumerDashboard");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
