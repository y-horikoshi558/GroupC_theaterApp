package app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.groupDAO;

/**
 * Servlet implementation class selectGroup
 */
@WebServlet("/selectGroup")
public class selectGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectGroup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		//out.println(request.getParameter("title"));

		request.setAttribute("title", request.getParameter("title"));
		request.setAttribute("date", request.getParameter("date"));
		request.setAttribute("screen", request.getParameter("screen"));
		request.setAttribute("time", request.getParameter("time"));
		request.setAttribute("seats", request.getParameterValues("seat"));

		groupDAO gd = new groupDAO();
		List data = gd.getUserData(request.getParameter("id"));
		request.setAttribute("list", data);

		request.getRequestDispatcher("./jsp/selectAge.jsp").forward(request, response);
		//response.sendRedirect("./jsp/selectAge.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
