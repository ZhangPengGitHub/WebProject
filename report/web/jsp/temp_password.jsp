<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>软件优化组，大连理工大学，工作汇报，提示信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%if((Integer)(session.getAttribute("temp"))==1){ %>
    <Script Language="JavaScript"> alert("旧密码输入不正确");</Script>
    <Script Language="JavaScript"> window.location.href="<%=request.getContextPath()%>/jsp/password.jsp";</Script>
    <%}else if((Integer)(session.getAttribute("temp"))==2){%>
    <Script Language="JavaScript"> alert("密码修改成功！");</Script>
    <Script Language="JavaScript"> window.location.href="<%=request.getContextPath()%>/jsp/student.jsp";</Script>
    <%}else if((Integer)(session.getAttribute("temp"))==3){%>
    <Script Language="JavaScript"> alert("密码修改成功！");</Script>
    <Script Language="JavaScript"> window.location.href="<%=request.getContextPath()%>/jsp/teacher.jsp";</Script>
    <%}else if((Integer)(session.getAttribute("temp"))==4){%>
    <Script Language="JavaScript"> alert("新密码输入不一致！");</Script>
    <Script Language="JavaScript"> window.location.href="<%=request.getContextPath()%>/jsp/password.jsp";</Script>
    <%}else{ %>
    <Script Language="JavaScript"> alert("新密码为空！");</Script>
    <Script Language="JavaScript"> window.location.href="<%=request.getContextPath()%>/jsp/password.jsp";</Script>
    <%} %>
  </body>
</html>
