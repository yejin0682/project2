package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yg.dto.BasketDTO;


public class BasketDAO {
	
	private static final BasketDAO instance = new BasketDAO();
	private BasketDAO() {}
	public static BasketDAO getinstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Connection conn=null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		 conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/project2?characterEncoding=UTF-8"+"&serverTimezone=UTC","root","tiger");
		return conn;
	}
	
	private void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) throws Exception{
		if(rs!=null) {
			rs.close();
		}
		if(pstmt!=null) {
			pstmt.close();
		}
		if(conn!=null) {
			conn.close();
		}
	}
	
	
	
	private static final String CLEAN_PSTMT = "UPDATE basketDB SET validity = 2 where userID = ?";

	public ArrayList<BasketDTO> showbasket(String ID) {
		ArrayList<BasketDTO> baskets = new ArrayList<BasketDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BasketDTO bdto=null;
		String RETRIEVE_PSTMT = "SELECT * FROM basket where ID ='"+ID+"' and validity = 1";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(RETRIEVE_PSTMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bdto=new BasketDTO();
				bdto.setBasketno(rs.getInt("basketno"));
				bdto.setPno(rs.getInt("pno"));
				bdto.setColor(rs.getString("color"));
				bdto.setSize(rs.getString("size"));
				bdto.setQty(rs.getInt("qty"));
				baskets.add(bdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return baskets;
		
	}
	
	public BasketDTO showbasket(int bno) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BasketDTO bdto=null;
		String RETRIEVE_PSTMT = "SELECT * FROM basket where basketno ="+bno;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(RETRIEVE_PSTMT);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bdto=new BasketDTO();
				bdto.setBasketno(rs.getInt("basketno"));
				bdto.setPno(rs.getInt("pno"));
				bdto.setColor(rs.getString("color"));
				bdto.setSize(rs.getString("size"));
				bdto.setQty(rs.getInt("qty"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bdto;
		
	}
	
	public void basketAdd(String ID, int pno, int qty, String color, String size) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String ADD_PSTMT = "INSERT INTO basket(ID, pno, qty,color,size,validity) VALUES(?,?,?,?,?,1)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(ADD_PSTMT);
			
			pstmt.setString(1, ID);
			pstmt.setInt(2, pno);
			pstmt.setInt(3, qty);
			pstmt.setString(4, color);
			pstmt.setString(5, size);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void basketDelete(int basketid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String DELETE_PSTMT = "UPDATE basket SET validity = 2 where basketno = "+basketid;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(DELETE_PSTMT);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void basketClean(int userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(CLEAN_PSTMT);
			pstmt.setInt(1, userid);
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
