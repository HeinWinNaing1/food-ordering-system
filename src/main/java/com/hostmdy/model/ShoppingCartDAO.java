package com.hostmdy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class ShoppingCartDAO {
	
	private DataSource dataSource;
	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;
	
	
	public ShoppingCartDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public void close() {
		if(connection!=null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public List<ShoppingCart> showShoppingCartList(String email) {
		List<ShoppingCart> shoppingCart = new ArrayList<>();
		
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs=stmt.executeQuery("select * from shopping_cart where email='"+email+"';");
			
			while(rs.next()) {
				shoppingCart.add(new ShoppingCart(
						rs.getInt("id"),
						rs.getString("foodname"),
						rs.getString("catagory"),
						rs.getString("taste"),
						rs.getString("email"),
						rs.getInt("price")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return shoppingCart;
		
	}
	
	public ShoppingCart getShoppingCart(int id) {
		ShoppingCart shoppingCart = null;
		
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs=stmt.executeQuery("select * from shopping_cart where id='"+id+"';");
			
			while(rs.next()) {
				shoppingCart= new ShoppingCart(
						rs.getInt("id"),
						rs.getString("foodname"),
						rs.getString("catagory"),
						rs.getString("taste"),
						rs.getString("email"),
						rs.getInt("price"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return shoppingCart;
		
	}
	
	public int createShoppingCart(ShoppingCart shoppingCart) {
		int rowEffected = 0;
		try {
			connection=dataSource.getConnection();
			pStmt = connection.prepareStatement("INSERT INTO `shopping_cart` (`foodname`, `catagory`, `taste`, `email`,`price`) VALUES ("
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?,"
					+ "?);");
			
			pStmt.setString(1,shoppingCart.getFoodName());
			pStmt.setString(2,shoppingCart.getCatagory());
			pStmt.setString(3,shoppingCart.getTaste());
			pStmt.setString(4,shoppingCart.getEmail());
			pStmt.setInt(5,shoppingCart.getPrice());
			
			
			rowEffected=pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return rowEffected;
		
	}
	
	public int deleteCart(int id) {
		int rowEffected = 0;
		
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("delete from shopping_cart where id = ?;");
			
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
	
	
	

}
