package com.wonPick.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.wonPick.model.Member;

public class MemberDAO {
	
	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "C##SEMI";
	private static final String PASSWORD = "1234";
	

	
	public void addData(/*Member m*/) {
		// 추후 회원가입 적용
	}
	
	public ArrayList<Member> fileRead() { 
		ArrayList<Member> mlist = new ArrayList<>();
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			// Oracle JDBC 드라이버를 로드합니다.
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 데이터베이스에 연결합니다.
			connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);

			// SQL 쿼리를 실행합니다.
			statement = connection.createStatement();
			String query = "SELECT * FROM MEMBER";
			resultSet = statement.executeQuery(query);

			// 결과를 처리합니다.
			while (resultSet.next()) {
				mlist.add( new Member(
						resultSet.getString(1), 
						resultSet.getString(3), 
						resultSet.getString(4),
						resultSet.getString(2), 
						resultSet.getString(5),
						resultSet.getString(6),
						resultSet.getString(7),
						resultSet.getString(8)));
			} 
			
		} catch (ClassNotFoundException e) {
			System.out.println("Oracle JDBC 드라이버를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결에 실패했습니다.");
			e.printStackTrace();
		} finally {
			// 리소스를 해제합니다.
			try {
				if (resultSet != null)
					resultSet.close();
				if (statement != null)
					statement.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mlist;
	}
	
	public void changeData() {
		
	}
	
	public void deleteData() {

	}

}
