<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <meta http-equiv="Content-Language" content="zh-cn">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <base target="_blank">
     <title>软件优化组，大连理工大学，工作汇报</title>
     <link rel="stylesheet" type="text/css" href="css/index.css" />

  </head>
  
  <body>
    <div id="title">
	    <h1>大连理工大学软件优化组工作汇报</h1>
	
	<form action="Index" target="_self" method="post">
	<div id="content">
	<p>请输入用户名和密码：</p>
	<p class="input">账号：<input type="text" name="username" /></p>
	<p class="input">密码：<input type="password" name="password" style="width: 155px; "/></p>
	<p class="input"><input type="submit" value="登录" class="button" /><input type="reset" value="重置" class="button" /></p>
	</div>
	</form></div>
  </body>
</html>
