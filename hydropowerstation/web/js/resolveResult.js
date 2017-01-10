function resolveResult(result) {
	// 将字符串转化为json对象。
	var json = eval("(" + result + ")");
	// alert(json);
	var resultType = json.resultType;// 返回结果类型
	// alert(resultType);
	var count = json.count;// 总条数
    //alert(count);
	var pois = json.pois;// 结果集数组
	// alert(pois);
	var resultKeyword = json.keyWord;// 返回关键字，即查询关键字。
	// alert(resultKeyword);
	var landmarkcount = json.landmarkcount;// 地标建筑个数
	// alert(landmarkcount);
	var prompts = json.prompt;// 提示词对象
	// alert(prompts);
	var lines = json.lineData;// 公交线路
	// alert(lines);
	// 解析提示词对象，并显示。
	if (prompts && prompts.length != 0) {
		var promptHtml = "";
		// alert(prompts.length);
		for ( var i = 0; i < prompts.length; i++) {
			var prompt = prompts[i];
			var promptType = prompt.type;
			// alert(promptType);
			var promptAdmins = prompt.admins;
			var meanprompt = prompt.DidYouMean;
			if (promptType == 1) {
				promptHtml += "<p>您是否要在<strong>" + promptAdmins[0].name
						+ "</strong>搜索更多包含<strong>" + resultKeyword
						+ "</strong>的相关内容？<p>";
			} else if (promptType == 2) {
				// 未完成
				promptHtml += "<p>在<strong>" + promptAdmins[0].name
						+ "</strong>没有搜索到与<strong>" + resultKeyword
						+ "</strong>相关的结果。<p>";
				if (meanprompt) {
					promptHtml += "<p>您是否要找：<font weight='bold' color='#035fbe'><strong>"
							+ meanprompt + "</strong></font><p>";
				}
			} else if (promptType == 3) {
				promptHtml += "<p style='margin-bottom:3px;'>有以下相关结果，您是否要找：</p>";
				for (i = 0; i < promptAdmins.length; i++) {
					promptHtml += "<p>" + promptAdmins[i].name + "</p>";
				}
			}
		}
		if (promptHtml != "") {
			$("prompt").style.display = "";
			$("prompt").innerHTML = promptHtml;
		} else {
			$("prompt").style.display = "none";
			$("prompt").innerHTML = "";
		}
	}
	// 解析结果数据，
	if (resultType == "1") {
		// 周边搜索时画一个圆
		if ($("queryType").value == "3") {
			// 画圆
			var centerLnglat = new TLngLat(116.40969, 39.89945);
			var circle = new TCircle(centerLnglat, 1000);
			map.addOverLay(circle);
		}
		// 普通搜索结果响应类型
		var html = "<div>";
		// 用于最后设置合适级别和比例尺的数组。
		var zoomArr = [];
		// 图片显示值
		var k = 1;
		// 循环所有点信息。
		for ( var i = 0; i < 10; i++) {
			var poi = pois[i];
			var name = poi.name;// 名称
			var address = poi.address;// 地址
			var phone = poi.phone;// 电话
			var lonlat = poi.lonlat;// 坐标
			var distance = poi.distance;// 距离，周边搜索时存在
			var link = poi.url;// 点是否有链接
			var poiType = poi.poiType;// 点类型，区分公交站和普通poi
			var stationdata;
			if (poiType) {
				// 公交线信息
				stationdata = poi.stationData;
			}
			// 是否境外点信息
			foreign = poi.foreign;
			// 是否地标性建筑信息。
			if (landmarkcount) {
				levspe = poi.level;
			}
			var lonlats = lonlat.split(" ");
			// 创建地图上的marker
			// 此路径使用的天地图在线的，个人使用时使用自己本地的，防止天地图更新而丢失地址。此处需要使用绝对地址。
			var iconUrl = "http://www.tianditu.com/images/query/noselect/" + k
					+ ".png";
			var iconSize = new TSize(44, 34);
			var iconPixel = new TPixel(16, 34);
			var tIcon = new TIcon(iconUrl, iconSize, {
				anchor : iconPixel
			});
			var markerLngLat = new TLngLat(lonlats[0], lonlats[1]);
			zoomArr.push(markerLngLat);
			var marker = new TMarker(markerLngLat, {
				icon : tIcon
			});
			// 地图上添加标注点。
			map.addOverLay(marker);
			// 组织左侧列表的html
			html += "<div style='width:100%;height:auto;border:1px solid red;'><table><tr><td>"
					+ name
					+ "</td></tr><tr><td>"
					+ address
					+ "</td></tr></table></div>";
			// 采用闭包形式给点注册点击事件，显示名称和地址等内容。
			marker.data = poi;
			(function() {
				var markerNew = marker;
				TEvent.addListener(marker, "click", function(mPixel, bn) {
					var infoWindow = new TInfoWindow(markerNew.getLngLat(), {
						offset : new TPixel(0, -32)
					});
					infoWindow.setLabel(markerNew.data.name);
					infoWindow.setTitle(markerNew.data.address);
					map.addOverLay(infoWindow);
				});
			})();
			k++;
		}
		html += "</div>";
		$("list").innerHTML = html;
		// 选择合适比例尺显示查询的点。
		map.setViewport(zoomArr);
	} else if (resultType == "2") {
		// 统计结果显示
		var statistics = json.statistics;
		var citysCount = statistics.citysCount;// 城市的数量
		var countryCount = statistics.countryCount;// 国家的数量，国家为1时表示只有中国存在。
		var showKeyword = statistics.keyword;
		var priorityCitys = statistics.priorityCitys;// 建议的提示城市。
		var allAdmins = statistics.allAdmins;// 更多国家或城市的结果。
		// 推荐城市显示
		var priorityCityHtml = "<div ><div><ul id='resultList'>";
		if (priorityCitys) {
			var size = priorityCitys.length >= 6 ? 6 : priorityCitys.length;
			for ( var i = 0; i < size; i++) {
				var priorityCity = priorityCitys[i];
				var name = priorityCity.name;
				var adminCode = priorityCity.adminCode;
				var count = priorityCity.count;
				priorityCityHtml += "<li class='route_resultList_li'>" + name
						+ "(" + count + ")</li>";
			}
		}
		priorityCityHtml += "</ul></div><div ></div>";
		$("list").innerHTML = priorityCityHtml;
		// 更多城市的分为三层循环,暂时不做解析,解析内容如下。
		/*
		 * var html = "<div id='provinceDiv' class='search_list_hidden'>"; html += "<div
		 * class='search_list_hidden_tit'><div class='closeProvinces'
		 * onclick='T.Query.closeProvinces()'></div>更多城市</div>"; html += "<div><ul class='allProvinceUl' id='allProvinceUl'>";
		 * 
		 * var size = T.Data.query.statistics.allAdmins.length; var keyword =
		 * T.Data.query.statistics.keyword; for(var i = 0;i < size;i++){ var
		 * province = T.Data.query.statistics.allAdmins[i]; var proName =
		 * province.name; var proCount = province.count; var proAdminCode =
		 * province.adminCode; var citys = province.childAdmins; if(citys &&
		 * citys.length > 0){ html += "<li style='clear:both;'><a
		 * style='float:left;width:6px; height:6px; display:block'
		 * href='javascript:void(0)'
		 * onclick='T.Query.showCitysFromProvince("+i+","+size+")'><img
		 * border='0' id='proImg_"+i+"'
		 * src='../images/query/statistics/plus.png'/></a><a
		 * style='margin-left:10px;' href='javascript:void(0)'
		 * onclick='T.Query.showCitysFromProvince("+i+","+size+")'>"+proName+"("+proCount+")</a>";
		 * html += "<ul id='proUl_"+i+"' style='display:none'>"; for(var j=0;j<citys.length;j++){
		 * var city = citys[j]; var cityName = city.name; var cityAdminCode =
		 * city.adminCode; var cityCount = city.count; var childAdmins =
		 * city.childAdmins; if(childAdmins){ html += "<li style='margin-left:12px;clear:both;'><a
		 * style='float:left;width:6px; height:6px; display:block'
		 * href='javascript:void(0)'
		 * onclick='T.Query.showCitysFromProvince("+j+","+citys.length+",\"child\")'><img
		 * border='0' id='proChildImg_"+j+"'
		 * src='../images/query/statistics/plus.png'/></a><a
		 * style='margin-left:10px;' href='javascript:void(0)'
		 * onclick='T.Query.showCitysFromProvince("+j+","+citys.length+",\"child\")'>"+cityName+"("+cityCount+")</a>";
		 * html += "<ul id='proChildUl_"+j+"' style='display:none'>"; for(var
		 * m = 0;m < childAdmins.length;m++){ var child = childAdmins[m]; var
		 * childName = child.name; var childAdminCode = child.adminCode; var
		 * childCount = child.count; html += "<li style='margin-left:28px;'><a
		 * href='javascript:void(0)' onclick='T.Query.setOptionsString(";
		 * if(keyword){ html +=
		 * "\""+keyword+"\","+null+","+null+","+null+",\""+childAdminCode+"\")' >" +
		 * childName + "("+childCount+")</a></li>"; }else{ html +=
		 * "\""+null+"\","+null+","+null+","+null+",\""+childAdminCode+"\")' >" +
		 * childName + "("+childCount+")</a></li>"; } } html += "</ul></li>";
		 * }else{ html += "<li style='margin-left:28px;'><a
		 * href='javascript:void(0)' onclick='T.Query.setOptionsString(";
		 * if(keyword){ html +=
		 * "\""+keyword+"\","+null+","+null+","+null+",\""+cityAdminCode+"\")' >" +
		 * cityName + "("+cityCount+")</a></li>"; }else{ html +=
		 * "\""+null+"\","+null+","+null+","+null+",\""+cityAdminCode+"\")' >" +
		 * cityName + "("+cityCount+")</a></li>"; } } } html += "</ul></li>";
		 * }else{ html += "<li style='clear:both;margin-left:17px;'><a
		 * href='javascript:void(0)' onclick='T.Query.setOptionsString(";
		 * if(keyword){ html +=
		 * "\""+keyword+"\","+null+","+null+","+null+",\""+proAdminCode+"\")' >" +
		 * proName + "("+proCount+")</a></li>"; }else{ html +=
		 * "\""+null+"\","+null+","+null+","+null+",\""+proAdminCode+"\")' >" +
		 * proName + "("+proCount+")</a></li>"; } } } html += "</ul></div></div>";
		 * $("allProvinceHtmlDiv").innerHTML = html;
		 */

	} else if (resultType == "3") {
		// 行政区搜索定位
		var area = json.area;
		var name = area.name;
		var bound = area.bound;
		var lonlat = area.lonlat;
		var level = area.level;
		var info = area.info;
		var areaType = area.type;
		var areaAddress = area.address;
		var points = area.points;
		// 如果有区域坐标信息，画出此行政区的多边形。
		if (points && points.length != 0) {
			var regionArr = [];
			// 面的线的样式
			var style = {
				strokeColor : "#0027eb",
				fillColor : "white",
				strokeWeight : 2,
				strokeOpacity : 1,
				fillOpacity : 0.000001, // 透明的。
				strokeStyle : "dashed" // 虚线
			};
			for ( var i = 0; i < points.length; i++) {
				var region = points[i].region;// 单个面
				var pointArr = region.split(",");
				var pointsz = [];
				for ( var j = 0; j < pointArr.length - 1; j++) {
					var p = pointArr[j];
					var pArr = p.split(" ");
					var point = new TLngLat(pArr[0], pArr[1]);
					pointsz.push(point);
				}
				var poly = new TPolygon(pointsz, style);
				map.addOverLay(poly);
				regionArr.push(poly);
			}
		}
		var lonlats2 = lonlat.split(",");
		var lnglatC = new TLngLat(lonlats2[0], lonlats2[1]);
		if (level) {
			// 国、省、市
			map.setCenterAtLngLat(lnglatC);
			map.setZoom(level);
		} else {
			// 区、县
			var boundArr = bound.split(",");
			var leftbottom = new TLngLat(boundArr[0], boundArr[1]);
			var righttop = new TLngLat(boundArr[2], boundArr[3]);
			map.setViewport([ leftbottom, righttop ]);
		}
	} else if (resultType == "4") {
		// 建议词搜索
		var suggestsKey = json.suggestsKey;
		var suggests = json.suggests;
		var size = suggests.length;
		var suggestHtml = "<div><ul>";
		for ( var i = 0; i < size; i++) {
			var suggest = suggests[i];
			var name = suggest.name;
			var address = suggest.address;
			var gbCode = suggest.gbCode;
			// 加粗显示关键字
			suggestsKey = suggestsKey.replace(/\s+/g, "");
			var nameHtml = "";
			var replaceKeyword = "<strong>" + suggestsKey + "</strong>";
			if (suggestsKey == "") {
				break;
			} else {
				nameHtml = name.replace(suggestsKey, replaceKeyword);
			}
			suggestHtml += "<li id='" + name + "' >";
			suggestHtml += nameHtml;
			suggestHtml += "&nbsp;&nbsp;&nbsp;";
			if (address) {
				suggestHtml += address;
			}
			suggestHtml += "</li>";
		}
		suggestHtml += "</ul></div>";
		$("list").innerHTML = suggestHtml;

	} else if (resultType == "5") {
		var k = 1;
		var html = "<div>";
		// 公交路线查询
		for ( var i = 0; i < 10; i++) {
			var lineData = lines[i];
			if (!lineData) {
				break;
			}
			var lineName = lineData.name;// 线路名称
			var lineNames = lineName.split("(");
			// 以括号来分割名称和起终点
			var lineNameHead = lineNames[0];
			var lineNameLast = lineNames[1].replace(")", "");
			if (lineNameLast && lineNameLast.length > 15) {
				lineNameLast = lineNameLast.substring(0, 13) + "...";
			}
			// uuid为此线的唯一id，可以根据此id去公交服务查询详细的线路信息。
			var uuid = lineData.uuid;
			var stationNum = lineData.stationNum;
			// 组织显示
			html += "<div id='busLine_list_" + k + "'>";
			html += "<div >";
			html += "<div>" + k + "</div>";
			html += "<div>" + "<strong>" + lineNameHead + "</strong>（"
					+ lineNameLast + "）<span >" + "<span></span>共<span>"
					+ stationNum + "</span>站</span></div>";
			html += "<div></div>";
			html += "</div>";
			html += "<div id='busLine_" + k + "'>";
			html += "</div>";
			html += "</div>";
			k++;
		}
		html += "<div>";
		$("list").innerHTML = html;
	}
}
// 拉框搜索和视野内搜索一样，是指制定的范围不同。
