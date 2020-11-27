package com.yg.dto;

public class MemberDTO {
	private String ID;
	private String PW;
	private String name;
	private String phone;
	private String email;
	private String address;
	
	public MemberDTO() {
		
	}
	
	public MemberDTO(String iD, String pW, String name, String phone, String address, String email) {
		super();
		ID = iD;
		PW = pW;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPW() {
		return PW;
	}
	public void setPW(String pW) {
		PW = pW;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
