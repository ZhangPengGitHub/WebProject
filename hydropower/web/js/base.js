//�����ͼ������ӵ�ͼ����Ҫ�ء�
function create(){
	map.centerAndZoom(new TLngLat(116.40969,39.89945),11);
	map.enableHandleMouseScroll();
	map.enableInertia();
	map.enableHandleKeyboard();
	map.enableDoubleClickZoom();
	map.setMapType(TMAP_HYBRID_MAP);
	var coorArr = new Array(new TLngLat(coorpro[0], coorpro[2]),new TLngLat(coorpro[0], coorpro[3]),new TLngLat(coorpro[1], coorpro[2]),new TLngLat(coorpro[1], coorpro[3]));
	map.setViewport(coorArr);
	var config = {
			type : "TMAP_NAVIGATION_CONTROL_LARGE",
			anchor : "TMAP_ANCHOR_TOP_RIGHT",
			offset : [0,0],
			showZoomInfo : true
	};
	var control1 = new TNavigationControl(config);
	map.addControl(control1);
	var control2 = new TScaleControl();
	map.addControl(control2);
}

//����ͨ��id��ȡ���󷽷���
function getId(id) {
	return document.getElementById(id);
}

function reset() {
	getId("stationId").value = "";
	getId("longitude").value = "";
	getId("latitude").value = "";
}

function clearAll() {
	map.clearOverLays();
	getId("prompt").innerHTML = "";
	getId("list").innerHTML = "";
	getId("page").innerHTML = "";
}

function reClear() {
	map.clearOverLays();
	getId("prompt").innerHTML = "";
	getId("list").innerHTML = "����ʡ����ơ�ǭ���򡰹󡱣�λ���й����ϵĶ��ϲ���ʡ������С��������ϡ����ڹ������������ϡ������Ĵ��������С�Ͻ�����С�����ˮ�С������С���˳�С�ͭ���С�ǭ���ϲ��������������ݡ��Ͻ��С�ǭ�������嶱�������ݺ�ǭ�ϲ��������������ݡ����ݵ�ò�����й����ϲ���ԭɽ�أ����ڵ������߶��ͣ����в��򱱡�������������б��ƽ��������1100�����ң�ȫʡ��ò�ɸ�����Ϊ����ԭ��ɽ�ء������������ֻ������ͣ���ԭɽ�ؾӶ࣬���С���ɽһˮһ���֮˵����ȫ��Ψһû��ƽԭ֧�ŵ�ʡ�ݡ�����ʡ�����ȴ�ʪ�󼾷������ļ���������ů��͡��������桢����ͬ���������������ܵ�ò��������͵ĵ���֮һ����Ѥ����ʵĿ�˹�ؾ��ۡ�";
	getId("page").innerHTML = "";
}