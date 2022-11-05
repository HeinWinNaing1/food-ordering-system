package com.hostmdy.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.model.FoodOrder;
import com.hostmdy.model.FoodOrderDAO;
import com.hostmdy.model.User;

/**
 * Servlet implementation class FoodOrderController
 */
public class FoodOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/foodOrder")
	private DataSource dataSource;

	private FoodOrderDAO orderDAO;

	@Override
	public void init() throws ServletException {
		orderDAO = new FoodOrderDAO(dataSource);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FoodOrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		if (user != null) {
			String mode = request.getParameter("mode");
			if (mode == null) {
				if (user.getRole().contains("user")) {
					mode = "ORDER";
				} else {
					mode = "LIST";
				}
			}

			switch (mode) {
			case "LIST":
				showOrderList(request, response);
				break;
			case "DELETE":
				deleteOrder(request, response);
				break;
			case "ORDER":
				showOrder(request, response);
				break;
			default:
				showOrderList(request, response);
				break;
			}
		} else {
			response.sendRedirect("order");
		}

	}

	private void showOrderList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		List<FoodOrder> orderList = this.orderDAO.showOrderList();
		request.setAttribute("orderList", orderList);
		RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
		rd.forward(request, response);

	}

	private void deleteOrder(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int id = Integer.parseInt(request.getParameter("id"));
		int rowEffected = this.orderDAO.deleteFoodOrder(id);

		if (user.getRole().contains("admin")) {
			if (rowEffected > 0) {
				showOrderList(request, response);
			}
		} else {
			if (rowEffected > 0) {
				showOrder(request, response);
			}
		}

	}

	private void showOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		String email = user.getEmail();
		List<FoodOrder> order = this.orderDAO.showOrder(email);
		request.setAttribute("order", order);
		RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
