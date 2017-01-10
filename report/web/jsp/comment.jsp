<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%request.setCharacterEncoding("GB2312"); %>
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
    <link rel="stylesheet" type="text/css" href="css/comment.css" />

    <base target="_blank">
    <title>软件优化组，大连理工大学，工作汇报，导师点评</title>

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
	<form action="Comment" target="_self" method="post">
	<%String content[][] = (String[][])session.getAttribute("content");%>
    <%int num = (Integer)session.getAttribute("id");%>
	<p class="input">点评:<br/><textarea rows="5" cols="60" name="comment"><%=content[num][4]%></textarea></p>
	<p class="input"><input type="submit" value="保存" class="button1" /><input type="reset" value="重置" class="button2" /></p>
	</form>
	</div>
  </body>
</html>
