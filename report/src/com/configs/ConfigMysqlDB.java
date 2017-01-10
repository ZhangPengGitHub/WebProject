package com.configs;

public class ConfigMysqlDB {
	/* 数据库链接串，可以修改dbPath改变打开数据库的路径 */
    public static final String dbDriver = "com.mysql.jdbc.Driver"; // 数据库驱动
    public static final String dbUrl = "jdbc:mysql://localhost:3306/oscar_workreport?useUnicode=true&characterEncoding=utf8";
    public static final String dbUser = "root"; // 用户名
    public static final String dbPassword = "root"; // 密码

}
