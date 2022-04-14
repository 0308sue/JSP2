package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.board.dto.BoardDTO;
import com.util.DBConnection;


public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		
		return instance;
	}

;

	public void boardInsert(BoardDTO board) {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		int num = board.getNum();
		int ref = board.getRef();
		int re_step = board.getRe_step();
		int re_level = board.getRe_level();
		int number = 0;
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement("select max(num) from board");
			rs = ps.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1)+1;
			}else {
				number = 1;
			}
			if(num!=0) {
				String sql = "update board set re_step = re_step +1 where ref =? and re_step >?";
						ps = con.prepareStatement(sql);
						ps.setInt(1, ref);
						ps.setInt(2, re_step);
						ps.executeUpdate();
						
						re_step = re_step+1;
						re_level = re_level+1;
				
			}else {
				ref =number;
				re_step =0;
				re_level=0;
			}
			
			StringBuilder sb = new StringBuilder();
			sb.append("insert into board");
			sb.append("(num,writer,subject,email,content,ip,ref,re_step,re_level,passwd)");
			sb.append("values(board_seq.nextval,?,?,?,?,?,?,?,?,?)");
			ps=con.prepareStatement(sb.toString());
			ps.setString(1, board.getWriter());		
			ps.setString(2, board.getSubject());
			ps.setString(3, board.getEmail());
			ps.setString(4, board.getContent());
			ps.setString(5, board.getIp());
			ps.setInt(6, ref);
			ps.setInt(7, re_step);
			ps.setInt(8, re_level);
			ps.setString(9, board.getPasswd());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con,ps,null,null);
		}
	}
	
	private void closeConnection(Connection con, PreparedStatement ps,Statement st, ResultSet rs) {
		try {
			if(con!=null) con.close();
			if(ps!=null) ps.close();
			if(st!=null) st.close();
			if(rs!=null) rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BoardDTO> boardList(String field, String word, int startRow, int endRow){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
//      String sql="";
		ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();
		
		try {
			con = DBConnection.getConnection();
//			if(word.equals("")) { //°Ë»ö¾Æ´Ô
//				sql = "select * from  board order by ref desc, re_step asc";
//			}else {
//				sql = "select * from  board where "+ field +" like '%"
//			                      +word+"%' order by ref desc, re_step asc";
//			}
			StringBuilder sb = new StringBuilder();
			if(word.equals("")) { //°Ë»ö¾Æ´Ô
				sb.append("select * from( ");
				sb.append("select rownum rn, aa.* from ( ");
				sb.append("select * from board order by ref desc, re_step asc) aa");
				sb.append("  where rownum <= ?");
				sb.append(")  where rn>=?");
			}else { //°Ë»ö
				sb.append("select * from( ");
				sb.append("select rownum rn, aa.* from ( ");
				sb.append("select * from board where "+field +" like '%"+word+"%'");
				sb.append(" order by ref desc, re_step asc) aa");
				sb.append("  where rownum <= ?");
				sb.append(")  where rn>=?");
			}
			ps = con.prepareStatement(sb.toString());
			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO b = new BoardDTO();
				b.setNum(rs.getInt("num"));
				b.setSubject(rs.getString("subject"));
				b.setWriter(rs.getString("writer"));
				b.setReg_date(rs.getString("reg_date"));
				b.setReadcount(rs.getInt("readcount"));
				arr.add(b);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			closeConnection(con, null, null, rs);
		}
		return arr;
	}
	
	public BoardDTO findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		BoardDTO b = null;
		String sql = "";
		try {
			con = DBConnection.getConnection();
			st = con.createStatement();
			sql = "update board set readcount = readcount+1 where num ="+num;
			rs = st.executeQuery(sql);
			
			sql = "select * from board where num ="+num;
			rs = st.executeQuery(sql);
			if(rs.next()) {
				b = new BoardDTO();
				b.setNum(rs.getInt("num"));
				b.setContent(rs.getString("content"));
				b.setReadcount(rs.getInt("readcount"));
				b.setWriter(rs.getString("writer"));
				b.setSubject(rs.getString("subject"));
				b.setReg_date(rs.getString("reg_date"));
				b.setEmail(rs.getString("email"));
				b.setRef(rs.getInt("ref"));
				b.setRe_step(rs.getInt("re_step"));
				b.setRe_level(rs.getInt("re_level"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		return b;
	}
	
	public int boardUpdate(BoardDTO board) {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		int flag = 0;
		String sql ="";
		try {
			con = DBConnection.getConnection();
			sql = "select passwd from board where num ="+board.getNum();
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("passwd").equals(board.getPasswd())) {
					sql = "update board set writer =?,subject=?,email=?,content=? where num=?";
					ps = con.prepareStatement(sql);
					ps.setString(1, board.getWriter());		
					ps.setString(2, board.getSubject());
					ps.setString(3, board.getEmail());
					ps.setString(4, board.getContent());
					ps.setInt(5, board.getNum());
					flag = ps.executeUpdate();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, ps, null, null);
		}
		return flag;
	}
	
	public int boardDelete(int num) {
		Connection con = null;
		Statement st = null;
		int flag = 0;
		try {
			con = DBConnection.getConnection();
			String sql = "delete from board where num =" +num;
			st= con.createStatement();
			flag = st.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, null);
		}
		return flag;
	}
	
	public int getCount(String field,String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "";
		try {
			con = DBConnection.getConnection();
			if(word.equals("")) {
				sql = "select count(*) from board";
			}else {
				sql = "select count(*) from board where "+field+" like '%"+word+"%'";
			}
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		
		return count;
	}
}
