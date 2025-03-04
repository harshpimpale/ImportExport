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

@WebServlet("/sellerProductManage")
public class sellerProductManage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public sellerProductManage() {
        super();
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

        Pojo_products p = new Pojo_products();
        List<Pojo_products> prods = p.showProductsofSeller(id);
        session.setAttribute("product", prods);

        request.getRequestDispatcher("/productManage.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch(action) {
            case "add":
                addProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String prodName = request.getParameter("productName");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String user = request.getParameter("user");
        System.out.println(prodName+quantity+price+user);
        Pojo_products p = new Pojo_products();
        p.setProdName(prodName);
        p.setPrice(Double.parseDouble(price));
        p.setQuant(Integer.parseInt(quantity));
        p.setSellerId(user);
        p.addProducts(p);

        response.sendRedirect("sellerProductManage");
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String prodName = request.getParameter("productName");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String prodId = request.getParameter("prodId");
        System.out.println(prodName+quantity+price+prodId);
        Pojo_products p = new Pojo_products();
        p.setProdId(Integer.parseInt(prodId));
        p.setProdName(prodName);
        p.setPrice(Double.parseDouble(price));
        p.setQuant(Integer.parseInt(quantity));
        p.editProducts(p);

        response.sendRedirect("sellerProductManage");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String prodId = request.getParameter("prodId");
        System.out.println(prodId);
        Pojo_products p = new Pojo_products();
        p.setProdId(Integer.parseInt(prodId));
        p.delProducts(p);

        response.sendRedirect("sellerProductManage");
    }
}
