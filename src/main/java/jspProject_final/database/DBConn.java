package jspProject_final.database;

import java.sql.*;
import java.io.*;
import java.util.*;

public class DBConn {
	public static Connection dbConnect;
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521";
			String user = "jspProject";
			String pass = "wns2044021";
			
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(url, user, pass);
			
			System.out.println("DB연결 성공");
		} catch (ClassNotFoundException cnfe) {
			System.out.println("DB 드라이버 로딩 실패 : " + cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속실패 : " + sqle.toString());
		} catch (Exception e) {
			System.out.println("DB 연결 에러");
			e.printStackTrace();
		}
		return conn;
	}

//	-----------------Oracle DB 첫 번째 버전------------------
//	// mysql
////	String jdbcDriver = "jdbc:mysql://localhost:3306/jspDB?" +
////						"useSSL=false&serverTimezone=UTC";
////	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
//	
//	// oracle
//	String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
//	String DB_Url = "jdbc:oracle:thin:@localhost:1521";
//	String DB_User = "jspProject";
//	String DB_Pass = "wns2044021";
//	
//	Connection DB_conn;
//	public Statement DB_stmt;
//	ResultSet DB_rs;
//	
//	public Connection DBConnect() throws IOException {
//		try {
//			Class.forName(jdbcDriver);
//			DB_conn = DriverManager.getConnection(DB_Url, DB_User, DB_Pass);
//			DB_stmt = DB_conn.createStatement();
//			System.out.println("DB 연결 성공");
//			return DB_conn;
//		} catch (Exception e) {
//			System.out.println("DBConnect 실패");
//			System.out.println(e.getMessage());
//			return null;
//		}
//	}
//	
//	public void DBClose() throws IOException {
//		try {
//			if(DB_rs!=null) DB_rs.close();
//			if(DB_stmt!=null) DB_stmt.close();
//			if(DB_conn!=null) DB_conn.close();
//		} catch (Exception e) {
//			System.out.println("DBClose 실패");
//			System.out.println(e.getMessage());
//		}
//	}
	
	
}
