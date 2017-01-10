var flag = "";
var province = "贵州省";
var city = new Array("贵阳市","六盘水市","遵义市","安顺市","毕节地区","铜仁地区","黔东南州","黔南州","黔西南州");
var county = new Array(
new Array("乌当区","南明区","云岩区","花溪区","白云区","小河区","清镇市","开阳县","城关镇","修文县","龙场镇","息烽县","永靖镇"),
new Array("钟山区","盘县","红果镇","六枝特区","平寨镇","水城县"),
new Array("红花岗区","汇川区","赤水市","仁怀市","遵义县","南白镇","桐梓县","娄山关镇","绥阳县","洋川镇","正安县","凤仪镇","凤冈县","龙泉镇","湄潭县","湄江镇","余庆县","白泥镇","习水县","东皇镇","道真仡佬族苗族自治县","玉溪镇","务川仡佬族苗族自治县","都濡镇"),
new Array("西秀区","平坝县","城关镇","普定县","城关镇","关岭布依族苗族自治县","关索镇","镇宁布依族苗族自治县","城关镇","紫云苗族布依族自治县","松山镇"),
new Array("毕节市","大方县","大方镇","黔西县","城关镇","金沙县","城关镇","织金县","城关镇","纳雍县","雍熙镇","赫章县","城关镇","威宁彝族回族苗族自治县","草海镇"),
new Array("铜仁市","江口县","双江镇","石阡县","汤山镇","思南县","思唐镇","德江县","青龙镇","玉屏侗族自治县","平溪镇","印江土家族苗族自治县","峨岭镇","沿河土家族自治县","和平镇","松桃苗族自治县","蓼皋镇","万山特区","万山镇"),
new Array("凯里市","黄平县","新州镇","施秉县","城关镇","三穗县","八弓镇","镇远县","阳镇","岑巩县","思旸镇","天柱县","凤城镇","锦屏县","三江镇","剑河县","革东镇","台江县","台拱镇","黎平县","德凤镇","榕江县","古州镇","从江县","丙妹镇","雷山县","丹江镇","麻江县","杏山镇","丹寨县","龙泉镇"),
new Array("都匀市","福泉市","荔波县","玉屏镇","贵定县","城关镇","瓮安县","雍阳镇","独山县","城关镇","平塘县","平湖镇","罗甸县","龙坪镇","长顺县","长寨镇","龙里县","龙山镇","惠水县","和平镇","三都水族自治县","三合镇"),
new Array("兴义市","兴仁县","城关镇","普安县","盘水镇","晴隆县","莲城镇","贞丰县","珉谷镇","望谟县","复兴镇","册亨县","者楼镇","安龙县","新安镇","剑河县人民政府驻地由柳川镇迁至革东镇"));

var coorpro = new Array("103.6","109.583333","24.616666","29.216666");
var coorcit = new Array(
new Array("106.45","107.05","26.183333","26.916666"),
new Array("104.305556","105.713889","25.328889","26.925833"),
new Array("105.6","108.216667","27.133333","29.216667"),
new Array("105.216667","106.566667","25.35","26.633333"),
new Array("105.6","106.716667","26.35","27.766667"),
new Array("107.733333","109.466667","27.133333","29.083333"),
new Array("107.288889","109.59","25.322222","27.527778"),
new Array("106.2","108.3","25.066667","27.483333"),
new Array("104.583333","106.533333","24.633333","26.183333"));

function getId(id) {
	return document.getElementById(id);
}

function onclick0(){
	getId("show").innerHTML = "贵州省";
	getId("link").innerHTML = "";
	
	var coorArr = new Array(new TLngLat(coorpro[0], coorpro[2]),new TLngLat(coorpro[0], coorpro[3]),new TLngLat(coorpro[1], coorpro[2]),new TLngLat(coorpro[1], coorpro[3]));
	map.setViewport(coorArr);
	
	var count = city.length;
	var area = new Array(count);
	
	for(var i = 0;i < count;i++){
		var nobr = document.createElement("nobr");
		nobr.innerHTML = "&nbsp&nbsp";
		area[i] = document.createElement("a"); 
        area[i].href = "javascript://"; 
        area[i].innerHTML = city[i]; 
        area[i].onclick = (function(index){return function(){onclick1(index);};})(i);
        getId("link").appendChild(area[i]);
        if(i != count - 1){
        	getId("link").appendChild(nobr);
        }
	}
	flag = "省,贵州省";
}
function onclick1(i){
	getId("show").innerHTML = "";
	getId("link").innerHTML = "";
	
	var temp1 = document.createElement("a"); 
	temp1.href = "javascript://"; 
    temp1.innerHTML = "贵州省"; 
    temp1.onclick = (function(){return function(){onclick0();};})();
    var temp2 = document.createElement("nobr"); 
    temp2.innerHTML = city[i];
    var temp3 = document.createElement("nobr");
	temp3.innerHTML = " -- ";
    getId("show").appendChild(temp1);
    getId("show").appendChild(temp3);
    getId("show").appendChild(temp2);
    
    var coorArr = new Array(new TLngLat(coorcit[i][0], coorcit[i][2]),new TLngLat(coorcit[i][0], coorcit[i][3]),new TLngLat(coorcit[i][1],coorcit[i][2]),new TLngLat(coorcit[i][1], coorcit[i][3]));
    map.setViewport(coorArr);
    
	var count = county[i].length;
	var area = new Array(count);
	
	for(var k = 0;k < count;k++){
		var nobr = document.createElement("nobr");
		nobr.innerHTML = "&nbsp&nbsp";
		area[k] = document.createElement("a"); 
        area[k].href = "javascript://"; 
        area[k].innerHTML = county[i][k] ; 
        area[k].onclick = (function(index1,index2){return function(){onclick2(index1,index2);};})(i,k);
        getId("link").appendChild(area[k]);
        if(i != count - 1){
        	getId("link").appendChild(nobr);
        }
	}
	flag = "市," + city[i];
}
function onclick2(i,j){
	getId("show").innerHTML = "";
	getId("link").innerHTML = "";
	
	var temp1 = document.createElement("a"); 
	temp1.href = "javascript://"; 
    temp1.innerHTML = "贵州省"; 
    temp1.onclick = (function(){return function(){onclick0();};})();
	var temp2 = document.createElement("a"); 
	temp2.href = "javascript://"; 
    temp2.innerHTML = city[i]; 
    temp2.onclick = (function(index){return function(){onclick1(index);};})(i);
    var temp3 = document.createElement("nobr"); 
    temp3.innerHTML = county[i][j];
    var temp4 = document.createElement("nobr");
	temp4.innerHTML = " -- ";
    var temp5 = document.createElement("nobr");
	temp5.innerHTML = " -- ";
    getId("show").appendChild(temp1);
    getId("show").appendChild(temp4);
    getId("show").appendChild(temp2);
    getId("show").appendChild(temp5);
    getId("show").appendChild(temp3);
    flag = "区," + county[i][j];
}

function init_area(){
	getId("show").innerHTML = "贵州省";
	getId("link").innerHTML = "";
	
	var count = city.length;
	var area = new Array(count);
	
	for(var i = 0;i < count;i++){
		var nobr = document.createElement("nobr");
		nobr.innerHTML = "&nbsp&nbsp";
		area[i] = document.createElement("a"); 
        area[i].href = "javascript://"; 
        area[i].innerHTML = city[i]; 
        area[i].onclick = (function(index){return function(){onclick1(index);};})(i);
        getId("link").appendChild(area[i]);
        if(i != count - 1){
        	getId("link").appendChild(nobr);
        }
	}
	flag = "省,贵州省";	
}