function query() {
	// ��ȡ�ؼ���
	var keyword = getId("keyword").value;
	if(keyword==""){
		alert("�������ѯ����");
		return;
	}
	keyword = keyword + "," + flag;
	//��ȡ��������
	queryType = 1;
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

	// ���������json����
	var postStr = "{\"keyWord\":\"" + keyword + "\",\"level\":\"" + level
			+ "\",\"mapBound\":\"" + mapBound + "\",\"queryType\":\""
			+ queryType + "\"";
	postStr += ",\"count\":\"-1\"";
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
				alert("δ���ַ��ϲ�ѯ������ˮ��վ");
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