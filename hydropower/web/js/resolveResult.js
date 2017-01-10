function show(markerNew,sign){
	alert(sign);
	if(sign == 1){
		return;
	}
	sign = 1;
	var myMarker = markerNew;
	var infoWindow = new TInfoWindow(myMarker.getLngLat(), {
		offset : new TPixel(0, -32)
	});
	infoWindow.setTitle(myMarker.data.name);
	infoWindow.setLabel(myMarker.data.address);
	map.addOverLay(infoWindow);
};

function resolveResult(result) {
	clearAll();
	// 将字符串转化为json对象。
	var json = eval("(" + result + ")");
	var resultType = json.resultType;// 返回结果类型
	var count = json.count;// 总条数
	var pois = json.pois;// 结果集数组
	var lines = json.lineData;// 公交线路

	// 解析结果数据，
	if (resultType == "1") {
		// 普通搜索结果响应类型
		var html = "";
		var divList = document.createElement("div");
		// 用于最后设置合适级别和比例尺的数组。
		var zoomArr = [];
        var sign = 0;
		// 循环所有点信息。
		for ( var i = 0; i < count; i++) {

			var poi = pois[i];
			var name = poi.name;// 名称
			var address = poi.address;// 地址
			var phone = poi.phone;// 电话
			var lonlat = poi.lonlat;// 坐标
			var link = poi.url;// 点是否有链接
			var lonlats = lonlat.split(" ");
			
			// 创建地图上的marker
			var iconUrl = "png/arrow_down_alt.png";
			var iconSize = new TSize(44, 34);
			var iconPixel = new TPixel(16, 34);
			var tIcon = new TIcon(iconUrl, iconSize, {
				anchor : iconPixel
			});
			var markerLngLat = new TLngLat(lonlats[0], lonlats[1])

			var marker = new TMarker(markerLngLat, {
				icon : tIcon
			});
			
			// 地图上添加标注点。
			marker.data = poi;
	
            var pList = document.createElement("p");
            pList.style.width = "100%";
            pList.style.height = "auto";
            pList.style.border = "1px solid red";
            var aList = document.createElement("a"); 
            aList.href = "javascript://"; 
            aList.innerHTML = name; 
            aList.onclick =  (function(myMarker,mysign){return function(){show(myMarker,mysign);};})(marker,sign);
            var addressList = document.createTextNode(address);
            var tableList = document.createElement("table");
            var tbodyList = document.createElement('tbody');
            var tr1List = document.createElement("tr");
            var td1List = document.createElement("td"); 
            var tr2List = document.createElement("tr");
            var td2List = document.createElement("td");
            td1List.appendChild(aList);
            td2List.appendChild(addressList);
            tr1List.appendChild(td1List);
            tr2List.appendChild(td2List);
            tbodyList.appendChild(tr1List);
            tbodyList.appendChild(tr2List);
            tableList.appendChild(tbodyList);
            pList.appendChild(tableList);
            divList.appendChild(pList);
		}

		html += "<div class=\"pagess\""
			 + "style=\"margin-top: 15px; text-align: center; *margin-top: 15px;_margin-top: 15px\">"
			 + "<input type=\"button\" id=\"spanFirst\" value=\"首页\"></input> <input type=\"button\" id=\"spanPre\" value=\"上页\"></input> "
			 + "<input type=\"button\" id=\"spanNext\" value=\"下页\"></input> <input type=\"button\" id=\"spanLast\" value=\"尾页\"></input> "
			 + "第<a id=\"spanPageNum\"></a>页/共<a id=\"spanTotalPage\"></a>页"
			 + "</div>";
		
		getId("list").appendChild(divList);
		getId("page").innerHTML = html;
		
		var $p, count, step, // 每页条数
		pageSize, // 页数
		curIndex;
		var updatePageInfo = function() {
			$p = $('p');
			count = $p.length;
			step = 4;
			pageSize = Math.ceil(count / step) - 1;
			curIndex = 0;
			$('#spanTotalPage').html(pageSize + 1);
		};

		var pageTo = function(index) {
			map.clearOverLays();
			if (index < 0 || index > pageSize) {
				return;
			}
			$p.hide();
			for ( var i = index * step, mLen = i + step; i < mLen; i++) {
				if (i > count)
					break;
				$p.eq(i).show();
			}
			curIndex = index;
			// 更新分页组件
			$('#spanPageNum').html(index + 1);
			zoomArr = [];
			var max = (index+1)*step>count?count:(index+1)*step;
			for(var i=index*step;i<max;i++){
				
				var poi = pois[i];
				var lonlat = poi.lonlat;// 坐标
				var lonlats = lonlat.split(" ");
				// 创建地图上的marker
				var iconUrl = "png/arrow_down_alt.png";
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
				
				marker.data = poi;
				// 采用闭包形式给点注册点击事件，显示名称和地址等内容。

				(function() {
					var markerNew = marker;
					TEvent.addListener(marker, "click", function(mPixel, bn) {
						alert(sign);
						if(sign == 1){
							return;
						}
						sign = 1;
						var infoWindow = new TInfoWindow(markerNew.getLngLat(), {
							offset : new TPixel(0, -32)
						});
						infoWindow.setTitle(markerNew.data.name);
						infoWindow.setLabel(markerNew.data.address);
						map.addOverLay(infoWindow);
					});
				})();
			}
			map.setViewport(zoomArr);			
		};
		var nextPage = function() {
			if(curIndex == pageSize){
				alert("已经是最后一页");
			}
			else{
				pageTo(curIndex + 1);
			}
		};
		var prePage = function() {
			if(curIndex == 0){
				alert("已经是第一页");
			}
			else{
				pageTo(curIndex - 1);
			}	
		};

		// 事件监听
		$('#spanFirst').click(function() {
			pageTo(0);
		});
		$('#spanLast').click(function() {
			pageTo(pageSize);
		});
		$('#spanPre').click(function() {
			prePage();
		});
		$('#spanNext').click(function() {
			nextPage();
		});
		updatePageInfo();
		pageTo(0);
		
		// 选择合适比例尺显示查询的点。
		map.setViewport(zoomArr);
	} 
}