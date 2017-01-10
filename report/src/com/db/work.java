package com.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.oscar.xc.tools.ODBHelper;

import com.configs.ConfigMysqlDB;
import com.times.WorkWeek;

public class work {
    public static String count(String username){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		
		String sql = "SELECT count(*) FROM work where username = \'" + username + "\';";

		ResultSet rs = dbHelper.executeQuery(sql);
		
		String num = "";
		
		try {
			rs.next();
			num = rs.getString(1);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	
		return num;
	}

    public static ResultSet selectWork(String username){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		
		String sql = "SELECT * FROM work where username = \'" + username + "\';";

		ResultSet rs = dbHelper.executeQuery(sql);
		
		return rs;
	}
    
    public static ResultSet selectThisweekWork(String username){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);

		String temp = "";
		
		String sql_s = "select count(*) from work where username = \'" + username + "\';";
		ResultSet rs1 = dbHelper.executeQuery(sql_s);
		try {
			rs1.next();
			temp = rs1.getString(1);
		} catch (SQLException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		}

		
		String sql_w = "select * from work where username = \'" + username + "\' and week = " + temp + ";";
		ResultSet rs2 = dbHelper.executeQuery(sql_w);
		
		return rs2;
	}
    
    public static ResultSet selectWork(String username,String week){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		//Random r = new Random();
		
		String sql = "SELECT * FROM work where username = \'" + username + "\' and week = " + week + ";";

		ResultSet rs = dbHelper.executeQuery(sql);
		
		return rs;
	}

    public static void updateWork(String username , String content){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		//Random r = new Random();
		
		Date dt = new Date();
		int tempweek1 = WorkWeek.getWeekOfDate(dt) - 1;
		
		String temp_content = content.replaceAll("'", "''");
		
		String [] dbweek = {"Work_Mon","Work_Tue","Work_Wed","Work_Thu","Work_Fri","Work_Sat","Work_Sun"};
		
		String sql_s = "select count(*) from work where username = \'" + username + "\';";

		ResultSet rs = dbHelper.executeQuery(sql_s);
		String tempweek2 = "";
		try {
			rs.next();
			tempweek2 = rs.getString(1);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		String sql_u = "update work set " + dbweek[tempweek1] + "= \'" + temp_content + "\' where username = \'" + username + "\' and week = \'" + tempweek2 + "\';";
		dbHelper.executeNonQuery(sql_u);
		
		return;
	}
    
    public static void updateWork(String username , String content,int id){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		//Random r = new Random();
		
		//Date dt = new Date();
		int tempweek1 = id - 1;
		
		String temp_content = content.replaceAll("'", "''");
		
		String [] dbweek = {"Work_Mon","Work_Tue","Work_Wed","Work_Thu","Work_Fri","Work_Sat","Work_Sun"};
		
		String sql_s = "select count(*) from work where username = \'" + username + "\';";

		ResultSet rs = dbHelper.executeQuery(sql_s);
		String tempweek2 = "";
		try {
			rs.next();
			tempweek2 = rs.getString(1);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		String sql_u = "update work set " + dbweek[tempweek1] + "= \'" + temp_content + "\' where username = \'" + username + "\' and week = \'" + tempweek2 + "\';";
		
		dbHelper.executeNonQuery(sql_u);
		
		return;
	}
    
    public static void updateComment(String username , String content){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		//Random r = new Random();
		
		String sql_s = "select count(*) from work where username = \'" + username + "\';";
		ResultSet rs = dbHelper.executeQuery(sql_s);
		
		String tempweek = "";
		
		String temp_content = content.replaceAll("'", "''");
		
		try {
			rs.next();
			tempweek = rs.getString(1);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		String sql_u = "update work set Comment = \'" + temp_content + "\' where username = \'" + username + "\' and week = \'" + tempweek + "\';";
		
		dbHelper.executeNonQuery(sql_u);
		
		return;
	}

    public static void updateplan(String username , String content){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		//Random r = new Random();
		
		String sql_s = "select count(*) from work where username = \'" + username + "\';";

		ResultSet rs = dbHelper.executeQuery(sql_s);
		
		String temp_content = content.replaceAll("'", "''");
		
		int week = 0;
		try {
			rs.next();
			week = Integer.valueOf(rs.getString(1));
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		String sql = "update work set Plan = \'" + temp_content + "\' where username = \'" + username + "\' and week = \'" + week + "\';";
		dbHelper.executeNonQuery(sql);
		
		return;
    }
    
    public static void updateifplan(String username , int id){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		//Random r = new Random();
		
		String sql_s = "select count(*) from work where username = \'" + username + "\';";

		ResultSet rs = dbHelper.executeQuery(sql_s);
		
		int week = 0;
		try {
			rs.next();
			week = Integer.valueOf(rs.getString(1));
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		String sql = "update work set IF_PLAN = " + id + " where username = \'" + username + "\' and week = \'" + week + "\';";
		dbHelper.executeNonQuery(sql);
		
		return;
    }
    
    public static void updatereason(String username , String content){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		//Random r = new Random();
		
		String sql_s = "select count(*) from work where username = \'" + username + "\';";

		ResultSet rs = dbHelper.executeQuery(sql_s);
		
		String temp_content = content.replaceAll("'", "''");
		
		int week = 0;
		try {
			rs.next();
			week = Integer.valueOf(rs.getString(1));
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		String sql = "update work set Reason = \'" + temp_content + "\' where username = \'" + username + "\' and week = \'" + week + "\';";
		dbHelper.executeNonQuery(sql);
		
		return;
    }
    
    public static void insertWork(String username , String mytime, String str){
		
		ODBHelper dbHelper = 
			new ODBHelper(ConfigMysqlDB.dbDriver, ConfigMysqlDB.dbUrl, ConfigMysqlDB.dbUser, ConfigMysqlDB.dbPassword);
		//Random r = new Random();

		String sql_s = "select count(*) from work where username = \'" + username + "\';";

		ResultSet rs = dbHelper.executeQuery(sql_s);
		int tempweek = 0;
		try {
			rs.next();
			tempweek = Integer.valueOf(rs.getString(1));
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		String week = String.valueOf(tempweek+1);
		String sql_u = "insert into work values ( \'" + username +" \'," + week + ",\'\',\'\',\'\',\'\',\'\',\'\',\'\',\'\',\'\'," + 1 +",\'\');";
		dbHelper.executeNonQuery(sql_u);
		
		return;
	}
}
