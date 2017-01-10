<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Journal Table</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/journalDelete.css" />

    <script src="https://cn.avoscloud.com/scripts/lib/av-0.3.3.min.js"></script>
	<script type="text/javascript" src="js/journalDelete.js"></script>
  </head>
  
  <body>
    <h1>Journal Table</h1>
    <p id="return"><a href="jsp/index.jsp" target="_self">Return</a></p>
    <div id = "tableJournal"><script>handleJournalDelete();</script></div>
  </body>
</html>
