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
	
	<meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF8">

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="css/password.css" />
    
    <base target="_blank">
    <title>软件优化组，大连理工大学，工作汇报，修改密码</title>

  </head>
  
  <body>
    <div id="information">
    <p id="p1"><%=session.getAttribute("username")%>已登录</p>
	<p id="p2"><a href="/report/Back" target="_self">返回</a></p>
	<p><a href="jsp/index.jsp" target="_self">注销登录</a></p>
	</div>
	<div class="clear"></div>
    <div id="title">
	    <h1>大连理工大学软件优化组工作汇报</h1>
	</div>
	<div id="content">
	<form action="Password" target="_self" method="post">
	<p class="input">输入旧密码：<input type="password" name="old"></input></p>
	<p class="input">输入新密码：<input type="password" name="new"></input></p>
	<p class="input">确认新密码：<input type="password" name="again"></input></p>
	<p class="input"><input type="submit" value="确认" class="button" /><input type="reset" value="重置" class="button" /></p>
	</form>
	</div>
  </body>
</html>
