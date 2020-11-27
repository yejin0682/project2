package com.yg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yg.dto.BoardDTO;

public class QnABoardDAO {
	private static final QnABoardDAO instance = new QnABoardDAO();
	private QnABoardDAO() {}
	public static QnABoardDAO getinstance() {
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
	
	public int countboard() {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select count(*) from qnaboard";
		int count=-1;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	public ArrayList<BoardDTO> showboard(int page) {
		
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		ArrayList<BoardDTO> list=new ArrayList<BoardDTO>();
		
		try {
			conn = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String sql="select * from qnaboard order by ref desc, step asc limit 20 offset "+((page-1)*20);
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO boarddto=new BoardDTO();
				boarddto.setQbno(rs.getInt("qbno"));
				boarddto.setQtitle(rs.getString("qtitle"));
				boarddto.setQcontent(rs.getString("qcontent"));
				boarddto.setID(rs.getString("ID"));
				boarddto.setQwritedate(rs.getString("qwritedate"));
				boarddto.setQhitcount(rs.getInt("qhitcount"));
				boarddto.setRef(rs.getInt("ref"));
				boarddto.setLevel(rs.getInt("level"));
				boarddto.setStep(rs.getInt("step"));
				list.add(boarddto);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			closeConnection(conn,pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public int countsearch_subject(String subject) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select count(*) from qnaboard where qtitle like '%"+subject+"%'";
		int count=-1;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
				System.out.println(count);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public ArrayList searchboard_subject(String search, int page) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO bdto=null;
		ArrayList<BoardDTO> list =new ArrayList<BoardDTO>();
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select * from qnaboard where qtitle like '%"+search+"%' limit 20 offset " +((page-1)*20);
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				bdto=new BoardDTO();
				bdto.setQbno(rs.getInt("qbno"));
				bdto.setQtitle(rs.getString("qtitle"));
				bdto.setQcontent(rs.getString("qcontent"));
				bdto.setID(rs.getString("ID"));
				bdto.setQwritedate(rs.getString("qwritedate"));
				bdto.setQhitcount(rs.getInt("qhitcount"));
				list.add(bdto);
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
	
	public int countsearch_content(String content) {
		
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
		conn=getConnection();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	String sql="select count(*) from qnaboard where qcontent like '%"+content+"%'";
	int count=-1;
	
	try {
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			count=rs.getInt(1);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	try {
		closeConnection(conn, pstmt, rs);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return count;
	}
	
	public ArrayList searchboard_content(String search, int page) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO bdto=null;
		ArrayList<BoardDTO> list =new ArrayList<BoardDTO>();
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select * from qnaboard where qcontent like '%"+search+"%' limit 20 offset " +((page-1)*20);
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				bdto=new BoardDTO();
				bdto.setQbno(rs.getInt("qbno"));
				bdto.setQtitle(rs.getString("qtitle"));
				bdto.setQcontent(rs.getString("qcontent"));
				bdto.setID(rs.getString("ID"));
				bdto.setQwritedate(rs.getString("qwritedate"));
				bdto.setQhitcount(rs.getInt("qhitcount"));
				list.add(bdto);
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
	
	public int countsearch_writer(String writer) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		String sql="select count(*) from qnaboard where ID='"+writer+"'";
		int count=-1;
	
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
		
			if(rs.next()) {
				count=rs.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		try {
			closeConnection(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return count;
	}
	
	public ArrayList searchboard_writer(String search, int page) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO bdto=null;
		ArrayList<BoardDTO> list =new ArrayList<BoardDTO>();
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="select * from qnaboard where ID like '%"+search+"%' limit 20 offset " +((page-1)*20);
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				bdto=new BoardDTO();
				bdto.setQbno(rs.getInt("qbno"));
				bdto.setQtitle(rs.getString("qtitle"));
				bdto.setQcontent(rs.getString("qcontent"));
				bdto.setID(rs.getString("ID"));
				bdto.setQwritedate(rs.getString("qwritedate"));
				bdto.setQhitcount(rs.getInt("qhitcount"));
				list.add(bdto);
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
	
	public BoardDTO showcontent(String qbno) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO bdto= new BoardDTO();
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String sql="select * from qnaboard where qbno='"+qbno+"'";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bdto.setID(rs.getString("ID"));
				bdto.setQtitle(rs.getString("qtitle"));
				bdto.setQcontent(rs.getString("qcontent"));
				bdto.setQwritedate(rs.getString("qwritedate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bdto;
	}
	
	public void uphitcount(String qbno) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="update qnaboard set qhitcount=qhitcount+1 where qbno="+qbno;
		try {
			pstmt=conn.prepareStatement(sql);
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
	
	public void writeboard(String qtitle,String qcontent,String ID) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="insert into qnaboard(qtitle, qcontent,ID,level, step) values(?,?,?,0,0)";
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, qtitle);
			pstmt.setString(2, qcontent);
			pstmt.setString(3, ID);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql="select qbno from qnaboard order by qbno desc limit 1";
		int qbno=0;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				qbno=rs.getInt(1);
			}
			System.out.println(qbno);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql="update qnaboard set ref="+qbno+" where qbno="+qbno;
		try {
			pstmt=conn.prepareStatement(sql);
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
	
	
	public void replyboard(String ID, int bno, String qtitle, String qcontent) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		String sql="select * from qnaboard where qbno="+bno;
		int level=-1;
		int ref=-1;
		int step=-1;

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				level=rs.getInt("level");
				ref=rs.getInt("ref");
				step=rs.getInt("step");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql="update qnaboard set step=step+1 where ref="+ref+" and step>="+(step+1);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		sql="INSERT INTO qnaboard(qtitle, qcontent, ID, ref, level, step) VALUES (?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, qtitle);
			pstmt.setString(2, qcontent);
			pstmt.setString(3, ID);
			pstmt.setInt(4, ref);
			pstmt.setInt(5, level+1);
			pstmt.setInt(6, step+1);
			
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
	
	public void updateboard(String qbno, String qtitle, String qcontent) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="update qnaboard set qtitle='"+qtitle+"', qcontent='"+qcontent+"' where qbno="+qbno;
		try {
			pstmt=conn.prepareStatement(sql);
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
	
	public int countrefboard(int qbno, int level) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int count=-1;
		String sql="select count(*) from qnaboard where ref="+qbno+" and level>"+level;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			closeConnection(conn, pstmt, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	public void deleteUpdatetitle(int qbno) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="update qnaboard set qtitle='원글이 삭제되었습니다' where qbno="+qbno;
		try {
			pstmt=conn.prepareStatement(sql);
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
	
	public void deleteboard(int qbno) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String sql="delete from qnaboard where qbno="+qbno;
		try {
			pstmt=conn.prepareStatement(sql);
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
	
	

}
