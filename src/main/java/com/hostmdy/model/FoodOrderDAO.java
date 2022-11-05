package com.hostmdy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class FoodOrderDAO {
	
	private DataSource dataSource;
	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;
	
	
	public FoodOrderDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public List<FoodOrder> showOrder(String email){
		List<FoodOrder> foodOrder = new ArrayList<>();
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("select * from food_order where email='"+email+"';");
			
			rs = pStmt.executeQuery();
			
			while(rs.next()) {
				foodOrder.add(new FoodOrder(
						rs.getInt("id"),
						rs.getString("email"),
						rs.getString("date"),
						rs.getInt("quantity"),
						rs.getInt("rate"),
						rs.getString("foodname"),
						rs.getInt("price")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return foodOrder;
		
	}
	
	public List<FoodOrder> showOrderList(){
		List<FoodOrder> foodOrder = new ArrayList<>();
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("select * from food_order;");
			
			rs = pStmt.executeQuery();
			
			while(rs.next()) {
				foodOrder.add(new FoodOrder(
						rs.getInt("id"),
						rs.getString("email"),
						rs.getString("date"),
						rs.getInt("quantity"),
						rs.getInt("rate"),
						rs.getString("foodname"),
						rs.getInt("price")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return foodOrder;
		
	}
	
	public int createFoodOrder(FoodOrder foodOrder) {
		int rowEffected = 0;
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("INSERT INTO `food_order` (`email`, `date`, `quantity`, `rate`, `foodname`, `price`)"
					+ " VALUES ("
					+ "?,"
					+ " ?,"
					+ " ?,"
					+ " ?"
					+ ", ?"
					+ ", ?);");
			
			pStmt.setString(1,foodOrder.getEmail());
			pStmt.setString(2,foodOrder.getDate());
			pStmt.setInt(3, foodOrder.getQuantity());
			pStmt.setInt(4, foodOrder.getRate());
			pStmt.setString(5,foodOrder.getFoodName());
			pStmt.setInt(6,foodOrder.getPrice());
			
			rowEffected=pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return rowEffected;
	}
	
	public int deleteFoodOrder(int id) {
		int rowEffected = 0;
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("delete from food_order where id = ?;");
			
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
		if(connection!=null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	

}
