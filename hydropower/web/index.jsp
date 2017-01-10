<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%
	request.setCharacterEncoding("GB2312");
%>
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

<title>天地图之贵州省水电站</title>
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
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="js/add.js"></script>
<script type="text/javascript" src="js/area.js"></script>
</head>

<body>
	<div class="title">
		<h1>天地图之贵州省水电站</h1>
	</div>
	<div class="left">
		<div id="show"></div>
		<div id="link"></div>
		<script>
			init_area();
		</script>
		<div class="querytable">
			<table>
				<tr>
					<td>查询内容：</td>
					<td><input id="keyword" /></td>
					<td><input type="button" id="query" value="搜索"
						onclick="query()" /></td>
					<td><input type="button" id="clearAll" value="清除"
						onclick="reClear()" /></td>
				</tr>
			</table>
		</div>
		<div class="showlist">
			<div id="prompt" class="prompt"></div>
			<div id="list" class="list">贵州省，简称“黔”或“贵”，位于中国西南的东南部，省会贵阳市。东毗湖南、南邻广西、西连云南、北接四川和重庆市。辖贵阳市、六盘水市、遵义市、安顺市、铜仁市、黔西南布依族苗族自治州、毕节市、黔东南苗族侗族自治州和黔南布依族苗族自治州。
				贵州地貌属于中国西南部高原山地，境内地势西高东低，自中部向北、东、南三面倾斜，平均海拔在1100米左右，全省地貌可概括分为：高原、山地、丘陵和盆地四种基本类型，高原山地居多，素有“八山一水一分田”之说，是全国唯一没有平原支撑的省份。
				贵州省属亚热带湿润季风气候，四季分明、春暖风和、雨量充沛、雨热同季。是世界上岩溶地貌发育最典型的地区之一，有绚丽多彩的喀斯特景观。</div>
			<div id="page" class="page"></div>
		</div>
		<div class="addtable">
			<table>
				<tr>
					<td>电站代码：</td>
					<td><input id="stationId" /></td>
				</tr>
				<tr>
					<td>经度：</td>
					<td><input id="longitude" /></td>
				</tr>
				<tr>
					<td>纬度：</td>
					<td><input id="latitude" /></td>
					<td><input type="button" id="add" value="添加" onclick="add()" /></td>
					<td><input type="button" id="reset" value="重置"
						onclick="reset()" /></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="right" id="map"></div>
	<script>
		var map = new TMap("map");
		create();
	</script>
</body>
</html>
