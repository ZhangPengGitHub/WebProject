<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Admin Tool</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/index.css" />
  </head>
  
  <body>
    <h1>Admin Tool</h1>
    <p id="herfInfo"><a href="jsp/info.jsp" target="_self">Info Handler</a>&nbsp&nbsp&nbsp
                     <a href="jsp/news.jsp" target="_self">News Handler</a>&nbsp&nbsp&nbsp
                     <a href="jsp/notice.jsp" target="_self">Notice Handler</a>
    <p id="herfPaper"><a href="jsp/paper.jsp" target="_self">Paper Inserter</a>&nbsp&nbsp&nbsp
                      <a href="jsp/import.jsp" target="_self">Paper Importerer</a></p>
    <p id="herfJournal"><a href="jsp/journalInsert.jsp" target="_self">Journal Inserter</a>&nbsp&nbsp&nbsp
                      <a href="jsp/journalDelete.jsp" target="_self">Journal Deleter</a></p>
    <p id="herfSAdd"><a href="jsp/sadd.jsp" target="_self">SAdd Handler</a>&nbsp&nbsp&nbsp
                     <a href="jsp/help.jsp" target="_self">Help Handler</a></p>
  </body>
</html>
