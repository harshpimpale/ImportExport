package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Pojo_user;

import java.io.IOException;

/**
 * Servlet implementation class loginControllers
 */
@WebServlet("/loginControllers")
public class loginControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public loginControllers() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        HttpSession session = request.getSession(); // Get or create a session
        session.setAttribute("portId", null); // Store data in the session	
        session.setAttribute("pass", null); // Store data in the session	
        session.setAttribute("role", null); // Store data in the session	
		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("portId");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        Pojo_user user = new Pojo_user();
        
        user.setPort_id(id);
        user.setPass(password);
        user.setRole(role);
        System.out.println(id + password + role);
        
        HttpSession session = request.getSession(); // Get or create a session
        session.setAttribute("portId", id); // Store data in the session	
        session.setAttribute("pass", password); // Store data in the session	
        session.setAttribute("role", role); // Store data in the session	
 
        boolean chk = user.checkLogin(user);
        
//        if(role.equals("consumer")) {
//        	if(chk) {
//        		// Inside your servlet's doGet() or doPost() method
//        		request.getRequestDispatcher("/consumer.jsp").forward(request, response);
//        	}
//        	else {
//        		request.getRequestDispatcher("/login.jsp").forward(request, response);
//        	}
//        }
//        else {
//        	if(chk) {
//        		request.getRequestDispatcher("/seller.jsp").forward(request, response);
//        	}
//        	else {
//        		request.getRequestDispatcher("/login.jsp").forward(request, response);
//        	}
//        	
//        }
    	if(chk) {
    		response.sendRedirect("profileControllers");
    	}
    	else {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
