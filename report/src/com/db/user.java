package com.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.oscar.xc.tools.ODBHelper;

import com.configs.ConfigMysqlDB;

public class user {
    public static ResultSet selectUser(){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		
		String sql = "SELECT * FROM user;";
		
		ResultSet rs = dbHelper.executeQuery(sql);
		
		return rs;
	}

    public static int selectUser(String username){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		
		String sql = "SELECT * FROM user where username = \'" + username + "\';";
		
		ResultSet rs = dbHelper.executeQuery(sql);
		
		int result = 0;
			
		try {
			rs.next();
			result = Integer.valueOf(rs.getString(3));
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		return result;
	}
    
    public static void updatePassword(String username,String password){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		
		String sql = "update user set password = \'" + password + "\' where username = \'" + username + "\';";
		
		dbHelper.executeNonQuery(sql);
		
		return;
	}
}

