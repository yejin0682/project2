package com.yg.dto;

public class ProductDTO {
	private int pno;
	private String pname;
	private int price;
	private String image;
	private String inform;
	private String productInfo;
	private String sizeInfo;
	private String color;
	private String size;
	
	public ProductDTO() {}
	public ProductDTO(String pname, int price, String image, String inform, String productInfo, String sizeInfo, String color, String size) {
		super();
		this.pname = pname;
		this.price = price;
		this.image = image;
		this.inform = inform;
		this.productInfo = productInfo;
		this.sizeInfo = sizeInfo;
		this.color=color;
		this.size=size;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getInform() {
		return inform;
	}
	public void setInform(String inform) {
		this.inform = inform;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getSizeInfo() {
		return sizeInfo;
	}
	public void setSizeInfo(String sizeInfo) {
		this.sizeInfo = sizeInfo;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
	
	
}
