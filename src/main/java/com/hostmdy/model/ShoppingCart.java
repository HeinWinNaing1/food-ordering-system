package com.hostmdy.model;

public class ShoppingCart {
	
	private int id;
	private String foodName;
	private String catagory;
	private String taste;
	private String email;
	private int price;
	
	
	public ShoppingCart() {}

	
	
	public ShoppingCart(String foodName, String catagory, String taste,String email, int price) {
		super();
		this.foodName = foodName;
		this.catagory = catagory;
		this.taste = taste;
		this.email = email;
		this.price = price;
	}


	public ShoppingCart(int id, String foodName, String catagory, String taste,String email, int price) {
		super();
		this.id = id;
		this.foodName = foodName;
		this.catagory = catagory;
		this.taste = taste;
		this.email = email;
		this.price = price;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getFoodName() {
		return foodName;
	}



	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}



	public String getCatagory() {
		return catagory;
	}



	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}



	public String getTaste() {
		return taste;
	}



	public void setTaste(String taste) {
		this.taste = taste;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "ShoppingCart [id=" + id + ", foodName=" + foodName + ", catagory=" + catagory + ", taste=" + taste
				+ ", email=" + email + ", price=" + price + "]";
	}



	
	
	
	

}
