package com.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Add {
	public static String add(String info){
		int temp1 = -1,temp2 = -1;
		for(int i = 0;i<info.length();i++){
			if(info.charAt(i)==',' && temp1 == -1){
				temp1 = i;
			}else if(info.charAt(i)==',' && temp2 == -1){
				temp2 = i;
			}
		}
		String stationId = "";
		String longitude = "";
		String latitude = "";

		if(temp1==0){
			return "请输入电站代码";
		}else{
			stationId = info.substring(0, temp1);
		}
		if(temp1+1==temp2){
			return "请输入经度";
		}else{
			longitude = info.substring(temp1+1, temp2);
		}
		if(temp2+1==info.length()){
			return "请输入纬度";
		}else{
			latitude = info.substring(temp2+1,info.length());
		}
		
		if(stationId.length()==8){
			for(int i = 0;i<8;i++){
				if(stationId.charAt(i)>='0'&&stationId.charAt(i)<='9'){
					
				}else{
					return "电站代码格式错误";
				}
			}
		}else{
			return "电站代码格式错误";
		}
		
		temp1 = -1;
		temp2 = -1;
		String longitude1 = "";
		String longitude2 = "";
		String latitude1 = "";
		String latitude2 = "";
		
		for(int i = 0;i<longitude.length();i++){
			if(longitude.charAt(i)=='.'){
				temp1 = i;
			}
		}
		if(temp1 == -1){
			int i = 1;
			if(longitude.charAt(0) == '-'){
				
			}else{
				i = 0;
			}
			for(;i<longitude.length();i++){
				if(longitude.charAt(i)>='0'&&longitude.charAt(i)<='9'){
					
				}else{
					return "经度格式错误";
				}
			}
		}else if(temp1 == 0){
			return "经度格式错误";
		}else{
			longitude1 = longitude.substring(0, temp1);
			longitude2 = longitude.substring(temp1+1,longitude.length());
			int i = 1;
			if(longitude1.charAt(0) == '-'){
				
			}else{
				i = 0;
			}
			for(;i<longitude1.length();i++){
				if(longitude1.charAt(i)>='0'&&longitude1.charAt(i)<='9'){
					
				}else{
					return "经度格式错误";
				}
			}
			if(longitude2.length()<=6&&longitude2.length()>0){
				for(i = 0;i<longitude2.length();i++){
					if(longitude2.charAt(i)>='0'&&longitude2.charAt(i)<='9'){
						
					}else{
						return "经度格式错误";
					}
				}
			}else{
				return "经度格式错误";
			}
		}

		for(int i = 0;i<latitude.length();i++){
			if(latitude.charAt(i)=='.'){
				temp2 = i;
			}
		}
		if(temp2 == -1){
			int i = 1;
			if(latitude.charAt(0) == '-'){
				
			}else{
				i = 0;
			}
			for(;i<latitude.length();i++){
				if(latitude.charAt(i)>='0'&&latitude.charAt(i)<='9'){
					
				}else{
					return "纬度格式错误";
				}
			}
		}else if(temp2 == 0){
			return "纬度格式错误";
		}else{
			latitude1 = latitude.substring(0, temp2);
			latitude2 = latitude.substring(temp2+1,latitude.length());
			int i = 1;
			if(latitude1.charAt(0) == '-'){
				
			}else{
				i = 0;
			}
			for(;i<latitude1.length();i++){
				if(latitude1.charAt(i)>='0'&&latitude1.charAt(i)<='9'){
					
				}else{
					return "纬度格式错误";
				}
			}
			if(latitude2.length()<=6&&latitude2.length()>0){
				for(i = 0;i<latitude2.length();i++){
					if(latitude2.charAt(i)>='0'&&latitude2.charAt(i)<='9'){
						
					}else{
						return "纬度格式错误";
					}
				}
			}else{
				return "纬度格式错误";
			}
		}
		
		double dlongitude = Double.parseDouble(longitude);
		double dlatitude = Double.parseDouble(latitude);
		if(dlongitude>=-180 && dlongitude<=180){
		}else{
			return "经度范围错误";
		}
		if(dlatitude>=-90 && dlatitude<=90){
		}else{
			return "纬度范围错误";
		}
		
		String tude = longitude + " " + latitude;
		
		DbCon dbcon = new DbCon();
		Connection conn = dbcon.getconn();
		
		int num = 0,number = 0; 
		String comparison[] = null;
		try{
	    	String sql = "select count(*) from station where demo = \'经纬度\'";
	    	Statement statement = conn.createStatement();
	    	ResultSet set = statement.executeQuery(sql);
	    	while(set.next()){
	    		num = Integer.valueOf(set.getString(1));
	    	}
	    	statement.close();
	    }catch(Exception e){
	    	//TODO:handle exception
	    	e.printStackTrace();
	    }
		comparison = new String[num];
		
		try{
	    	String sql = "select power_id from station where demo = '经纬度'";
	    	Statement statement = conn.createStatement();
	    	ResultSet set = statement.executeQuery(sql);
	    	while(set.next()){
	    		comparison[number] = set.getString(1);
	    		number++;
	    	}
	    	statement.close();
	    	//conn.close();
	    }catch(Exception e){
	    	//TODO:handle exception
	    	e.printStackTrace();
	    }
		for(int i = 0;i < num;i++){
			if(stationId.equals(comparison[i])){
				return "已存在此电站代码";
			}
		}
		try{
	    	String sql1 = "insert into station values ( \'" + stationId +"\',\'名称\',\'水电站\');";
	    	String sql2 = "insert into station values ( \'" + stationId +"\',\'地址\',\'凌工路\');";
	    	String sql3 = "insert into station values ( \'" + stationId +"\',\'经纬度\',\'" + tude + "\');";
	    	String sql4 = "insert into station values ( \'" + stationId +"\',\'市\',\'贵阳市\');";
	    	String sql5 = "insert into station values ( \'" + stationId +"\',\'区\',\'乌当区\');";
	    	Statement statement1 = conn.createStatement();
	    	Statement statement2 = conn.createStatement();
	    	Statement statement3 = conn.createStatement();
	    	Statement statement4 = conn.createStatement();
	    	Statement statement5 = conn.createStatement();
	    	statement1.execute(sql1);
	    	statement2.execute(sql2);
	    	statement3.execute(sql3);
	    	statement4.execute(sql4);
	    	statement5.execute(sql5);
	    	statement1.close();
	    	statement2.close();
	    	statement3.close();
	    	statement4.close();
	    	statement5.close();
	    	conn.close();
	    }catch(Exception e){
	    	//TODO:handle exception
	    	e.printStackTrace();
	    }
		return "添加成功";
	}
}
