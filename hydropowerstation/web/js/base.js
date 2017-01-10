//构造地图，并添加地图基本要素。
function create(){
	map.centerAndZoom(new TLngLat(116.40969,39.89945),11);
	map.enableHandleMouseScroll();
	map.enableInertia();
	map.enableHandleKeyboard();
	map.enableDoubleClickZoom();
	var config = {
			type : "TMAP_NAVIGATION_CONTROL_LARGE",
			anchor : "TMAP_ANCHOR_TOP_RIGHT",
			offset : [0,0],
			showZoomInfo : true
	};
	control = new TNavigationControl(config);
	map.addControl(control);
}

//快速通过id获取对象方法。
function $(id) {
	return document.getElementById(id);
}

function clearAll() {
	map.clearOverLays();
	$("prompt").innerHTML = "";
	$("list").innerHTML = "";
}