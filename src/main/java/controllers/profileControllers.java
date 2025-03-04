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
 * Servlet implementation class profileServlet
 */
@WebServlet("/profileControllers")
public class profileControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileControllers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		HttpSession session = request.getSession(); // Get or create a session
//        session.setAttribute("portId", id); // Store data in the session	
//        session.setAttribute("pass", password); // Store data in the session	
//        session.setAttribute("role", role); // Store data in the session
		String id = (String) session.getAttribute("portId");
		String pass = (String) session.getAttribute("pass");
		String role = (String) session.getAttribute("role");
		System.out.println("Profile visit: "+id+pass+role);
		
		if (id == null || id.isBlank()) { // Correct way (Java 11+)
		    response.sendRedirect("loginControllers");
		    return; // Essential: Stop further processing
		}
		System.out.println(id+pass+role);
		Pojo_user user = new Pojo_user();
		user.setPort_id(id);
		user.setPass(pass);
		user.setRole(role);
		user = user.getUser(user);
		request.setAttribute("user",user);
		
		
		request.getRequestDispatcher("/profile.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String portId = request.getParameter("portId");
		String pass = request.getParameter("pass");
		String location = request.getParameter("locat");
		String role = request.getParameter("role");
		System.out.println(portId+pass+location + role);
		Pojo_user user = new Pojo_user();
		user.setPort_id(portId);
		user.setPass(pass);
		user.setLocation(location);
		user.setRole(role);
		user.updateData(user);
		
		response.sendRedirect("profileControllers");
	}

}
