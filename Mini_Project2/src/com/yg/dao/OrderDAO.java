package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yg.dto.BasketDTO;
import com.yg.dto.MemberDTO;
import com.yg.dto.OrderDTO;

public class OrderDAO {
	
	private static final OrderDAO instance = new OrderDAO();
	private OrderDAO() {}
	public static OrderDAO getinstance() {
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
	
	
	public ArrayList<OrderDTO> showorder() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		OrderDTO dto = null;
		
		try {
			conn = getConnection();
			String sql = "select o.*, p.price " + 
					"from project2.order o " + 
					"left outer join product p on o.pno = p.pno " + 
					"order by obno desc;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new OrderDTO();
				dto.setObno(rs.getInt("obno"));
				dto.setPno(rs.getInt("pno"));
				dto.setQty(rs.getInt("qty"));
				dto.setID(rs.getString("ID"));
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setColor(rs.getString("color"));
				dto.setSize(rs.getString("size"));
				list.add(dto);
			}
			
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<OrderDTO> selectOrderByDate(String date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		OrderDTO dto = null;
		
		try {
			conn = getConnection();
			String sql = "select o.*, p.price from project2.order o " + 
					"left outer join product p on o.pno = p.pno " + 
					"where o.orderdate like '%"+date+"%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new OrderDTO();
				dto.setObno(rs.getInt("obno"));
				dto.setPno(rs.getInt("pno"));
				dto.setQty(rs.getInt("qty"));
				dto.setID(rs.getString("ID"));
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setColor(rs.getString("color"));
				dto.setSize(rs.getString("size"));
				list.add(dto);
			}
			
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int selectDailySales(String date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int dailySales = 0;
		try {
			conn = getConnection();
			String sql = "select sum(p.price) from project2.order o " + 
					"left outer join product p on o.pno = p.pno " + 
					"where o.orderdate like '%"+date+"%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				dailySales = rs.getInt(1);
			
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dailySales;
	}
	
	
	public int showsumsales(String date1, String date2) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select a.qty, b.price from project2.order a, project2.product b where a.pno=b.pno and a.orderdate >=substring('"+date1+"',1,10) and a.orderdate <=substring('"+date2+"',1,10)";
		int totalprice=0;
		int qty=0;
		int price=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				qty=rs.getInt("qty");
				price=rs.getInt("price");
				totalprice=totalprice+(qty*price);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalprice;
	}
	
	public int CompareSales(String date) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select a.qty, b.price from project2.order a, project2.product b where a.pno=b.pno and a.orderdate ='"+date+"'";
		int totalprice=0;
		int qty=0;
		int price=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				qty=rs.getInt("qty");
				price=rs.getInt("price");
				totalprice=totalprice+(qty*price);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalprice;
	}
	
	public int showchart(String date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select a.qty, b.price from project2.order a, project2.product b where a.pno=b.pno and a.orderdate like '%"+date+"%'";
		int totalprice=0;
		int qty=0;
		int price=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				qty=rs.getInt("qty");
				price=rs.getInt("price");
				totalprice=totalprice+(qty*price);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalprice;
	}
	
	//주문(order테이블에 넣기, 장바구니에서 삭제)
	public void insertorder(String ID, int bno) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BasketDTO bdto=new BasketDTO();
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select * from basket where basketno="+bno; 
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bdto.setBasketno(rs.getInt("basketno"));
				bdto.setColor(rs.getString("color"));
				bdto.setPno(rs.getInt("pno"));
				bdto.setSize(rs.getString("size"));
				bdto.setQty(rs.getInt("qty"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sql="insert into project2.order(pno,qty,ID,color,size) values(?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, bdto.getPno());
			pstmt.setInt(2, bdto.getQty());
			pstmt.setString(3, ID);
			pstmt.setString(4, bdto.getColor());
			pstmt.setString(5, bdto.getSize());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql="UPDATE basket SET validity = 2 where basketno ="+bno;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public OrderDTO showordernum(String ID) {
		
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		OrderDTO odto=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select * from project2.order where ID='"+ID+"' order by orderdate desc limit 1";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				odto=new OrderDTO();
				odto.setObno(rs.getInt("obno"));
				odto.setOrderdate(rs.getString("orderdate"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return odto;
	}
	
	public void directinsert(int pno, String color, String size, int qty, String ID) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		OrderDTO odto=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="insert into project2.order(pno,qty,ID,color,size) values(?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			pstmt.setInt(2, qty);
			pstmt.setString(3, ID);
			pstmt.setString(4, color);
			pstmt.setString(5, size);
			
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
	
	//mypage-주문내역 조회
	public ArrayList<OrderDTO> showorderlist(String ID) {
		
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		ArrayList<OrderDTO> list= new ArrayList<OrderDTO>();
		
		OrderDTO odto =null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select * from project2.order where ID='"+ID+"' order by obno desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				odto=new OrderDTO();
				odto.setObno(rs.getInt("obno"));
				odto.setPno(rs.getInt("pno"));
				odto.setQty(rs.getInt("qty"));
				odto.setOrderdate(rs.getString("orderdate"));
				odto.setColor(rs.getString("color"));
				odto.setSize(rs.getString("size"));
				odto.setReview(rs.getInt("review"));
				list.add(odto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
