function query() {
	// 获取关键字
	var keyword = getId("keyword").value;
	if(keyword==""){
		alert("请输入查询内容");
		return;
	}
	keyword = keyword + "," + flag;
	//获取搜索类型
	queryType = 1;
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

	// 构造请求的json串。
	var postStr = "{\"keyWord\":\"" + keyword + "\",\"level\":\"" + level
			+ "\",\"mapBound\":\"" + mapBound + "\",\"queryType\":\""
			+ queryType + "\"";
	postStr += ",\"count\":\"-1\"";
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
				alert("未发现符合查询条件的水电站");
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