var flag = "";
var province = "����ʡ";
var city = new Array("������","����ˮ��","������","��˳��","�Ͻڵ���","ͭ�ʵ���","ǭ������","ǭ����","ǭ������");
var county = new Array(
new Array("�ڵ���","������","������","��Ϫ��","������","С����","������","������","�ǹ���","������","������","Ϣ����","������"),
new Array("��ɽ��","����","�����","��֦����","ƽկ��","ˮ����"),
new Array("�컨����","�㴨��","��ˮ��","�ʻ���","������","�ϰ���","ͩ����","¦ɽ����","������","����","������","������","�����","��Ȫ��","��̶��","�ؽ���","������","������","ϰˮ��","������","��������������������","��Ϫ��","������������������","�����"),
new Array("������","ƽ����","�ǹ���","�ն���","�ǹ���","���벼��������������","������","��������������������","�ǹ���","�������岼����������","��ɽ��"),
new Array("�Ͻ���","����","����","ǭ����","�ǹ���","��ɳ��","�ǹ���","֯����","�ǹ���","��Ӻ��","Ӻ����","������","�ǹ���","���������������������","�ݺ���"),
new Array("ͭ����","������","˫����","ʯ����","��ɽ��","˼����","˼����","�½���","������","��������������","ƽϪ��","ӡ������������������","������","�غ�������������","��ƽ��","��������������","ޤ����","��ɽ����","��ɽ��"),
new Array("������","��ƽ��","������","ʩ����","�ǹ���","������","�˹���","��Զ��","����","᯹���","˼�D��","������","�����","������","������","������","�ﶫ��","̨����","̨����","��ƽ��","�·���","�Ž���","������","�ӽ���","������","��ɽ��","������","�齭��","��ɽ��","��կ��","��Ȫ��"),
new Array("������","��Ȫ��","����","������","����","�ǹ���","�Ͱ���","Ӻ����","��ɽ��","�ǹ���","ƽ����","ƽ����","�޵���","��ƺ��","��˳��","��կ��","������","��ɽ��","��ˮ��","��ƽ��","����ˮ��������","������"),
new Array("������","������","�ǹ���","�հ���","��ˮ��","��¡��","������","�����","�����","������","������","�����","��¥��","������","�°���","��������������פ����������Ǩ���ﶫ��"));

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
	getId("show").innerHTML = "����ʡ";
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
	flag = "ʡ,����ʡ";
}
function onclick1(i){
	getId("show").innerHTML = "";
	getId("link").innerHTML = "";
	
	var temp1 = document.createElement("a"); 
	temp1.href = "javascript://"; 
    temp1.innerHTML = "����ʡ"; 
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
	flag = "��," + city[i];
}
function onclick2(i,j){
	getId("show").innerHTML = "";
	getId("link").innerHTML = "";
	
	var temp1 = document.createElement("a"); 
	temp1.href = "javascript://"; 
    temp1.innerHTML = "����ʡ"; 
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
    flag = "��," + county[i][j];
}

function init_area(){
	getId("show").innerHTML = "����ʡ";
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
	flag = "ʡ,����ʡ";	
}