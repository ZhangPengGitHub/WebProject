function add() {
	var stationId = getId("stationId").value;
	var longitude = getId("longitude").value;
	var latitude = getId("latitude").value;
	var info = "information=" + stationId + "," + longitude + "," + latitude;
	var url = "add.do";
	Ajax.request(url, {
		data : info,
		method : "POST",
		success : function(req) {
			var result = req.responseText;
			if (result == null || result == "" || result == "null") {
				return;
			}
			// ���������
			alert(result);
			if(result == "��ӳɹ�"){
				reset();
			}		
		},
		failure : function(req) {
			alert("��������������");
		}
	});
}