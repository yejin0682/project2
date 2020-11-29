package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yg.dto.ProductDTO;

public class ProductDAO {
	private static final ProductDAO instance = new ProductDAO();
	private ProductDAO() {}
	public static ProductDAO getinstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Connection conn=null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		 conn =DriverManager.getConnection("jdbc:mysql://localhost/kok07227?characterEncoding=UTF-8"+"&serverTimezone=UTC","kok07227","yejin020811");
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
	
	public ArrayList<ProductDTO> selectProductMain() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO pDto = null;
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			conn = getConnection();
			String sql = "select * from product where pno>=22 and pno<=29";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pDto = new ProductDTO();
				pDto.setPno(rs.getInt("pno"));
				pDto.setPname(rs.getString("pname"));
				pDto.setPrice(rs.getInt("price"));
				pDto.setImage(rs.getString("image"));
				pDto.setInform(rs.getString("inform"));
				list.add(pDto);
			}
			
			closeConnection(conn, pstmt, rs);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public ArrayList<ProductDTO> selectListImgs() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO pDto = null;
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			conn = getConnection();
			String sql = "select * from listdb where ino <= 12";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pDto = new ProductDTO();
				pDto.setPno(rs.getInt("ino"));
				pDto.setImage(rs.getString("src"));
				list.add(pDto);
			}
			
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<ProductDTO> selectListImgs2() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO pDto = null;
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			conn = getConnection();
			String sql = "select * from listdb where ino >= 13";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pDto = new ProductDTO();
				pDto.setPno(rs.getInt("ino"));
				pDto.setImage(rs.getString("src"));
				list.add(pDto);
			}
			
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ProductDTO> selectProduct() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO pDto = null;
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			conn = getConnection();
			String sql = "select * from product where pno<22";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pDto = new ProductDTO();
				pDto.setPno(rs.getInt("pno"));
				pDto.setPname(rs.getString("pname"));
				pDto.setPrice(rs.getInt("price"));
				pDto.setImage(rs.getString("image"));
				pDto.setInform(rs.getString("inform"));
				list.add(pDto);
			}
			
			closeConnection(conn, pstmt, rs);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public ProductDTO selectProductDetail(String pno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO pDto = null;
		
		try {
			conn = getConnection();
			String sql = "select * from product where pno = "+pno;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pDto = new ProductDTO();
				pDto.setPno(rs.getInt("pno"));
				pDto.setPname(rs.getString("pname"));
				pDto.setPrice(rs.getInt("price"));
				pDto.setImage(rs.getString("image"));
				pDto.setInform(rs.getString("inform"));
				pDto.setProductInfo(rs.getString("productInfo"));
				pDto.setSizeInfo(rs.getString("sizeInfo"));
				pDto.setColor(rs.getString("color"));
				pDto.setSize(rs.getString("size"));
			}
			closeConnection(conn, pstmt, rs);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pDto;
	}
	
	public void admin_insertproduct(String name, String color, String size, int price, String image, String inform, String product_info, String size_info, String category) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="insert into product(pname, price, image, inform, productInfo, sizeInfo, color,size,category) values(?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, image);
			pstmt.setString(4, inform);
			pstmt.setString(5, product_info);
			pstmt.setString(6, size_info);
			pstmt.setString(7, color);
			pstmt.setString(8, size);
			pstmt.setString(9, category);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ProductDTO> searchvalue(String value) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO pDto = null;
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			conn = getConnection();
			String sql = "select * from product where category='"+value+"'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pDto = new ProductDTO();
				pDto.setPno(rs.getInt("pno"));
				pDto.setPname(rs.getString("pname"));
				pDto.setPrice(rs.getInt("price"));
				pDto.setImage(rs.getString("image"));
				pDto.setInform(rs.getString("inform"));
				list.add(pDto);
			}
			
			closeConnection(conn, pstmt, rs);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
}
