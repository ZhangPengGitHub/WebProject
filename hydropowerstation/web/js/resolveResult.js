function resolveResult(result) {
	// ���ַ���ת��Ϊjson����
	var json = eval("(" + result + ")");
	// alert(json);
	var resultType = json.resultType;// ���ؽ������
	// alert(resultType);
	var count = json.count;// ������
    //alert(count);
	var pois = json.pois;// ���������
	// alert(pois);
	var resultKeyword = json.keyWord;// ���عؼ��֣�����ѯ�ؼ��֡�
	// alert(resultKeyword);
	var landmarkcount = json.landmarkcount;// �ر꽨������
	// alert(landmarkcount);
	var prompts = json.prompt;// ��ʾ�ʶ���
	// alert(prompts);
	var lines = json.lineData;// ������·
	// alert(lines);
	// ������ʾ�ʶ��󣬲���ʾ��
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
				promptHtml += "<p>���Ƿ�Ҫ��<strong>" + promptAdmins[0].name
						+ "</strong>�����������<strong>" + resultKeyword
						+ "</strong>��������ݣ�<p>";
			} else if (promptType == 2) {
				// δ���
				promptHtml += "<p>��<strong>" + promptAdmins[0].name
						+ "</strong>û����������<strong>" + resultKeyword
						+ "</strong>��صĽ����<p>";
				if (meanprompt) {
					promptHtml += "<p>���Ƿ�Ҫ�ң�<font weight='bold' color='#035fbe'><strong>"
							+ meanprompt + "</strong></font><p>";
				}
			} else if (promptType == 3) {
				promptHtml += "<p style='margin-bottom:3px;'>��������ؽ�������Ƿ�Ҫ�ң�</p>";
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
	// ����������ݣ�
	if (resultType == "1") {
		// �ܱ�����ʱ��һ��Բ
		if ($("queryType").value == "3") {
			// ��Բ
			var centerLnglat = new TLngLat(116.40969, 39.89945);
			var circle = new TCircle(centerLnglat, 1000);
			map.addOverLay(circle);
		}
		// ��ͨ���������Ӧ����
		var html = "<div>";
		// ����������ú��ʼ���ͱ����ߵ����顣
		var zoomArr = [];
		// ͼƬ��ʾֵ
		var k = 1;
		// ѭ�����е���Ϣ��
		for ( var i = 0; i < 10; i++) {
			var poi = pois[i];
			var name = poi.name;// ����
			var address = poi.address;// ��ַ
			var phone = poi.phone;// �绰
			var lonlat = poi.lonlat;// ����
			var distance = poi.distance;// ���룬�ܱ�����ʱ����
			var link = poi.url;// ���Ƿ�������
			var poiType = poi.poiType;// �����ͣ����ֹ���վ����ͨpoi
			var stationdata;
			if (poiType) {
				// ��������Ϣ
				stationdata = poi.stationData;
			}
			// �Ƿ������Ϣ
			foreign = poi.foreign;
			// �Ƿ�ر��Խ�����Ϣ��
			if (landmarkcount) {
				levspe = poi.level;
			}
			var lonlats = lonlat.split(" ");
			// ������ͼ�ϵ�marker
			// ��·��ʹ�õ����ͼ���ߵģ�����ʹ��ʱʹ���Լ����صģ���ֹ���ͼ���¶���ʧ��ַ���˴���Ҫʹ�þ��Ե�ַ��
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
			// ��ͼ����ӱ�ע�㡣
			map.addOverLay(marker);
			// ��֯����б��html
			html += "<div style='width:100%;height:auto;border:1px solid red;'><table><tr><td>"
					+ name
					+ "</td></tr><tr><td>"
					+ address
					+ "</td></tr></table></div>";
			// ���ñհ���ʽ����ע�����¼�����ʾ���ƺ͵�ַ�����ݡ�
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
		// ѡ����ʱ�������ʾ��ѯ�ĵ㡣
		map.setViewport(zoomArr);
	} else if (resultType == "2") {
		// ͳ�ƽ����ʾ
		var statistics = json.statistics;
		var citysCount = statistics.citysCount;// ���е�����
		var countryCount = statistics.countryCount;// ���ҵ�����������Ϊ1ʱ��ʾֻ���й����ڡ�
		var showKeyword = statistics.keyword;
		var priorityCitys = statistics.priorityCitys;// �������ʾ���С�
		var allAdmins = statistics.allAdmins;// ������һ���еĽ����
		// �Ƽ�������ʾ
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
		// ������еķ�Ϊ����ѭ��,��ʱ��������,�����������¡�
		/*
		 * var html = "<div id='provinceDiv' class='search_list_hidden'>"; html += "<div
		 * class='search_list_hidden_tit'><div class='closeProvinces'
		 * onclick='T.Query.closeProvinces()'></div>�������</div>"; html += "<div><ul class='allProvinceUl' id='allProvinceUl'>";
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
		// ������������λ
		var area = json.area;
		var name = area.name;
		var bound = area.bound;
		var lonlat = area.lonlat;
		var level = area.level;
		var info = area.info;
		var areaType = area.type;
		var areaAddress = area.address;
		var points = area.points;
		// ���������������Ϣ���������������Ķ���Ρ�
		if (points && points.length != 0) {
			var regionArr = [];
			// ����ߵ���ʽ
			var style = {
				strokeColor : "#0027eb",
				fillColor : "white",
				strokeWeight : 2,
				strokeOpacity : 1,
				fillOpacity : 0.000001, // ͸���ġ�
				strokeStyle : "dashed" // ����
			};
			for ( var i = 0; i < points.length; i++) {
				var region = points[i].region;// ������
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
			// ����ʡ����
			map.setCenterAtLngLat(lnglatC);
			map.setZoom(level);
		} else {
			// ������
			var boundArr = bound.split(",");
			var leftbottom = new TLngLat(boundArr[0], boundArr[1]);
			var righttop = new TLngLat(boundArr[2], boundArr[3]);
			map.setViewport([ leftbottom, righttop ]);
		}
	} else if (resultType == "4") {
		// ���������
		var suggestsKey = json.suggestsKey;
		var suggests = json.suggests;
		var size = suggests.length;
		var suggestHtml = "<div><ul>";
		for ( var i = 0; i < size; i++) {
			var suggest = suggests[i];
			var name = suggest.name;
			var address = suggest.address;
			var gbCode = suggest.gbCode;
			// �Ӵ���ʾ�ؼ���
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
		// ����·�߲�ѯ
		for ( var i = 0; i < 10; i++) {
			var lineData = lines[i];
			if (!lineData) {
				break;
			}
			var lineName = lineData.name;// ��·����
			var lineNames = lineName.split("(");
			// ���������ָ����ƺ����յ�
			var lineNameHead = lineNames[0];
			var lineNameLast = lineNames[1].replace(")", "");
			if (lineNameLast && lineNameLast.length > 15) {
				lineNameLast = lineNameLast.substring(0, 13) + "...";
			}
			// uuidΪ���ߵ�Ψһid�����Ը��ݴ�idȥ���������ѯ��ϸ����·��Ϣ��
			var uuid = lineData.uuid;
			var stationNum = lineData.stationNum;
			// ��֯��ʾ
			html += "<div id='busLine_list_" + k + "'>";
			html += "<div >";
			html += "<div>" + k + "</div>";
			html += "<div>" + "<strong>" + lineNameHead + "</strong>��"
					+ lineNameLast + "��<span >" + "<span></span>��<span>"
					+ stationNum + "</span>վ</span></div>";
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
// ������������Ұ������һ������ָ�ƶ��ķ�Χ��ͬ��
