package cn.edu.zju.ccnt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -5526447299507691855L;

	/**
	 * The doGet method of the servlet. <br>
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  	<HEAD><TITLE>Swift Console - Error</TITLE></HEAD>");
		out.println("  	<BODY>");
		out.println("		<h1> We do not support LOGIN action via GET method </h1>");
		out.println("  	</BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
		
		// TODO: Login Logic
		
		request.getSession().setAttribute("username", "admin");		
		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	}

}
