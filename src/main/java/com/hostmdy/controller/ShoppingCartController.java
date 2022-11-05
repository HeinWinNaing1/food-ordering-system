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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.model.FoodDAO;
import com.hostmdy.model.FoodOrder;
import com.hostmdy.model.FoodOrderDAO;
import com.hostmdy.model.ShoppingCart;
import com.hostmdy.model.ShoppingCartDAO;
import com.hostmdy.model.User;

/**
 * Servlet implementation class ShoppingCartController
 */
public class ShoppingCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/foodOrder")
	private DataSource dataSource;

	private ShoppingCartDAO cartDAO;
	private FoodOrderDAO foodOrderDAO;

	@Override
	public void init() throws ServletException {
		cartDAO = new ShoppingCartDAO(dataSource);
		foodOrderDAO = new FoodOrderDAO(dataSource);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShoppingCartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");

		if (user != null) {
			String mode = request.getParameter("mode");
			if (mode == null) {
				mode = "LIST";
			}

			switch (mode) {
			case "LIST":
				showcartList(request, response);
				break;
			case "DELETE":
				deleteCart(request, response);
				break;
			case "ORDER":
				orderCart(request, response);
				break;
			case "ORDERITEM":
				orderItem(request, response);
				break;
			default:
				showcartList(request, response);
				break;
			}

		} else {
			response.sendRedirect("cart");
		}
	}

	private void orderItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		String email = user.getEmail();
		int id = Integer.parseInt(request.getParameter("id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String foodname = request.getParameter("foodname");
		int rate = Integer.parseInt(request.getParameter("price"));
		int price = Integer.parseInt(request.getParameter("price")) * quantity;
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String date = dtf.format(now);
		FoodOrder foodOrder = new FoodOrder(email, date, quantity, rate, foodname, price);
		int rowEffected = this.foodOrderDAO.createFoodOrder(foodOrder);
		this.cartDAO.deleteCart(id);
		if (rowEffected > 0) {
			response.sendRedirect("cart");
		}

	}

	private void orderCart(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int id = Integer.parseInt(request.getParameter("id"));
		ShoppingCart cart = this.cartDAO.getShoppingCart(id);
		request.setAttribute("cart", cart);
		RequestDispatcher rd = request.getRequestDispatcher("orderitem.jsp");
		rd.forward(request, response);

	}

	private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		int rowEffected = this.cartDAO.deleteCart(id);

		if (rowEffected > 0) {
			response.sendRedirect("cart");
		}

	}

	private void showcartList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		String email = user.getEmail();
		List<ShoppingCart> cartList = this.cartDAO.showShoppingCartList(email);
		request.setAttribute("cartList", cartList);
		RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
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
