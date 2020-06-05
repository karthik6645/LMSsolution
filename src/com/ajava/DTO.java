package com.ajava;

public class DTO {
	private String id; 
	private String title;; 
	private String author; 
	private String category; 
	private String rating; 
	private String price;
	private int empty=0;
	public int getEmpty() {
		return empty;
	}
	public void setEmpty(int empty) {
		this.empty = empty;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	} 
}
