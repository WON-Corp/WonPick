package com.wonPick.member.model.dao;

import static com.wonPick.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.wonPick.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filepath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filepath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	public Member loginMember(Connection conn, String id, String pwd) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
						rset.getString("USER_ID"),
						rset.getString("PASSWORD"),
						rset.getString("USER_NAME"),
						rset.getString("NICK_NAME"),
						rset.getString("EMAIL"),
						rset.getString("PHONE"),
						rset.getString("GENDER"),
						rset.getDate("BIRTH"),
						rset.getString("INTRODUCE"),
						rset.getString("P_IMG")
						);
			};
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getNickName());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getGender());
			pstmt.setDate(8, m.getBirth());
			pstmt.setString(9, m.getIntroduce());
			pstmt.setString(10, m.getpImg());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;	// JDBC 객체 --> SQL문 실행 후 결과를 받아올 객체
		ResultSet rset = null;
		
		String sql = prop.getProperty("userIdCheck");
		
		try {
			
			pstmt = conn.prepareStatement(sql);		
			
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();
			
			if(rset.next())
			result = rset.getInt("COUNT");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public Member findMemberById(Connection conn, String userName, String email) {
        Member m = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("findMemberById");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userName);
            pstmt.setString(2, email);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                m = new Member();
                m.setUserId(rset.getString("USER_ID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return m;
    }

    public Member findMemberByPassword(Connection conn, String userName, String email) {
        Member m = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("findMemberByPassword");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userName);
            pstmt.setString(2, email);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                m = new Member();
                m.setPassword(rset.getString("PASSWORD"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return m;
    }

}
