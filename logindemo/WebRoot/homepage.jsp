<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%--@ page import="ynxsd.basic.*,ynxsd.tool.*, ynxsd.useradmin.*"--%>
<%--@ include file="inc/before.jsp" --%>
<% 
	response.setHeader("Cache-Control","no-store"); 
	response.setHeader("Pragrma","no-cache"); 
	response.setDateHeader("Expires",0); 
	//pageType = 0;
%>
<%--@ include file="inc/header.jsp" --%>
<%
	//没有找到所属的电站或地区，表示用户无效了
	if(false){// && userBean.getPowerStru()==null
%>
<script language=javascript>
		alert('[无效用户]没有找到您所属的电站或地区，请与管理员联系...');
		document.location='login.jsp';
</script>
<%		
		return;
    }

	
	String url = "url";
	
	String powerid = "admin";//user.getPowerStcd();	
	
	
	//String[] funs = ynxsd.report.FlashManager.getDeptFunction(userBean);
	//String funNames = funs[0];
	//String funMethods = funs[1];
	//String funUrls = funs[2];
	
	String[] data = {"","","","","","","",""};// ynxsd.report.FlashManager.getInitData(userBean);
	String nameStr = data[0];
	String idStr = data[1];
	String planStr = data[2];
	String todayStr = data[3];
	String realStr = data[4];
	String yesterStr = data[5];
	String beforeStr = data[6];
	String dtStr = data[7];

	
	//String[] funNamess = funNames.split(",");
	//String[] funUrlss = funUrls.split(",");
	String[] nameStrs = nameStr.split("#_#");
	
	
	
	String plantType="水电,火电,风电,太阳能,其他,";
	String plantNum=" 1723,31,60,8,81,";
	String plantCap="49582.58,13044.5,2854,200,795.87,";

%>
<html>
<head>
<TITLE><%="节能2014.10.31"%></TITLE>
<!--标题名-->
<META content="text/html; charset=gb2312" http-equiv="Content-Type">
<!--设置文档类型, 代表是文本类型的html文件， 字符集编码是GB2312。-->
</head>
<link type="text/css" rel="stylesheet" href="js/common.css" />
<script language="javascript" type="text/javascript" src="js/jquery132min.js"></script>
<style type="text/css">
<!--嵌入式样表-->
body{

BACKGROUND: #000;

	/**FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#60c0ff,endColorStr=#ffffff);/**渐变色*/
	
	FILTER: Alpha( style=1,opacity=25,finishOpacity=100,startX=50,finishX= 100,startY=50,finishY=100);
	background-color: skyblue;
	*/
}
.systemname{
	text-align:center;
    font-size:30pt;
	color:red;
	font-family:黑体;
}

</style>
<style type="text/css">   


.lib_tabborder {  
    border:1px solid #95C9E1;  
}  

.lib_Contentbox {  
    clear:both;  
    margin-top:0px;  
    border-top:none;  
    height:100%;
    text-align:center;  
    padding-top:0px;  

}   


.nav_3,.nav_5 {width:220px; height:29px; margin:0 auto 0;background:url(image/navbg.gif) repeat-x 0 -180px;}/*设置选项卡格式*/
.nav_3 ul li,.nav_5 ul li{float:left;line-height:29px;display:inline;text-align:center;padding-left:5px; font-size:12px;font-weight:bold;background:url(image/navbg.gif) no-repeat right -208px;}/*设置选项卡格式*/

.nav_3{background:url(image/navbg.gif) repeat-x 0 -180px;}/*灰色背景*/
.nav_3 ul li{background:url(image/navbg.gif) no-repeat right -568px;}/*隔断的亮条*/
/* www.DIVCSS5.com提示：蓝灰色3导航结束*/


ul{margin-left:1px;}
ul li a{float:left;color:#FFF; padding:0 8px;}/*控制未选中的选项卡字体颜色   #FFF----白色*/
li.hover {background:url(image/navbg.gif) repeat-x 0 -240px; position:relative;margin-top:-4px;}  
li.hover a{background:url(image/navbg.gif) repeat-x right -240px;height:33px;line-height:33px;color:#333; text-indent:-3px;}

.nav_5{background:url(image/navbg.gif) repeat-x 0 -180px;}
.nav_5 ul li{background:url(image/navbg.gif) no-repeat right -568px;}
/* www.DIVCSS5.com提示：灰色5导航结束*/

#main{
	width: 1150px;
	height:627px;
	text-align: center;
	background:#DEEDD3 no-repeat fixed center;	
}

.modulemname{
	font-size:12px;
	font-weight:bold;
	color:#330000;
}

.modulelist{
	background:#EBF4E3;
	width: 100px;
}

.hline{
	background:#EBF4E3;
}


.sharp_content{
	width: 50px;
	height: 50px;
}

.stat{
	font-size:12px;
	color:#330000;
}

#rowone{
	font-size:12px;
	bgcolor:#EBF4E3;
	height:40px;
}

#centertitle{
	font-size:18px;
	color:#FFFFFF;
	text-align: center;
	font-weight:bold;

}

</style>
<script type="text/javascript" src="js/close.js"></script>
<script language="javascript">

function exitSystem(){
	document.location = "exitLogin.jsp";
}

function redirect(url){
	//alert(url);
	document.location = url;
}   

var flash;
function initialize(){
	if(navigator.appName.indexOf("Microsoft") != -1){
		flash = window.start;
	}else{
		flash = window.document.start;
	}		
}

function showFlashFunc(id){
    var iWidth = 760;       //弹出窗口的宽度;
    var iHeight = 600;      //弹出窗口的高度;
    //获得窗口的垂直位置
    var iTop = (window.screen.availHeight-30-iHeight)/2;        
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth-10-iWidth)/2;           
    window.open("jsp_select/showFlashFunc.jsp?dispid="+id,"计算公式",'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=yes');
}

 
function setTab(name,cursel,n){  
 for(i=1;i<=n;i++){  
  var menu=document.getElementById(name+i);  
  var con=document.getElementById("con_"+name+"_"+i);  
  menu.className=i==cursel?"hover":"";  
  con.style.display=i==cursel?"block":"none";  
 }  
}  


</script>
<body bgcolor="#D9F2F6" onLoad="initialize();">
<!-- <div style="position:absolute;right:20px;top:80px;color:purple;font-size:12pt;font-weight:bold;cursor:hand" onClick="document.location='login.jsp'">【返回登录】</div> -->

<table width="100%" height="100%" cellSpacing="0" cellPadding="0" border="0" align="center">
<tr valign="middle" >
<td align="center">
<div id="main">
			
			<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0px" >
					  <tr height=78 valign=top>
							<td  colspan="3">							
								<img src="image/index/myheader.gif" width="1150">
							</td>
				      </tr>

					  <tr height=549 >
					     <!-- 加载左边系统模块 -->
					     <td width=200 background=#EBF4E3>
                             <table width="100%" height="100%" cellSpacing="0" cellPadding="0" border="0" align="center">
								<tr height="29px">
								  <td align="left"  valign="top"><div class="nav_3" >
									  <ul>
										<li id="one1"  onClick="setTab('one',1,4)" class="hover"><a href="#">功能菜单</a></li>
										<li id="one2"  onClick="setTab('one',2,4)" ><a href="#">系统集成</a></li>
										<li id="one3"  onClick="setTab('one',3,4)"><a href="#">文档下载</a></li>
									  </ul>
									</div></td>
								</tr>
								<tr >
								  <td>
								  <div class="lib_Contentbox lib_tabborder" style="overflow:auto;">
									  <div id="con_one_1">
										<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1px" bordercolor="#339900" align="center"  valign="middle">
										  <tr align="center"  valign="middle">
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/RQJH.png" width="50" height="50"></div>
											  <div ><span class="modulemname" >日前计划</span> </div></td>

											  <td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/ZCQ.png" width="50" height="50"></div>
											  <div ><span class="modulemname" >中长期计划</span> </div></td>										
										  </tr>


										  <tr align="center"  valign="middle">
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/XXFB.png" width="50" height="50"></div>
											  <div ><span class="modulemname" >信息发布</span> </div></td>
                                             <td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/WRWPF.png" width="50" height="50"> </div>
											  <div ><span class="modulemname" >污染物统计</span> </div></td>	
										  </tr>

										  <tr align="center"  valign="middle">
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/JCSJ.png" width="50" height="50"> </div>
											  <div ><span class="modulemname" >数据平台</span> </div></td>											
											
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/BBGL.png" width="50" height="50"> </div>
											  <div ><span class="modulemname" >报表管理</span> </div></td>
										  </tr>

										  <tr align="center"  valign="middle">
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/JXYH.png" width="50" height="50"> </div>
											  <div ><span class="modulemname" >检修优化</span> </div></td>
											  <td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/QX.png" width="50" height="50"> </div>
											  <div ><span class="modulemname" >用户管理</span> </div></td>	
											
										  </tr>

										  <tr align="center"  valign="middle">											  
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/SJTX.png" width="50" height="50"> </div>
											<div ><span class="modulemname" >系统监控</span> </div></td>
											
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/RZGL.png" width="50" height="50"> </div>
											  <div ><span class="modulemname" >日志管理</span> </div></td>
										  </tr>

										  <%
											for(int i=0;i<0;i=i+2){//分2列i<funNamess.length
										  %>
										  <tr align="center" >
											<td valign="middle"  ><div  class="sharp_content"  style="width=80px;height=80px; background-color:Yellow;background-image:url('image\button1.png');cursor:pointer;  " onClick="document.location='<%="funUrlss[i]"%>'">&nbsp; </div>
											  <div ><span class="modulemname" ><%="funNamess[i]"%></span> </div></td>
											<%if((i+1)<5){%>
											<td valign="middle"  ><div  class="sharp_content"  style="width=100px;height=100px; background-color:Yellow;background-image:url('image\spring.jpg');cursor:pointer;  " onClick="document.location='<%="funUrlss[i]"%>'">&nbsp; </div>
											  <div ><span class="modulemname" ><%="funNamess[i+1]"%></span> </div></td>
											<%}%>
										  </tr>
										  <%}%>
										</table>
									  </div>
									  <div id="con_one_2" style="display:none" >
										<table width="100%" cellpadding="0" cellspacing="0" border="0px" align="center"  valign="middle" bgcolor="#EBF4E3">
										  
										  <tr align="center"  valign="middle" height = 100>											  
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/OCS.png" width="50" height="50"> </div>
											<div ><span class="modulemname" >OCS系统</span> </div></td>
											
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/OMS.png" width="50" height="50"> </div>
											  <div ><span class="modulemname" >OMS系统</span> </div></td>
										  </tr>

                                            <tr height = 1><td colspan=2 class="hline" ><HR  style="border:1px dashed; height:2px;color:#339900"></td></tr>

										  <tr align="center"  valign="middle" height = 100>											  
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/SDZDH.png" width="50" height="50"> </div>
											<div ><span class="modulemname" >水情平台</span> </div></td>
											
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/FHYC.png" width="50" height="50"> </div>
											  <div ><span class="modulemname" >负荷预测</span> </div></td>
										  </tr>

                                            <tr height = 1><td colspan=2 class="hline"><HR  style="border:1px dashed; height:2px;color:#339900"></td></tr>

                                            <tr align="center"  valign="middle" height = 100>											  
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/XD.png" width="50" height="50"> </div>
											<div ><span class="modulemname" >小电系统</span> </div></td>
											
											<td class="modulelist"><div class="sharp_content"  style="cursor:pointer; "onClick=" "><img src="image/BPA.png" width="50" height="50"> </div>
											  <div ><span class="modulemname" >运行方式</span> </div></td>
										  </tr>

                                            <tr height = 1><td colspan=2 class="hline"><HR  style="border:1px dashed; height:2px;color:#339900"></td></tr>

											<tr height = 150><td colspan=2 class="hline"></td></tr>
										</table>
									  </div>

									  <div id="con_one_3" style="display:none">
										<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0px" align="center"  valign="middle" bgcolor="#ffffff">
										  
										  <tr align="left"  valign="middle" height = 20>											  
											<td class="hline"><div style="cursor:pointer; "onClick=" "><img src="image/JRE.png" width="15" height="15"> <span class="modulemname" >JAVA运行插件</span> </div></td>
										  </tr>

										  <tr height = 1><td class="hline"><HR  style="border:1px dashed #000; height:1px;color:#339900"></td></tr>

										  <tr align="left"  valign="middle" height = 20>											  
											<td class="hline"><div style="cursor:pointer; "onClick=" "><img src="image/JRE.png" width="15" height="15"> <span class="modulemname" >修改JAVA操作权限</span> </div></td>
										  </tr>
 
                                           <tr height = 1><td class="hline"><HR  style="border:1px dashed #000; height:1px;color:#339900"></td></tr>

										  <tr align="left"  valign="middle" height = 20>											  
											<td class="hline"><div style="cursor:pointer; "onClick=" "><img src="image/JRE.png" width="15" height="15"> <span class="modulemname" >系统操作指导手册</span> </div></td>
										  </tr> 

										  <tr height = 1><td class="hline"><HR  style="border:1px dashed #000; height:1px;color:#339900"></td></tr>

											<tr height = 368><td  class="hline"></td></tr>


										</table>
									  </div>
									</div>
								</td>
								</tr>
							</table>						 
						 
						 </td>
						
						 <!-- 加载中间的电网计划跟踪模块 -->
						 <td width=750>
							<table width="100%" height="100%" cellpadding="0" cellspacing="0" >
								<tr height="29px">
								  <td bgcolor=#64A600 id=centertitle>云南电网【2014-11-12】负荷与发电计划跟踪</td>
								</tr>
								<tr>
								  <td><table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1px">
									  <tr height="29px">
										<td><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="100%" height="100%" id="start" align="middle">
											<param name="allowScriptAccess" value="sameDomain" />
											<param name="FlashVars" value="url='url'&dpid='powerid'&username='测试'&funNames='funNames'&funMethods='funMethods'&funUrls='funUrls'&nameStr='nameStr'&idStr='idStr'&planStr='planStr'&todayStr='todayStr'&realStr='realStr'&yesterStr='yesterStr'&beforeStr='beforeStr'&dtStr='dtStr'" />
											<param name=wmode value=transparent>
											<param name="movie" value="swf/trace/startwjy_black1.swf" />
											<param name="quality" value="high" />
											<param name="scale" value="exactfit" />
											<param name="bgcolor" value="#000000" />
											<embed src="swf/trace/startwjy_black1.swf" quality="high" scale="exactfit" bgcolor="#EBF4E3" width="100%" height="100%" name="start" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
										  </object>
										</td>
									  </tr>
									</table></td>
								</tr>
							  </table>
							  </td>
					     
						 <!-- 加载右边统计模块 -->
						 <td width=200>
						      <table width="100%" height="100%" cellSpacing="0" cellPadding="0" border="0" align="center" >
								<!-- 加载选项卡 -->
								<tr height="29px">
								  <td align="left"  valign="top"><div class="nav_5" >
									  <ul>
										<li id="two1"  onClick="setTab('two',1,4)" class="hover"><a href="#">当日电量</a></li>
										<li id="two2"  onClick="setTab('two',2,4)" ><a href="#">电站数目</a></li>
										<li id="two3"  onClick="setTab('two',3,4)"><a href="#">装机容量</a></li>
									  </ul>
									</div></td>
								</tr>

								<tr height="520">
								  <td valign="top">
									  <div class="lib_Contentbox lib_tabborder" style="overflow:auto;">
										  <div id="con_two_1">
											<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1px" align="center"  valign="middle"  bgcolor="#ffffff" class=stat>
											  <!--上面的表格 -->
											  <tr  align="center" height=40>
												<td><B>统计项目</B></td>
												<td><B>日电量/MWh</B></td>
												<td><B>比例</B></td>
											  </tr >

											  <tr  align="center" height=40 bgcolor=#EBF4E3>
												<td >全部</td>
												<td >0</td>
												<td >100%</td>
											  </tr >
											  <tr  align="center" height=40>
												<td >水电</td>
												<td >0</td>
												<td >74.59%</td>
											  </tr >
											  <tr  align="center" height=40 bgcolor=#EBF4E3>
												<td >火电</td>
												<td >0</td>
												<td >19.62%</td>
											  </tr >
											  <tr  align="center" height=40>
												<td >风电</td>
												<td >0</td>
												<td >4.29%</td>
											  </tr >
											  <tr  align="center"  height=40 bgcolor=#EBF4E3>
												<td >光伏</td>
												<td >0</td>
												<td >0.30%</td>
											  </tr >
											  <tr  align="center"  height=40>
												<td >其他</td>
												<td >0</td>
												<td >1.20%</td>
											  </tr >

											  <tr height="200">
												<!--下面的图形 -->
												<td colspan="3" align=center> 饼图
												 <!--  <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="100%" height="100%" id="start" align="middle">
													<param name="allowScriptAccess" value="sameDomain" />
													<param name=wmode value=transparent>
													<param name="movie" value="swf/trace/BarChart3D/Vertical-Bars-Chart-3D2.swf" />
													<param name="quality" value="high" />
													<param name="scale" value="exactfit" />
													<param name="bgcolor" value="#000000" />
													<embed src="swf/trace/BarChart3D/Vertical-Bars-Chart-3D2.swf" quality="high" scale="exactfit" bgcolor="#000000" width="100%" height="100%" name="start" align="middle" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
												  </object> -->
												</td>
											  </tr>
											</table>
										  </div>
										  <div id="con_two_2" style="display:none">
											<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1px" align="center"  valign="middle"  bgcolor="#ffffff" class=stat >
											  <!--第二个表格 -->
											    <tr  align="center" height=40>
												<td><B>统计项目</B></td>
												<td><B>电站数目</B></td>
												<td><B>机组数目</B></td>
											  </tr >

											  <tr  align="center" height=40 bgcolor=#EBF4E3>
												<td >全部</td>
												<td >188</td>
												<td >***</td>
											  </tr >
											  <tr  align="center" height=40>
												<td >水电</td>
												<td >105</td>
												<td >***</td>
											  </tr >
											  <tr  align="center" height=40 bgcolor=#EBF4E3>
												<td >火电</td>
												<td >11</td>
												<td >***</td>
											  </tr >
											  <tr  align="center" height=40>
												<td >风电</td>
												<td >55</td>
												<td >***</td>
											  </tr >
											  <tr  align="center"  height=40 bgcolor=#EBF4E3>
												<td >光伏</td>
												<td >7</td>
												<td >***</td>
											  </tr >
											  <tr  align="center"  height=40>
												<td >其他</td>
												<td >0</td>
												<td >0</td>
											  </tr >

											  <tr height="200">
												<!--下面的图形 -->
												<td colspan="3" align=center> 柱状图
												  <!-- <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="100%" height="100%" id="start" align="middle">
													<param name="allowScriptAccess" value="sameDomain" />
													<param name=wmode value=transparent>
													<param name="movie" value="swf/trace/BarChart3D/Vertical-Bars-Chart-3D2.swf" />
													<param name="quality" value="high" />
													<param name="scale" value="exactfit" />
													<param name="bgcolor" value="#000000" />
													<embed src="swf/trace/BarChart3D/Vertical-Bars-Chart-3D2.swf" quality="high" scale="exactfit" bgcolor="#000000" width="100%" height="100%" name="start" align="middle" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
												  </object> -->
												</td>
											  </tr>
											</table>		  
										  </div>

										  <div id="con_two_3" style="display:none">
											<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1px" align="center"  valign="middle"  bgcolor="#ffffff" class=stat >
											  <!--上面的表格 -->
											  <tr  align="center" height=40>
												<td><B>统计项目</B></td>
												<td><B>装机/MW</B>h</td>
												<td><B>比例</B></td>
											  </tr >

											  <tr  align="center" height=40 bgcolor=#EBF4E3>
												<td >全部</td>
												<td >66476.95</td>
												<td >100%</td>
											  </tr >
											  <tr  align="center" height=40>
												<td >水电</td>
												<td >49582</td>
												<td >74.59%</td>
											  </tr >
											  <tr  align="center" height=40 bgcolor=#EBF4E3>
												<td >火电</td>
												<td >13044</td>
												<td >19.62%</td>
											  </tr >
											  <tr  align="center" height=40>
												<td >风电</td>
												<td >2854</td>
												<td >4.29%</td>
											  </tr >
											  <tr  align="center"  height=40 bgcolor=#EBF4E3>
												<td >光伏</td>
												<td >200</td>
												<td >0.30%</td>
											  </tr >
											  <tr  align="center"  height=40>
												<td >其他</td>
												<td >0</td>
												<td >0%</td>
											  </tr >

											  <tr height="200">
												<!--下面的图形 -->
												<td colspan="3" align=center> 饼图
												 <!--  <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="100%" height="100%" id="start" align="middle">
													<param name="allowScriptAccess" value="sameDomain" />
													<param name=wmode value=transparent>
													<param name="movie" value="swf/trace/BarChart3D/Vertical-Bars-Chart-3D2.swf" />
													<param name="quality" value="high" />
													<param name="scale" value="exactfit" />
													<param name="bgcolor" value="#000000" />
													<embed src="swf/trace/BarChart3D/Vertical-Bars-Chart-3D2.swf" quality="high" scale="exactfit" bgcolor="#000000" width="100%" height="100%" name="start" align="middle" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
												  </object> -->
												</td>
											  </tr>
											</table>
										  </div>
									  </div>
								  </td>
								</tr>
						 </td>
					  
					  </tr>
				       
					   <!-- 高度允许的话加载底部状态栏 -->
					  <tr></tr>
					  
					  
					 
		
			</table>
			
</div></td></tr></table>
</body>
</html>
