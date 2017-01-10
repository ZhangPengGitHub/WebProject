package com.db;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Resolve {

	static String result = "";
	static String head = "";
	static String tail = "";

	static String dateversion = "";
	static Date date = new Date();
	static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

	public static String resolve(String postString) {

		result = "";
		head = "";
		tail = "";

		dateversion = df.format(date);

		int temp1 = 0, temp2 = 0;
		for (int i = 0, j = 0; i < postString.length() && j < 3; i++) {
			if (j == 0 && postString.charAt(i) == ':') {
				j++;
			} else if (j == 1 && postString.charAt(i) == '"') {

				j++;
				temp1 = i;
			} else if (j == 2 && postString.charAt(i) == '"') {
				j++;
				temp2 = i;
			}
		}
		String keywords = postString.substring(temp1 + 1, temp2);

		temp1 = 0;
		temp2 = 0;
		for (int i = 0, j = 0; i < keywords.length() && j < 2; i++) {
			if (j == 0 && keywords.charAt(i) == ',') {
				j++;
				temp1 = i;
			} else if (j == 1 && keywords.charAt(i) == ',') {

				j++;
				temp2 = i;
			}
		}

		String keywords1 = keywords.substring(0, temp1);
		String keywords2 = keywords.substring(temp1 + 1, temp2);
		String keywords3 = keywords.substring(temp2 + 1, keywords.length());

		String array[][] = Query.queryWithName(keywords1, keywords2, keywords3);

		if(array.length <= 0){
			return result;
		}
		for (int i = 0; i < array.length; i++) {
			result += "{\"phone\":\"\"," + "\"lonlat\":\"" + array[i][2]
					+ "\"," + "\"address\":\"" + array[i][1] + "\","
					+ "\"hotPointID\":\"\"," + "\"name\":\"" + array[i][0]
					+ "\"," + "\"url\":\"\"},";
		}
		result = "\"pois\":[" + result + "],";
		head = "{\"3.0.2\":\"searchversion\",\"count\":\"" + array.length
				+ "\",";
		tail = "\"resultType\":1,\"dataversion\":\""
				+ dateversion
				+ "\",\"landmarkcount\":0,\"prompt\":[{\"admins\":[{\"name\":\"北京市\",\"adminCode\":156110000}],\"type\":4}],\"keyWord\":\""
				+ keywords + "\",\"engineversion\":\"20140513\"}";
		result = head + result + tail;
		return result;
	}
}
