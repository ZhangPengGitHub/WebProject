<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>人员资料</title>
	<link type="text/css" rel="stylesheet" href="css/user_info.css" />
	<link rel="stylesheet" type="text/css" href="css/SimpleTree.css"/>
    <script type="text/javascript" src="js/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="js/SimpleTree.js"></script>
    
    <script type="text/javascript">
    $(function(){
	    $(".st_tree").SimpleTree({
		    click:function(a){
			    if(!$(a).attr("hasChild"))
				    alert($(a).attr("ref"));
		    }
	    });
    });
    </script>
</head>

    <script language="javascript">
	function setTab(name,cursel,n){  
 		for(i=1;i<=n;i++){  
  			var menu=document.getElementById(name+i);  
  			var con_mid=document.getElementById("content_"+i); 
  			var con_left=document.getElementById("left_"+i); 
  			menu.className=i==cursel?"hover":"";  
  			con_mid.style.display=i==cursel?"block":"none"; 
 		}  
	}
    </script>
<body>
<div id="Layer">
	<div id="header"><img src="css/imgs/top.jpg" width=1150px height=78px/></div>
	<div id="menu">
		<table cellSpacing=0 cellPadding=0>
			<tr>
				<td class="menu_a" width="100px"><a class="a" href="/user/user_manage.jsp">用户管理</a></td>
				<td class="menu_a" width="100px"><a class="a" href="role_manage.jsp">角色管理</a></td>
				<td class="self_1" width="100px"><a class="self_2" href="user_info.jsp">人员资料</a></td>
				<td class="menu_a" width="100px"><a class="a" href="sys_module.jsp">系统模块</a></td>
			</tr>
		</table>
	</div>
	<div id="content_left">
		<div class="st_tree">
            <ul>
	            <li><a href="#" ref="调度中心">调度中心</a></li>
	            <li><a href="#" ref="供电单位">供电单位</a></li>
                <ul show="true">
		            <li><a href="#" ref="临沧供电局">临沧供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>
		            <li><a href="#" ref="丽江供电局">丽江供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>
		            <li><a href="#" ref="宝山供电局">宝山供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>
		            <li><a href="#" ref="大理供电局">大理供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>
		            <li><a href="#" ref="怒江供电局">怒江供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>
		            <li><a href="#" ref="红河供电局">红河供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>
		            <li><a href="#" ref="昆明供电局">昆明供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>
		            <li><a href="#" ref="楚雄供电局">楚雄供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>
		            <li><a href="#" ref="玉溪供电局">玉溪供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>
		            <li><a href="#" ref="曲靖供电局">曲靖供电局</a></li>
		            <ul>
		                <li><a href="#" ref="临沧润达">临沧润达</a></li>
		                <li><a href="#" ref="临翔区">临翔区</a></li>
		                <li><a href="#" ref="云县">云县</a></li>
		                <li><a href="#" ref="凤庆县">凤庆县</a></li>
		                <li><a href="#" ref="双江县">双江县</a></li>
		                <li><a href="#" ref="永德县">永德县</a></li>
		                <li><a href="#" ref="沧源县">沧源县</a></li>
		                <li><a href="#" ref="耿马县">耿马县</a></li>
		                <li><a href="#" ref="镇康县">镇康县</a></li>
	                </ul>		            
	            </ul>
	            <li><a href="#" ref="电站">电站</a></li>
                <ul>
		                <li><a href="#" ref="红石岩电站">红石岩电站</a></li>
		                <li><a href="#" ref="大柏树电站">大柏树电站</a></li>
		                <li><a href="#" ref="永安河电站">永安河电站</a></li>
		                <li><a href="#" ref="良马电站">良马电站</a></li>
		                <li><a href="#" ref="老桥电站">老桥电站</a></li>
		                <li><a href="#" ref="灰窝电站">灰窝电站</a></li>
		                <li><a href="#" ref="新火山电站">新火山电站</a></li>
		                <li><a href="#" ref="文乐电站">文乐电站</a></li>
		                <li><a href="#" ref="岔河电站">岔河电站</a></li>
		                <li><a href="#" ref="fhgl">大宝山电站</a></li>
	            </ul>
            </ul>
        </div>
	</div>
	<div id="content_mid">
	    <div id="mid_up">
	    <br>
	    <TABLE cellSpacing=0 cellPadding=0 width=900  border=0 style="margin:0px auto;">
			<TBODY>
				<TR>
					<TD background=image/bt1_3.jpg height=28>
						<TABLE height=28 cellSpacing=0 cellPadding=0 width=900 border=0>
							<TBODY>
								<TR>
									<TD align=center width=30 background=image/bt1_1.jpg>
										<IMG height=16 src="image/ico_01.gif" width=16>
									 </TD>
									 <TD class=font-red width=105 background=image/bt1_1.jpg>
										人员资料
									 </TD>
									 <TD width=23>
										<IMG height=28 src="image/bt1_2.jpg" width=23>
									 </TD>
									 <TD>&nbsp;						
									 </TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
        </TABLE>
	        <table id="button">
			    <tr>
			        <td id="button_1"  ><a href="#"><input width='100px'></a></td>
				    <td id="button_2"  ><a href="#"><input type="button" value="查询" /></a></td>
				    <td id="button_3" width="555px"></td>
				    <td id="button_4"  ><a href="#"><input type="button" value="保存" /></a></td>
				    <td id="button_5"  ><a href="#"><input type="button" value="导出" /></a></td>
			    </tr>
		    </table>
	    </div>
	    <div id="mid_middle">
	        <div id="table">
		    <table cellspacing="0" cellpadding="0">
		        <tr height="30px">
				    <td id="number" width="50px" align="center">序号</td>
				    <td id="name" width="75px" align="center">姓名</td>
				    <td id="sex" width="50px" align="center">性别</td>
				    <td id="birthday" width="100px" align="center">出生日期</td>
				    <td id="tel_number" width="110px" align="center">手机号码</td>
				    <td id="email" width="150px" align="center">电子邮箱</td>
				    <td id="phone" width="115px" align="center">办公电话</td>
				    <td id="other" width="100px" align="center">备注</td>
				    <td id="operation" width="100px" align="center">操作</td>
			    </tr>
			    <tr height="30px">
				    <td class="number" align="center">0001</td>
				    <td class="name" align="center">张鹏</td>
				    <td class="sex" align="center">男</td>
				    <td class="birthday" align="center">1991-12-09</td>
				    <td class="tel_number" align="center">18842620414</td>
				    <td class="email" align="center">zp0016@qq.com</td>
				    <td class="phone" align="center">0411-87570000</td>
				    <td class="other" align="center"></td>
				    <td class="operation" align="center"><a href="#">编辑</a>&nbsp<a href="#">删除</a></td>
			    </tr>
			    <%for(int i=0;i<100;i++){ %>
			    <tr height="30px">
				    <td class="number" align="center"></td>
				    <td class="name" align="center"></td>
				    <td class="sex" align="center"></td>
				    <td class="birthday" align="center"></td>
				    <td class="tel_number" align="center"></td>
				    <td class="email" align="center"></td>
				    <td class="phone" align="center"></td>
				    <td class="other" align="center"></td>
				    <td class="operation" align="center"><a href="user_edit.jsp">编辑</a>&nbsp<a href="#">删除</a></td>
			    </tr>
			    <%} %>
		    </table>
		    </div>
	    </div>
	    <div id="mid_down">
	    </div>
	</div>
</div>
</body>
</html>
