package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yg.dto.MemberDTO;

public class MemberDAO {
	
	private static final MemberDAO instance = new MemberDAO();
	private MemberDAO() {}
	public static MemberDAO getinstance() {
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
	
	public ArrayList<MemberDTO> showmember() {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		MemberDTO mdto =null;
		ArrayList<MemberDTO> list =new ArrayList<MemberDTO>();
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select * from member";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				mdto=new MemberDTO();
				mdto.setID(rs.getString("ID"));
				mdto.setPW(rs.getString("PW"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setEmail(rs.getString("email"));
				mdto.setAddress(rs.getString("address"));
				list.add(mdto);
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
	
	public void insertMemberJoin(MemberDTO memberdto) {
		
		Connection conn= null;
		PreparedStatement pstmt=null;
		
		
		try {
			conn=getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			String sql="insert into member(ID, PW, name, phone, address, email) values(?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberdto.getID());
			pstmt.setString(2, memberdto.getPW());
			pstmt.setString(3, memberdto.getName());
			pstmt.setString(4, memberdto.getPhone());
			pstmt.setString(5, memberdto.getAddress());
			pstmt.setString(6, memberdto.getEmail());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn,pstmt, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean selectLogin(String ID, String PW) {
		
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		Connection conn=null;
		boolean check =false;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select count(*) from member where ID='"+ID+"' and PW='"+PW+"'";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			int total=0;
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
			if(total==1) {
				check=true;
			} else {
				check=false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn,pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;

	}

	public void deleteMember(String ID) {
		
		Connection conn= null;
		PreparedStatement pstmt=null;
		
		
		try {
			conn=getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			String sql="delete from member where ID='"+ID+"'";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn,pstmt, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String findmemberid_email(String name, String email) {
		
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		boolean check =false;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select ID from member where name='"+name+"' and email='"+email+"'";
		String ID="";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				ID=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			closeConnection(conn,pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ID;

	}
	
	public String findmemberid_phone(String name, String phone) {
		
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		boolean check =false;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select ID from member where name='"+name+"' and phone='"+phone+"'";
		String ID="";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				ID=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			closeConnection(conn,pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ID;

	}
	
	public String findmemberpw_email(String ID, String name, String email) {
		
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select PW from member where ID='"+ID+"' and name='"+name+"' and email='"+email+"'";
		String PW="";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				PW=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			closeConnection(conn,pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return PW;

	}
	
	public String findmemberpw_phone(String ID, String name, String phone) {
		
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select PW from member where ID='"+ID+"' and name='"+name+"' and phone='"+phone+"'";
		String PW="";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				PW=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			closeConnection(conn,pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return PW;

	}
	
	public MemberDTO memberinfoselect(String ID) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO mdto = new MemberDTO();
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select * from member where ID='"+ID+"'";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mdto.setID(rs.getString("ID"));
				mdto.setPW(rs.getString("PW"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setAddress(rs.getString("address"));
				mdto.setEmail(rs.getString("email"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mdto;
		
	}
	
	public MemberDTO memberinfoupdate(String ID, String PW, String name, String address, String phone, String email) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="update member set PW=?, name=?, address=?, phone=?, email=? where ID='"+ID+"'";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, PW);
			pstmt.setString(2, name);
			pstmt.setString(3, address);
			pstmt.setString(4, phone);
			pstmt.setString(5, email);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql="select * from member where ID='"+ID+"'";
		MemberDTO mdto=new MemberDTO();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mdto.setID(rs.getString("ID"));
				mdto.setPW(rs.getString("PW"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setAddress(rs.getString("address"));
				mdto.setEmail(rs.getString("email"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mdto;
		
	}
}
