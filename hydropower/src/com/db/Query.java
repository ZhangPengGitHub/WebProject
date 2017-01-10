package com.db;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

public class Query {
	public static String[][] queryWithName(String keywords1, String keywords2,
			String keywords3) {
		int num = 0, num1 = 0, num2 = 0;
		int number = 0, number1 = 0, number2 = 0;
		int mynum = 0;
		int mynumber = 0;
		String[][] result = null;
		String[] result1 = null;
		String[] result2 = null;
		DbCon dbcon = new DbCon();
		Connection conn = dbcon.getconn();
		if (keywords2.equals("省")) {
			try {
				String sql = "select count(*) from station where demo = \'名称\' and value like \'%"
						+ keywords1 + "%\'";
				Statement statement = conn.createStatement();
				ResultSet set = statement.executeQuery(sql);
				if (set.next()) {
					num = Integer.valueOf(set.getString(1));
				}
				statement.close();
			} catch (Exception e) {
				// TODO:handle exception
				e.printStackTrace();
			}

			result = new String[num][3];
			try {
				String sql = "select power_id from station where demo = '名称' and value like '%"
						+ keywords1 + "%'";
				String sql1 = "";
				String sql2 = "";
				String sql3 = "";
				Statement statement = conn.createStatement();
				ResultSet set = statement.executeQuery(sql);
				while (set.next()) {
					String power_id = set.getString(1);
					sql1 = "select value from station where demo = '名称' and power_id = '"
							+ power_id + "'";
					sql2 = "select value from station where demo = '地址' and power_id = '"
							+ power_id + "'";
					sql3 = "select value from station where demo = '经纬度' and power_id = '"
							+ power_id + "'";
					Statement statement1 = conn.createStatement();
					Statement statement2 = conn.createStatement();
					Statement statement3 = conn.createStatement();
					ResultSet set1 = statement1.executeQuery(sql1);
					ResultSet set2 = statement2.executeQuery(sql2);
					ResultSet set3 = statement3.executeQuery(sql3);
					if (set1.next()) {
						result[number][0] = set1.getString(1);
					}
					if (set2.next()) {
						result[number][1] = set2.getString(1);
					}
					if (set3.next()) {
						result[number][2] = set3.getString(1);
					}
					number++;
				}
				statement.close();
				conn.close();
			} catch (Exception e) {
				// TODO:handle exception
				e.printStackTrace();
			}
		} else {
			try {
				String sql1 = "select count(*) from station where demo = \'名称\' and value like \'%"
						+ keywords1 + "%\'";
				String sql2 = "select count(*) from station where demo = '"
						+ keywords2 + "' and value = '" + keywords3 + "'";
				Statement statement1 = conn.createStatement();
				Statement statement2 = conn.createStatement();
				ResultSet set1 = statement1.executeQuery(sql1);
				ResultSet set2 = statement2.executeQuery(sql2);
				if (set1.next()) {
					num1 = Integer.valueOf(set1.getString(1));
				}
				if (set2.next()) {
					num2 = Integer.valueOf(set2.getString(1));
				}
				statement1.close();
				statement2.close();
			} catch (Exception e) {
				// TODO:handle exception
				e.printStackTrace();
			}

			int i = 0, j = 0;
			result1 = new String[num1];
			result2 = new String[num2];
			try {
				String sql01 = "select power_id from station where demo = '名称' and value like '%"
						+ keywords1 + "%'";
				String sql02 = "select power_id from station where demo = '"
						+ keywords2 + "' and value = '" + keywords3 + "'";
				String sql1 = "";
				String sql2 = "";
				String sql3 = "";
				Statement statement01 = conn.createStatement();
				Statement statement02 = conn.createStatement();
				ResultSet set01 = statement01.executeQuery(sql01);
				ResultSet set02 = statement02.executeQuery(sql02);
				while (set01.next()) {
					result1[number1++] = set01.getString(1);
				}
				while (set02.next()) {
					result2[number2++] = set02.getString(1);
				}
				statement01.close();
				statement02.close();
				while (i < result1.length) {
					j = 0;
					while (j < result2.length) {
						if (result1[i].equals(result2[j])) {
							mynum++;
						}
						j++;
					}
					i++;
				}
				
				result = new String[mynum][3];
				i = 0;
				while (i < result1.length) {
					j = 0;
					while (j < result2.length) {
						if (result1[i].equals(result2[j])) {
							sql1 = "select value from station where demo = '名称' and power_id = '"
									+ result1[i] + "'";
							sql2 = "select value from station where demo = '地址' and power_id = '"
									+ result1[i] + "'";
							sql3 = "select value from station where demo = '经纬度' and power_id = '"
									+ result1[i] + "'";
							Statement statement1 = conn.createStatement();
							Statement statement2 = conn.createStatement();
							Statement statement3 = conn.createStatement();
							ResultSet set1 = statement1.executeQuery(sql1);
							ResultSet set2 = statement2.executeQuery(sql2);
							ResultSet set3 = statement3.executeQuery(sql3);
							if (set1.next()) {
								result[mynumber][0] = set1.getString(1);
							}
							if (set2.next()) {
								result[mynumber][1] = set2.getString(1);
							}
							if (set3.next()) {
								result[mynumber][2] = set3.getString(1);
							}
							mynumber++;

							statement1.close();
							statement2.close();
							statement3.close();
							
						}
						j++;
					}
					i++;
				}
				conn.close();
			} catch (Exception e) {
				// TODO:handle exception
				e.printStackTrace();
			}
		}
		return result;
	}
}
