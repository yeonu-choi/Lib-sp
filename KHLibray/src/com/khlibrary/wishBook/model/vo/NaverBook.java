package com.khlibrary.wishBook.model.vo;

public class NaverBook {
	 private String title;
	 private String link;
	 private String image;
	 private String author;
	 private String price;
	 private String discount;
	 private String publisher;
	 private String pubdate;
	 private String isbn;
	 private String description;
	 
	 public NaverBook() {}
	 
	 
	 public NaverBook(String title, String author, String publisher, String pubdate, String image) {
		super();
		this.title = title;
		this.image = image;
		this.author = author;
		this.publisher = publisher;
		this.pubdate = pubdate;
	}


	public NaverBook(String title, String link, String image, String author, String price, String discount,
			String publisher, String pubdate, String isbn, String description) {
		super();
		this.title = title;
		this.link = link;
		this.image = image;
		this.author = author;
		this.price = price;
		this.discount = discount;
		this.publisher = publisher;
		this.pubdate = pubdate;
		this.isbn = isbn;
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPubdate() {
		return pubdate;
	}

	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return title + "," + author + "," + publisher + "," + pubdate;
	}

	 
}
