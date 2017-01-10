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
    <link rel="stylesheet" type="text/css" href="css/work.css" />
    
    <base target="_blank">
    <title>软件优化组，大连理工大学，工作汇报，工作记录</title>

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
	<p>请选择查看周次：</p>
	
	<form action="Work" target="_self" method="post">
	<%for (int i=0;i<(Integer)(session.getAttribute("weekcount"));i++){ %>
    <input type="radio" checked="checked" name="count" value="<%=i+1 %>"/>第<%=i+1 %>周
    <%if((i+1)%5==0){ %>
    <br>
    <%} %>
    <%} %>
    <input id="button" type="submit" value="确定"/>
    </form>
    <p>第<%=session.getAttribute("whatweek")%>周工作汇报</p>
    <p>第<%=session.getAttribute("whatweek")%>周工作计划</p>
	<p id="plan"><%=session.getAttribute("weekplan")%></p>
	<p>第<%=session.getAttribute("whatweek")%>周工作总结</p>
	<p id="work"><%=session.getAttribute("weekwork")%></p>
	<p>第<%=session.getAttribute("whatweek")%>周导师点评</p>
	<p id="work"><%=session.getAttribute("weekcomment")%></p>
	</div>
  </body>
</html>
