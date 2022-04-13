package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import com.member.dto.MemberDTO;
import com.util.DBConnection;

public class MemberDAOImpl  implements MemberDAO{
	
	private static MemberDAOImpl instance = new MemberDAOImpl();
	public static MemberDAOImpl getInstance() {
		
		return instance;
	}

	//추가 
	@Override
	public void memberInsert(MemberDTO member) {
		String sql = "insert into memberdb values(?,?,?,?,?,?)";
		try (Connection con =DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql)){
				ps.setString(1, member.getName());
				ps.setString(2, member.getUserid());
				ps.setString(3, member.getPwd());
				ps.setString(4, member.getEmail());
				ps.setString(5, member.getPhone());
				ps.setInt(6, member.getAdmin());
				ps.executeUpdate();
			}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	//전제보기
	@Override
	public ArrayList<MemberDTO> memberList() {
		 ArrayList<MemberDTO> arr = new  ArrayList<MemberDTO>();
		String sql = "select * from memberdb";
		try (Connection con =DBConnection.getConnection();
			Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql)){
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setAdmin(rs.getInt("admin"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setPwd(rs.getString("pwd"));
				member.setUserid(rs.getString("userid"));
				arr.add(member);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}

	//수정
	@Override
	public void memberUpdate(MemberDTO dto) {
		String sql = "update memberdb set name =?,pwd=?,email=?,phone=?,admin=? where userid=?";
		try (Connection con =DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)){
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getPhone());
			ps.setInt(5, dto.getAdmin());
			ps.setString(6, dto.getUserid());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//삭제
	@Override
	public void memberdelete(String userid) {
		String sql="delete from memberdb where userid ='" +userid+"'";
		try(Connection con =DBConnection.getConnection();
			Statement st = con.createStatement();
			){
			st.executeQuery(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	//상세보기
	@Override
	public MemberDTO findByID(String userid) {
		String sql="select * from memberdb where userid ='" +userid+"'";
		MemberDTO member = null;
		try(Connection con =DBConnection.getConnection();
			Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql)){
			if(rs.next()) {
				member = new MemberDTO();
				member.setAdmin(rs.getInt("admin"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setPwd(rs.getString("pwd"));
				member.setUserid(rs.getString("userid"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	//아이디 중복 체크
	@Override
	public String idCheck(String userid) {
		String flag ="yes";
		String sql="select * from memberdb where userid ='" +userid+"'";
		try(Connection con =DBConnection.getConnection();
			Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql))
		{if(rs.next()) {
			flag = "no";
		}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	//로그인 체크
	@Override
	public int loginCheck(String userid, String pwd) {
		int flag =-1;
		String sql="select pwd,admin from memberdb where userid='" +userid+"'";
		try(Connection con =DBConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql))
		{if(rs.next()) {
			if(rs.getString("pwd").equals(pwd)) {
				flag =rs.getInt("admin");
			}else {
				flag =2;
			}
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	//회원수
	@Override
	public int getCount() {
		String sql = "select count(*) from memberdb";
		int count = 0;
		try(Connection con =DBConnection.getConnection();
			Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql)){
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

}
