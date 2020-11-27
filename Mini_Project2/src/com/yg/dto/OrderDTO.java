package com.yg.dto;

public class OrderDTO {
	private int obno;
	private int pno;
	private int qty;	//-->색상. 사이즈?
	private String ID;
	private String orderdate;
	private String color;
	private String size;
	private int review;
	
	public OrderDTO() {}
	public OrderDTO(int obno, int pno, int qty, String iD, String orderdate, String color, String size) {
		super();
		this.obno = obno;
		this.pno = pno;
		this.qty = qty;
		ID = iD;
		this.orderdate = orderdate;
		this.color=color;
		this.size=size;
	}
	public int getObno() {
		return obno;
	}
	public void setObno(int obno) {
		this.obno = obno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
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
	public int getReview() {
		return review;
	}
	public void setReview(int review) {
		this.review = review;
	}
	
	

	
	
	
}
