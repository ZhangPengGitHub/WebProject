function query() {
	// 获取关键字
	var keyword = $("keyword").value;
	// 获取搜索类型
	var queryType = $("queryType").value;
	// 获取当前底图级别
	var level = map.getZoom();
	// 获取当前底图范围
	var bound = map.getBounds();
	// 将范围转换为字符串形式。
	var bLeft = bound.getSouthWest().getLng();
	var bBottom = bound.getSouthWest().getLat();
	var bRight = bound.getNorthEast().getLng();
	var bTop = bound.getNorthEast().getLat();
	var mapBound = bLeft + "," + bBottom + "," + bRight + "," + bTop;
	// 周边搜索的内容，直接指定半径为1000米，中心点为116.40969,39.89945，实际使用时，可以获取修改。
	var queryRadius, pointLonlat;
	if (queryType == "3") {
		queryRadius = 1000;
		pointLonlat = "116.40969,39.89945";
	}
	// 指定城市搜索,使用北京，如需制定城市，取消注释即可。
	// var geocode = "156110000";
	var geocode;
	// 构造请求的json串。
	var postStr = "{\"keyWord\":\"" + keyword + "\",\"level\":\"" + level
			+ "\",\"mapBound\":\"" + mapBound + "\",\"queryType\":\""
			+ queryType + "\"";
	// alert(postStr);
	if (geocode && geocode != null && geocode != "") {
		postStr += ",\"specifyAdminCode\":\"" + geocode + "\"";
	}
	// alert(postStr);
	if (queryType == "3") {
		postStr += ",\"pointLonlat\":\"" + pointLonlat
				+ "\",\"queryRadius\":\"" + queryRadius + "\"";
	}
	// alert(postStr);
	postStr += ",\"count\":\"10\"";
	postStr += ",\"start\":\"0\"}";
	// 构造完成json串，拼接为请求内容，ajax请求,请求自己服务端servlet(java版本)，依靠后台转发请求，从而解决ajax跨域问题。
	var postString = "jsonStr=" + postStr;
	// url为后台servlet请求地址。自己设定，可以参考web.xml中设定，servlet为com.tianditu.servelt.QueryServlet.java
	var url = "query.do";
	Ajax.request(url, {
		data : postString,
		method : "POST",
		success : function(req) {
			var result = req.responseText;
			if (result == null || result == "" || result == "null") {
				return;
			}
			// 解析结果集
			resolveResult(result);
		},
		failure : function(req) {
			alert("网络问题请重试");
		}
	});
}