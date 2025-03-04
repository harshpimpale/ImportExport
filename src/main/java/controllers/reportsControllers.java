package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Pojo_reports;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class reportsControllers
 */
@WebServlet("/reportsControllers")
public class reportsControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reportsControllers() {
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
		
		Pojo_reports r = new Pojo_reports();
		List<Pojo_reports> reps = r.getAllReports(id);
		for(Pojo_reports x : reps) {
			System.out.println(x.getRepId());
			System.out.println(x.getordId());
		}
		
		
		session.setAttribute("report", reps);
		
		request.getRequestDispatcher("/C_reports.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String rep = request.getParameter("reporter");
		Pojo_reports r = new Pojo_reports();
		r.setRepId(Integer.parseInt(rep));
		r.deleteReport(r);
		
		response.sendRedirect("reportsControllers");
//		doGet(request, response);
	}

}
