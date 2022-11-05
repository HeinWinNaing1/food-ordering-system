package com.hostmdy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class FoodDAO {
	
	private DataSource dataSource;
	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;
	
	
	
	public FoodDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public List<Food> getFoodList(){
		List<Food> foodList = new ArrayList<>();
		
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from food;");
			
			while(rs.next()) {
				foodList.add(new Food(
						rs.getInt("id"),
						rs.getString("foodname"),
						rs.getString("catagory"),
						rs.getString("taste"),
						rs.getInt("price")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return foodList;
		
		
	}
	
	public Food getFood(int id) {
		Food food = null;	
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from food where id='"+id+"';");
			
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
			close();
		}
		
		return food;
		
	}
	
	public int createFood(Food food) {
		int rowEffected = 0;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("INSERT INTO `food` (`foodname`, `catagory`, `taste`, `price`) VALUES ("
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?);");
			
			pStmt.setString(1,food.getFoodName());
			pStmt.setString(2,food.getCatagory());
			pStmt.setString(3,food.getTaste());
			pStmt.setInt(4,food.getPrice());
			
			rowEffected = pStmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return rowEffected;

		
	}
	
	public int updateFood(Food food) {
		int rowEffected = 0;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("UPDATE `food` SET "
					+ "`foodname` = ?,"
					+ " `catagory` = ?,"
					+ " `taste` = ?,"
					+ " `price` = ? where id = ?;");
			
			pStmt.setString(1,food.getFoodName());
			pStmt.setString(2,food.getCatagory());
			pStmt.setString(3,food.getTaste());
			pStmt.setInt(4,food.getPrice());
			pStmt.setInt(5,food.getId());
			rowEffected = pStmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return rowEffected;
	}
	
	public int deleteFood(int id) {
		int rowEffected = 0;
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("delete from food where id = ?;");
			
			pStmt.setInt(1, id);
			
			rowEffected = pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return rowEffected;
		
	}
	
	private void close() {
		if(connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
