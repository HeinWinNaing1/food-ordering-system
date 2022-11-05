package com.hostmdy.model;

public class Food {
	
	private int id;
	private String foodName;
	private String catagory;
	private String taste;
	private int price;
	
	public Food() {}
	
	public Food(String foodName, String catagory, String taste, int price) {
		super();
		this.foodName = foodName;
		this.catagory = catagory;
		this.taste = taste;
		this.price = price;
	}

	public Food(int id, String foodName, String catagory, String taste, int price) {
		super();
		this.id = id;
		this.foodName = foodName;
		this.catagory = catagory;
		this.taste = taste;
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

	@Override
	public String toString() {
		return "Food [id=" + id + ", foodName=" + foodName + ", catagory=" + catagory + ", taste=" + taste + ", price="
				+ price + "]";
	}
	
	

}
