package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yg.dto.ProductDTO;
import com.yg.dto.ReviewDTO;

public class ReviewDAO {
	private static final ReviewDAO instance= new ReviewDAO();
	private ReviewDAO() {}
	public static ReviewDAO getInstance() {
		return instance;
	}
	private Connection getConnection() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		 conn =DriverManager.getConnection("jdbc:mysql://localhost/kok07227?characterEncoding=UTF-8"+"&serverTimezone=UTC","kok07227","yejin020811");
		 return conn;
	}
	private void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException {
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
	
	public ProductDTO bringProduct(int obno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO pDto = null;
		
		try {
			conn = getConnection();
			String sql = "select o.obno, p.image, p.pname, o.color, o.size " + 
					"from project2.order o " + 
					"left outer join product p on o.pno = p.pno " + 
					"where o.obno="+obno;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pDto = new ProductDTO();
				pDto.setImage(rs.getString("image"));
				pDto.setPname(rs.getString("pname"));
				pDto.setColor(rs.getString("color"));
				pDto.setSize(rs.getString("size"));
			}
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pDto;
	}
	
	public void insertReviewBoard(ReviewDTO rDto, int obno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			String sql = "INSERT INTO reviewboard(rtitle, rcontent, ID, pno, ref, obno, filename1, filename2) VALUES (?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rDto.getRtitle());
			pstmt.setString(2, rDto.getRcontent());
			pstmt.setString(3, rDto.getID());
			pstmt.setInt(4, rDto.getPno());
			pstmt.setInt(5, rDto.getRbno());
			pstmt.setInt(6, rDto.getObno());
			pstmt.setString(7, rDto.getFilename1());
			pstmt.setString(8, rDto.getFilename2());
			pstmt.executeUpdate();
			
			sql="UPDATE reviewboard set ref=rbno where level=0";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="update project2.order set review=2 where obno="+obno;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public int countreviewboard(int pno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count=0;
		
		String sql="select count(*) from reviewboard where pno="+pno+" order by rbno desc";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public ArrayList<ReviewDTO> selectReviewBoard(int page,int pno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		ReviewDTO rDto = null;
		try {
			conn = getConnection();

			int size = 10;
			String sql = "select rbno, product.pname, ID, rwritedate, rhitcount, level from reviewboard left outer join product on reviewboard.pno = product.pno " 
					+"where product.pno="+pno+" order by ref desc, step asc limit "+size+" offset "+size*(page-1);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rDto = new ReviewDTO();
				rDto.setRbno(rs.getInt("rbno"));
				rDto.setRtitle(rs.getString("pname"));	
				rDto.setID(rs.getString("ID"));
				rDto.setRwritedate(rs.getString("rwritedate"));
				rDto.setRhitcount(rs.getInt("rhitcount"));
				rDto.setLevel(rs.getInt("level"));
				
				list.add(rDto);
			}
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public ReviewDTO showReview(String rbno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewDTO rDto = null;
		try {
			conn = getConnection();
			String sql="UPDATE reviewboard set rhitcount=(rhitcount+1) where rbno="+rbno;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "select p.pno, p.image, p.pname, r.* , o.color, o.size from reviewboard r " + 
					"left outer join product p on r.pno = p.pno " + 
					"left outer join project2.order o on o.obno = r.obno " + 
					"where rbno="+rbno;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rDto = new ReviewDTO();
				rDto.setImage(rs.getString("image"));
				rDto.setPname(rs.getString("pname"));
				rDto.setRtitle(rs.getString("rtitle"));
				rDto.setRcontent(rs.getString("rcontent"));
				rDto.setPno(rs.getInt("pno"));
				rDto.setID(rs.getString("ID"));
				rDto.setRwritedate(rs.getString("rwritedate"));
				rDto.setRhitcount(rs.getInt("rhitcount"));
				rDto.setRef(rs.getInt("ref"));
				rDto.setLevel(rs.getInt("level"));
				rDto.setStep(rs.getInt("step"));
				rDto.setColor(rs.getString("color"));
				rDto.setSize(rs.getString("size"));
				rDto.setFilename1(rs.getString("filename1"));
				rDto.setFilename2(rs.getString("filename2"));
				rDto.setObno(rs.getInt("obno"));
			}
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rDto;
	}
	
	public void updateReview(String rbno, String title, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql ="UPDATE reviewboard set rtitle='"+title+"', rcontent='"+content+"', rwritedate=current_timestamp() where rbno="+rbno;
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			closeConnection(conn, pstmt, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteReview(String rbno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql ="delete from reviewboard where rbno="+rbno;	
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			closeConnection(conn, pstmt, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//==========reply============
	public void insertReply(ReviewDTO rDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			
			int mystep = rDto.getStep()+1;
			String sql="update reviewboard set step=(step+1) where ref="+rDto.getRef()+" and step>="+mystep;
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();

			sql = "INSERT INTO reviewboard(rtitle, rcontent, ID, pno, ref, level, step, obno) VALUES (?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rDto.getRtitle());
			pstmt.setString(2, rDto.getRcontent());
			pstmt.setString(3, rDto.getID());
			pstmt.setInt(4, rDto.getPno());
			pstmt.setInt(5, rDto.getRef());
			pstmt.setInt(6, rDto.getLevel()+1);
			pstmt.setInt(7, rDto.getStep()+1);
			pstmt.setInt(8, rDto.getObno());
			pstmt.executeUpdate();
			
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
