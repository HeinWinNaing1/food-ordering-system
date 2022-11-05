package test;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.hostmdy.model.Food;


/**
 * Servlet implementation class DbTestServlet
 */
public class Dbtest extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Resource(name="jdbc/foodOrder")
	private DataSource dataSource;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dbtest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		Food food = null;
		try {
			connection =dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from food where id='2';");
			while(rs.next()) {
				 food = new Food(
						rs.getInt("id"),
						rs.getString("foodname"),
						rs.getString("catagory"),
						rs.getString("taste"),
						rs.getInt("price"));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		out.print(food);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
