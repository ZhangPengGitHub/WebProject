<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%request.setCharacterEncoding("GB2312"); %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>天地图搜索调用示例</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
-->
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="http://api.tianditu.com/js/maps.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/query.js"></script>
<script type="text/javascript" src="js/resolveResult.js"></script>
</head>

<body>
	<div class="left">
		<div>
			<h2>天地图搜索服务调用示例</h2>
			<table>
				<tr>
					<td>查询内容：</td>
					<td><input id="keyword" /></td>
				</tr>
				<tr>
					<td>查询类型：</td>
					<td><select id="queryType">
							<option selected="selected" value="1">普通搜索</option>
							<option value="2">视野内搜索</option>
							<option value="3">周边搜索</option>
							<option value="4">建议词搜索</option>
							<option value="5">公交规划建议词搜索</option>
							<option value="6">公交站搜索</option>
							<option value="7">只搜poi，不搜公交信息</option>
							<option value="10">拉框搜索</option>
					</select></td>
				</tr>
				<tr>
					<td><input type="button" id="query" value="搜索"
						onclick="query()" /></td>
					<td><input type="button" id="clearAll" value="清除"
						onclick="clearAll()" /></td>
				</tr>
			</table>
		</div>
		<div class="showlist">
			<div id="prompt" class="prompt"></div>
			<div id="list" class="list"></div>
		</div>
	</div>
	<div class="right" id="map"></div>
	<script>
		var map = new TMap("map");
		create();
	</script>
</body>
</html>
