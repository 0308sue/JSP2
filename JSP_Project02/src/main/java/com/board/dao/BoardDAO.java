package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.board.dto.BoardDTO;
import com.util.DBConnection;


public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		
		return instance;
	}

;
	String sql = "insert into board values(num,writer,subject,email,content,passwd)"
			+"values(board_seq.nextval,?,?,?,?,?)";
	public void boardInsert(BoardDTO board) {
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
			con = DBConnection.getConnection();
//			String sql = "insert into board values(num,writer,subject,email,content,ip,passwd)"
//					+"values(board_seq.nextval,?,?,?,?,?,?)";
			StringBuilder sb = new StringBuilder();
			sb.append("insert into board");
			sb.append("(num,writer,subject,email,content,ip,passwd)");
			sb.append("values(board_seq.nextval,?,?,?,?,?,?)");
			ps=con.prepareStatement(sb.toString());
			ps.setString(1, board.getWriter());		
			ps.setString(2, board.getSubject());
			ps.setString(3, board.getEmail());
			ps.setString(4, board.getContent());
			ps.setString(5, board.getIp());
			ps.setString(6, board.getPasswd());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	}
	
	public ArrayList<BoardDTO> boardList(){
		return null;
	}
	
	public BoardDTO findByNum(int num) {
		return null;
	}
	
	public int boardUpdate(BoardDTO board) {
		return 0;
	}
	
	public int boardDelete(BoardDTO board) {
		return 0;
	}
	
	public int getCount() {
		return 0;
	}
}
