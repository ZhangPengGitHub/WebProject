function query() {
	// ��ȡ�ؼ���
	var keyword = $("keyword").value;
	// ��ȡ��������
	var queryType = $("queryType").value;
	// ��ȡ��ǰ��ͼ����
	var level = map.getZoom();
	// ��ȡ��ǰ��ͼ��Χ
	var bound = map.getBounds();
	// ����Χת��Ϊ�ַ�����ʽ��
	var bLeft = bound.getSouthWest().getLng();
	var bBottom = bound.getSouthWest().getLat();
	var bRight = bound.getNorthEast().getLng();
	var bTop = bound.getNorthEast().getLat();
	var mapBound = bLeft + "," + bBottom + "," + bRight + "," + bTop;
	// �ܱ����������ݣ�ֱ��ָ���뾶Ϊ1000�ף����ĵ�Ϊ116.40969,39.89945��ʵ��ʹ��ʱ�����Ի�ȡ�޸ġ�
	var queryRadius, pointLonlat;
	if (queryType == "3") {
		queryRadius = 1000;
		pointLonlat = "116.40969,39.89945";
	}
	// ָ����������,ʹ�ñ����������ƶ����У�ȡ��ע�ͼ��ɡ�
	// var geocode = "156110000";
	var geocode;
	// ���������json����
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
	// �������json����ƴ��Ϊ�������ݣ�ajax����,�����Լ������servlet(java�汾)��������̨ת�����󣬴Ӷ����ajax�������⡣
	var postString = "jsonStr=" + postStr;
	// urlΪ��̨servlet�����ַ���Լ��趨�����Բο�web.xml���趨��servletΪcom.tianditu.servelt.QueryServlet.java
	var url = "query.do";
	Ajax.request(url, {
		data : postString,
		method : "POST",
		success : function(req) {
			var result = req.responseText;
			if (result == null || result == "" || result == "null") {
				return;
			}
			// ���������
			resolveResult(result);
		},
		failure : function(req) {
			alert("��������������");
		}
	});
}