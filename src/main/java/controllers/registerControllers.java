package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pojo_user;

import java.io.IOException;

/**
 * Servlet implementation class registerControllers
 */
@WebServlet("/registerControllers")
public class registerControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public registerControllers() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/register.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("userId");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("confirmPassword");
        String location = request.getParameter("location");
        String role = request.getParameter("role");

        // Check if password and confirm password match
        if (!password.equals(cpassword)) {
            response.getWriter().println("Error: Password and Confirm Password do not match.");
            return; // Stop execution
        }
        
        Pojo_user user = new Pojo_user();
        
        user.setPort_id(username);
        user.setPass(password);
        user.setLocation(location);
        user.setRole(role);
        System.out.println(username + password + cpassword + location + role);

        boolean chk = user.checkRegister(user);
        if(chk) {
        		request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        else {
        	request.getRequestDispatcher("/register.jsp").forward(request, response);
        }

    }

}
