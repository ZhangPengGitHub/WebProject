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
    <link rel="stylesheet" type="text/css" href="css/student.css" />
    
    <base target="_blank">
    <title>软件优化组，大连理工大学，工作汇报，学生首页</title>
  </head>
  
  <body>
    <div id="information">
	    <p id="p1"><%=session.getAttribute("username")%>已登录</p>
	    <form action="Work" method="post">
		<p id="p2"><a href="/report/WorkStudent" target="_self">查看工作记录</a></p>
		</form>
		<p id="p3"><a href="jsp/password.jsp" target="_self">修改密码</a></p>
		<p><a href="jsp/index.jsp" target="_self">注销登录</a></p>
	</div>
	<div class="clear"></div>
    <div id="title">
	    <h1>大连理工大学软件优化组工作汇报</h1>
	</div>
	<div id="content">
	<p class="head">本周计划：</p>
	<div class="week"><%=session.getAttribute("plan")%></div>
	<p class="head">本周导师点评：</p>
	<div class="week"><%=session.getAttribute("thisweekcomment")%></div>
	<form action="Whatdaywork" target="_self" method="post">
	<%for (int i=0;i<(Integer)(session.getAttribute("whatday"));i++){ %>
    <input type="radio" checked="checked"  class="radio"  name="count" value="<%=i+1 %>"/>本周第<%=i+1 %>天
    <%if((i+1)%4==0){ %>
    <br>
    <%} %>
    <%} %>
    <input class="button" type="submit" value="确定"/>
    </form>
	<form action="StudentWork" target="_self" method="post">
	<p class="input">本周第<%=session.getAttribute("today")%>天工作总结:<input type="submit" value="保存" class="button1" /><input type="reset" value="重置" class="button2" /><br/><br/><textarea rows="5" cols="68" name="work"><%=session.getAttribute("todaywork")%></textarea></p>
	<p class="input"><input type="submit" value="保存" class="button1" /><input type="reset" value="重置" class="button2" /></p>
	</form>
	<%if((Integer)(session.getAttribute("ifplan"))==1){ %>
	<form action="StudentPlan" target="_self" method="post">
	<p class="input">请填写或修改本周计划:<input type="submit" value="保存" class="button1" /><input type="reset" value="重置" class="button2" /><br/><br/><textarea rows="5" cols="68" name="plan"><%=session.getAttribute("plan")%></textarea></p>
	<p class="input"><input type="submit" value="保存" class="button1" /><input type="reset" value="重置" class="button2" /></p>
	</form>
	<%}else if((Integer)(session.getAttribute("ifplan"))==2){ %>
	<form action="StudentReason" target="_self" method="post">
	<p class="input">请填写申请修改计划理由:<input type="submit" value="申请" class="button1" /><input type="reset" value="重置" class="button2" /><br/><br/><textarea rows="5" cols="68" name="reason"></textarea></p>
	<p class="input"><input type="submit" value="申请" class="button1" /><input type="reset" value="重置" class="button2" /></p>
	</form>
	<%}else {%>
	<p class="input">修改计划申请已经发出，正在等待导师批准。</p>
	<%} %>
	</div>
  </body>
</html>
