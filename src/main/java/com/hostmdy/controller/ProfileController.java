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

import javax.sql.DataSource;

import com.hostmdy.model.User;
import com.hostmdy.model.UserDAO;

/**
 * Servlet implementation class ProfileController
 */
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/foodOrder")
	private DataSource dataSource;
	private UserDAO userDAO;

	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO(dataSource);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileController() {
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
				loagPage(request, response);
				break;
			case "LOGOUT":
				session.invalidate();
				response.sendRedirect("login");
				break;
			case "UPDATE":
				editProfile(request, response);
				break;
			case "LOAD":
				loadProfile(request, response);
				break;
			default:
				loagPage(request, response);
			}
		}
	}

	private void loadProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		User user = this.userDAO.getUser(id);
		request.setAttribute("user", user);
		RequestDispatcher rd = request.getRequestDispatcher("update-user.jsp");
		rd.forward(request, response);

	}

	private void editProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		User user = new User(id, username, email, password, role);
		int rowEffected = this.userDAO.updateUser(user);

		if (rowEffected > 0) {
			loagPage(request, response);
		}

	}

	private void loagPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
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
