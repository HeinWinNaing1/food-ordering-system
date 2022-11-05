package com.hostmdy.model;

public class FoodOrder {

	private int id;
	private String email;
	private String date;
	private int quantity;
	private int rate;
	private String foodName;
	private int price;

	public FoodOrder() {
	}

	

	public FoodOrder(String email, String date, int quantity, int rate, String foodName, int price) {
		super();
		this.email = email;
		this.date = date;
		this.quantity = quantity;
		this.rate = rate;
		this.foodName = foodName;
		this.price = price;
	}



	public FoodOrder(int id, String email, String date, int quantity, int rate, String foodName, int price) {
		super();
		this.id = id;
		this.email = email;
		this.date = date;
		this.quantity = quantity;
		this.rate = rate;
		this.foodName = foodName;
		this.price = price;
	}



	public int getRate() {
		return rate;
	}



	public void setRate(int rate) {
		this.rate = rate;
	}



	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	@Override
	public String toString() {
		return "FoodOrder [id=" + id + ", email=" + email + ", date=" + date + ", price=" + price + ", foodName="
				+ foodName + "]";
	}

}
