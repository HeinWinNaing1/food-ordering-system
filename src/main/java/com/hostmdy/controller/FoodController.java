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
import java.io.PrintWriter;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.model.Food;
import com.hostmdy.model.FoodDAO;
import com.hostmdy.model.ShoppingCart;
import com.hostmdy.model.ShoppingCartDAO;
import com.hostmdy.model.User;

/**
 * Servlet implementation class FoodController
 */
public class FoodController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/foodOrder")
	private DataSource dataSource;

	private FoodDAO foodDAO;
	private ShoppingCartDAO cartDAO;

	@Override
	public void init() throws ServletException {
		foodDAO = new FoodDAO(dataSource);
		cartDAO = new ShoppingCartDAO(dataSource);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FoodController() {
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
				showFoodList(request, response);
				break;
			case "LOAD":
				loadFoodList(request, response);
				break;
			case "ADD":
				addFoodList(request, response);
				break;
			case "CREATE":
				createFoodList(request, response);
				break;
			case "UPDATE":
				updateFoodList(request, response);
				break;
			case "DELETE":
				deleteFoodList(request, response);
				break;
			default:
				showFoodList(request, response);
				break;
			}

		} else {
			response.sendRedirect("login");
		}

	}

	private void addFoodList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int id = Integer.parseInt(request.getParameter("id"));
		Food food = this.foodDAO.getFood(id);
		String foodName = food.getFoodName();
		String catagory = food.getCatagory();
		String taste = food.getTaste();
		String email = user.getEmail();
		int price = food.getPrice();
		ShoppingCart cart = new ShoppingCart(foodName, catagory, taste, email, price);

		int rowEffected = this.cartDAO.createShoppingCart(cart);

		if (rowEffected > 0) {
			response.sendRedirect("food");
		}

	}

	private void loadFoodList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int id = Integer.parseInt(request.getParameter("id"));
		Food food = this.foodDAO.getFood(id);
		request.setAttribute("food", food);
		RequestDispatcher rd = request.getRequestDispatcher("update-item.jsp");
		rd.forward(request, response);

	}

	private void createFoodList(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		String foodName = request.getParameter("foodname");
		String catagory = request.getParameter("catagory");
		String taste = request.getParameter("taste");
		int price = Integer.parseInt(request.getParameter("price"));

		Food food = new Food(foodName, catagory, taste, price);

		int rowEffected = this.foodDAO.createFood(food);

		if (rowEffected > 0) {
			showFoodList(request, response);
		}
	}

	private void updateFoodList(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int id = Integer.parseInt(request.getParameter("id"));
		String foodName = request.getParameter("foodname");
		String catagory = request.getParameter("catagory");
		String taste = request.getParameter("taste");
		int price = Integer.parseInt(request.getParameter("price"));

		Food food = new Food(id, foodName, catagory, taste, price);

		int rowEffected = this.foodDAO.updateFood(food);

		if (rowEffected > 0) {
			showFoodList(request, response);
		}
	}

	private void deleteFoodList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int id = Integer.parseInt(request.getParameter("id"));
		int rowEffected = this.foodDAO.deleteFood(id);

		if (rowEffected > 0) {
			showFoodList(request, response);
		}

	}

	private void showFoodList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		List<Food> foodList = this.foodDAO.getFoodList();
		request.setAttribute("foodList", foodList);
		RequestDispatcher rd = request.getRequestDispatcher("show-menu.jsp");
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
