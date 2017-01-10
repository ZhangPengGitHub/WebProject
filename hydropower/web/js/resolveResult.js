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
	// ���ַ���ת��Ϊjson����
	var json = eval("(" + result + ")");
	var resultType = json.resultType;// ���ؽ������
	var count = json.count;// ������
	var pois = json.pois;// ���������
	var lines = json.lineData;// ������·

	// ����������ݣ�
	if (resultType == "1") {
		// ��ͨ���������Ӧ����
		var html = "";
		var divList = document.createElement("div");
		// ����������ú��ʼ���ͱ����ߵ����顣
		var zoomArr = [];
        var sign = 0;
		// ѭ�����е���Ϣ��
		for ( var i = 0; i < count; i++) {

			var poi = pois[i];
			var name = poi.name;// ����
			var address = poi.address;// ��ַ
			var phone = poi.phone;// �绰
			var lonlat = poi.lonlat;// ����
			var link = poi.url;// ���Ƿ�������
			var lonlats = lonlat.split(" ");
			
			// ������ͼ�ϵ�marker
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
			
			// ��ͼ����ӱ�ע�㡣
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
			 + "<input type=\"button\" id=\"spanFirst\" value=\"��ҳ\"></input> <input type=\"button\" id=\"spanPre\" value=\"��ҳ\"></input> "
			 + "<input type=\"button\" id=\"spanNext\" value=\"��ҳ\"></input> <input type=\"button\" id=\"spanLast\" value=\"βҳ\"></input> "
			 + "��<a id=\"spanPageNum\"></a>ҳ/��<a id=\"spanTotalPage\"></a>ҳ"
			 + "</div>";
		
		getId("list").appendChild(divList);
		getId("page").innerHTML = html;
		
		var $p, count, step, // ÿҳ����
		pageSize, // ҳ��
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
			// ���·�ҳ���
			$('#spanPageNum').html(index + 1);
			zoomArr = [];
			var max = (index+1)*step>count?count:(index+1)*step;
			for(var i=index*step;i<max;i++){
				
				var poi = pois[i];
				var lonlat = poi.lonlat;// ����
				var lonlats = lonlat.split(" ");
				// ������ͼ�ϵ�marker
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
				// ��ͼ����ӱ�ע�㡣
				map.addOverLay(marker);
				
				marker.data = poi;
				// ���ñհ���ʽ����ע�����¼�����ʾ���ƺ͵�ַ�����ݡ�

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
				alert("�Ѿ������һҳ");
			}
			else{
				pageTo(curIndex + 1);
			}
		};
		var prePage = function() {
			if(curIndex == 0){
				alert("�Ѿ��ǵ�һҳ");
			}
			else{
				pageTo(curIndex - 1);
			}	
		};

		// �¼�����
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
		
		// ѡ����ʱ�������ʾ��ѯ�ĵ㡣
		map.setViewport(zoomArr);
	} 
}