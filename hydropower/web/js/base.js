//构造地图，并添加地图基本要素。
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

//快速通过id获取对象方法。
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
	getId("list").innerHTML = "贵州省，简称“黔”或“贵”，位于中国西南的东南部，省会贵阳市。东毗湖南、南邻广西、西连云南、北接四川和重庆市。辖贵阳市、六盘水市、遵义市、安顺市、铜仁市、黔西南布依族苗族自治州、毕节市、黔东南苗族侗族自治州和黔南布依族苗族自治州。贵州地貌属于中国西南部高原山地，境内地势西高东低，自中部向北、东、南三面倾斜，平均海拔在1100米左右，全省地貌可概括分为：高原、山地、丘陵和盆地四种基本类型，高原山地居多，素有“八山一水一分田”之说，是全国唯一没有平原支撑的省份。贵州省属亚热带湿润季风气候，四季分明、春暖风和、雨量充沛、雨热同季。是世界上岩溶地貌发育最典型的地区之一，有绚丽多彩的喀斯特景观。";
	getId("page").innerHTML = "";
}