package com.db;
import java.sql.Connection;
import java.sql.DriverManager;

public class DbCon {
	Connection conn = null;
	public Connection getconn(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			//TODO:handle exception
			e.printStackTrace();
		}
		String url = "jdbc:mysql://localhost:3306/hydropower";
		String useName = "root";
		String password = "root";
		try{
			conn = DriverManager.getConnection(url,useName,password);
//			if(conn!=null){
//				System.out.println("连接数据库成功");	
//			}	
		}catch(Exception e){
			//TODO:handle exception
			e.printStackTrace();
		}
		return conn;
	}
}
