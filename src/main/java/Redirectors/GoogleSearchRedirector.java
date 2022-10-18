package Redirectors;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class GoogleSearchRedirector extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		response.setContentType("text/html");
		String search=request.getParameter("SearchInput");
        response.sendRedirect("https://www.google.com/search?q="+search);
	}

}
