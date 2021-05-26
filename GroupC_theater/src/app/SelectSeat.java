package app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SeatDAO;

/**
 * Servlet implementation class SelectSeat
 */
@WebServlet("/SelectSeat")
public class SelectSeat extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSeat() {
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

		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String screen = request.getParameter("screen");
		String time = request.getParameter("time");

		request.setAttribute("title", title);
		request.setAttribute("date", date);
		request.setAttribute("screen", screen);
		request.setAttribute("time", time);

		SeatDAO gd = new SeatDAO();
		List<String> data = gd.getSeat(id, date, time);
		request.setAttribute("list", data);

		int[] seatWH = gd.getSeatWH(screen);
		request.setAttribute("seatWH", seatWH);

		request.getRequestDispatcher("./jsp/selectSeat.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
