package com.kh.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

//WEB-INF 폴더안의 sql문이나 properties파일 건들지않기
//src안에 내용이 컴파일?돼서 있는것임
//톰캣이 제공해줌
// ct+shift+c : 주석, alt+shift+s : 생성자 get/set 자동완성

public class JDBCTemplate {
	
	// 1. Connection 객체 생성 한후 해당 Connection 반환하는 메서드
	public static Connection getConnection() {
		
		Properties prop = new Properties(); // Map 계열 컬렉션(key-value)
		
		// 읽어들이고자 하는 driver.properties파일의 물리적인 경로
		
		String fileName = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
		// JDBCTemplate.class는 컴파일된 class파일을 의미
		// getResource 함수의 첫번째 / 는 classes 폴더를 의미함
		
		// C:\Web-workspace2\JSP_Project\WebContent\WEB-INF\classes\sql\driver;
		
		try {
			prop.load(new FileInputStream(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Connection conn = null;
		
		// 1) jdbc 드라이버 등록
		try {
			Class.forName(prop.getProperty("driver"));
			
			// 2) DB와 접속후 Connection객체 생성
			conn = DriverManager.getConnection(prop.getProperty("url"), 
					prop.getProperty("username"),
					prop.getProperty("password")
					);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 2. 전달받은 Connection 객체를 가지고 commit해주는 메서드
	
	// 3. 전달받은 Connection 객체를 가지고 rollback해주는 메소드
	
	// 4. Connection 객체를 반납해주는 메소드
	
	// 5. Statement 객체를 반납시켜주는 메소드
	
	// 6. ResultSet객체를 반납시켜주는 메소드
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
