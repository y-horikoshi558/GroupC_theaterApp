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
		out.println(request.getParameter("title"));

		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String screen = request.getParameter("screen");
		String time = request.getParameter("time");
		String[] seat = request.getParameterValues("seat");

		request.setAttribute("title", title);
		request.setAttribute("id", id);
		request.setAttribute("date", date);
		request.setAttribute("screen", screen);
		request.setAttribute("time", time);
		request.setAttribute("seats", seat);

		groupDAO gd = new groupDAO();
		List data = gd.getUserData(id);
		request.setAttribute("list", data);

		request.getRequestDispatcher("./jsp/selectAge.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
