package com.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.oscar.xc.tools.ODBHelper;

import com.configs.ConfigMysqlDB;

public class Count {
    public static int count(String username){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		
		String sql_c = "select count(*) from user where teacher1 = \'" + username + "\' or teacher2 = \'" + username + "\' or teacher3 = \'" + username + "\';";

		ResultSet rs = dbHelper.executeQuery(sql_c);
		
		int num = 0;
		
		try {
			rs.next();
			num = Integer.valueOf(rs.getString(1));
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		return num;
    }
    
    public static String[] user(String username){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);

		String sql_u = "select username from user where teacher1 = \'" + username + "\' or teacher2 = \'" + username + "\' or teacher3 = \'" + username + "\';";

		
		ResultSet rs = dbHelper.executeQuery(sql_u);
		
		String[] user =new String[50];
		int num = 0;
		
		try {
			while(rs.next()){
				user[num] = rs.getString(1);
				num++;
			}
			
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		return user;
    }
    
    public static String[][] work(String username){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);

		int num = count(username);
		String[] user = new String[num];
		user = user(username);
		
		int i=0,j=0;
		String[][] work =new String[50][9];
		String[][] result =new String[50][7];
		
		String temp = "";
		
		while(i<num){
			String sql_s = "select count(*) from work where username = \'" + user[i] + "\';";
			ResultSet rs1 = dbHelper.executeQuery(sql_s);
			try {
				rs1.next();
				temp = rs1.getString(1);
			} catch (SQLException e1) {
				// TODO 自动生成的 catch 块
				e1.printStackTrace();
			}

			
			String sql_w = "select * from work where username = \'" + user[i] + "\' and week = " + temp + ";";
			ResultSet rs2 = dbHelper.executeQuery(sql_w);
			
			String [] weekday = {"星期一：","星期二：","星期三：","星期四：","星期五：","星期六：","星期日："};
			
			try {
				if(rs2.next()){
					result[i][2]="";
					for(j=0;j<7;j++){
						try {
							work[i][j] = rs2.getString(j+4);
						} catch (SQLException e) {
							// TODO 自动生成的 catch 块
							e.printStackTrace();
						}
						result[i][2]=result[i][2]+weekday[j]+work[i][j]+"<br>";
					}	
					result[i][1]=rs2.getString(3);
					result[i][4]=rs2.getString(11);
					result[i][5]=rs2.getString(12);
					result[i][6]=rs2.getString(13);
				}
				else{
					result[i][1]="";
					result[i][2]="";
					result[i][5]="";
					result[i][6]="";
				}
				String sql_n = "select * from user where username = \'" + user[i] + "\';";
				ResultSet rs3 = dbHelper.executeQuery(sql_n);
				rs3.next();
				result[i][0]=rs3.getString(5);
				result[i][3]=user[i];
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
						
			i++;			
		}
		
		return result;
    }
    
    public static String comment(String username){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);

		String result = "";
		String temp = "";
		
		String sql_s = "select count(*) from work where username = \'" + username + "\';";
		ResultSet rs = dbHelper.executeQuery(sql_s);
		
		try {
			rs.next();
			temp = rs.getString(1);
		} catch (SQLException e1) {
				// TODO 自动生成的 catch 块
				e1.printStackTrace();
		}
	
		String sql_w = "select * from work where username = \'" + username + "\' and week = " + temp + ";";
		rs = dbHelper.executeQuery(sql_w);
			
		try {
			if(rs.next()){
				result = rs.getString(11);
			}
			else{
				result="";
			}
		} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
		}			
		return result;
    }
}
