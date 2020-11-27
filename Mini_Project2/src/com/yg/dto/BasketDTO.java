package com.yg.dto;

public class BasketDTO {
	private int basketno;
	private String ID;
	private int pno;
	private String color;
	private String size;
	private int qty;
	
	public BasketDTO(int basketno, String iD, int pno, String color, String size,int qty) {
		super();
		this.basketno = basketno;
		ID = iD;
		this.pno = pno;
		this.color = color;
		this.size = size;
		this.qty=qty;
	}
	
	public BasketDTO() {
		
	}

	public int getBasketno() {
		return basketno;
	}

	public void setBasketno(int basketno) {
		this.basketno = basketno;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
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

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
	
}
