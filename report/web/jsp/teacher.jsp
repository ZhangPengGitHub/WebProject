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
    <link rel="stylesheet" type="text/css" href="css/teacher.css" />
    
    <base target="_blank">
    <title>软件优化组，大连理工大学，工作汇报，导师首页</title>

  </head>
  
  <body>
    <div id="information">
	    <p id="p1"><%=session.getAttribute("username")%>已登录</p>
		<p id="p2"><a href="jsp/password.jsp" target="_self">修改密码</a></p>
		<p><a href="jsp/index.jsp" target="_self">注销登录</a></p>
	</div>
	<div class="clear"></div>
    <div id="title">
	    <h1>大连理工大学软件优化组工作汇报</h1>
	</div>
	<div class="content">
	<%String content[][] = (String[][])session.getAttribute("content");%>
	<%for (int i=0;i<(Integer)(session.getAttribute("count"));i++){ %>
	<form action="Teacher?id=<%=i %>" target="_self" method="post">
	<p class="display"><a href="/report/WorkTeacher?num=<%=i%>" target="_self"><%=content[i][0]%></a>：<br/><br/>本周计划：<p id="plan"><%=content[i][1]%></p>
	<div class="clear"></div>
	<p class="display2">本周工作总结：<p id="work"><%=content[i][2]%></p>
	<div class="clear"></div>
	<p class="input"><input type="submit" value="点评" class="button1" /></p>
	</form>
	<%if(content[i][5].equals("3")){ %>
	<form action="Alter?id=<%=i %>" target="_self" method="post">
	<p class="display2">修改计划申请理由：<p id="work"><%=content[i][6]%></p>
	<div class="clear"></div>
	<p class="input"><input type="submit" value="允许修改" class="button1" /></p>
	</form>
	<%} %>
	<p class="wall">------------------------------------------------------------------------------------------------------------------------------------------------------</p>
	<p class="wall">------------------------------------------------------------------------------------------------------------------------------------------------------</p>
	<%} %>
	</div>
  </body>
</html>
