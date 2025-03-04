package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Pojo_orders;
import model.Pojo_products;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/addToCart")
public class AddToCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String productId = request.getParameter("productId");
        PrintWriter out = response.getWriter();
        System.out.println("Cart :"+productId);

        if (productId != null && !productId.isBlank()) {
            int prodId = Integer.parseInt(productId);

            @SuppressWarnings("unchecked")
            Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

            if (cart == null) {
                cart = new HashMap<>();
            }
            cart.put(prodId, cart.getOrDefault(prodId, 0) + 1);

            session.setAttribute("cart", cart);
            out.print("success"); // Return a success message
        } else {
            out.print("error"); // Return an error message if product ID is missing
        }
        out.close();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        
        @SuppressWarnings("unchecked")
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        if (action != null && action.equals("update")) {
            // 🛒 Update Cart Quantities
            if (cart != null) {
                for (Integer prodId : cart.keySet()) {
                    String param = "quantity_" + prodId;
                    String quantity = request.getParameter(param);
                    if (quantity != null && !quantity.isBlank()) {
                        int newQuantity = Integer.parseInt(quantity);
                        if (newQuantity > 0) {
                            cart.put(prodId, newQuantity);
                        } else {
                            cart.remove(prodId); // Remove item if quantity is 0
                        }
                    }
                }
                session.setAttribute("cart", cart);
            }
            response.sendRedirect("cart.jsp"); // Redirect back to cart
        } 
        else if (action != null && action.equals("checkout")) {
            // 🛍 Process Checkout
            if (cart != null && !cart.isEmpty()) {
            	String id = (String) session.getAttribute("portId");
            	new Pojo_orders().orderPlace(cart, id);
                cart.clear(); // Empty the cart after checkout
                session.setAttribute("cart", cart);
                System.out.println("I got Post checkout");
                session.setAttribute("checkoutSuccess", "✅ Checkout successful! Your order has been placed.");
            }
            response.sendRedirect("cart.jsp"); // Redirect to cart page with success message
        }
    }


    
    
}
