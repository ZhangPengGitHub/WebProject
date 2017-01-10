<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>用户管理</title>
	<link type="text/css" rel="stylesheet" href="user_utility/css/user_manage.css" />
	<link rel="stylesheet" type="text/css" href="user_utility/css/SimpleTree.css"/>
    <script type="text/javascript" src="user_utility/js/jquery-1.11.2.js"></script>
    
    <script type="text/javascript" src="user_utility/js/SimpleTree.js"></script>
    
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
    
</head>

<body>
<div id="Layer">
	<div id="header"><img src="user_utility/css/imgs/top.jpg" width=1150px height=78px/></div>
	<div id="menu">
		<table cellSpacing=0 cellPadding=0>
			<tr>
				<td class="self_1" width="100px"><a class="self_2" href="user_utility/user_manage.jsp">用户管理</a></td>
				<td class="menu_a" width="100px"><a class="a" href="user_utility/role_manage.jsp">角色管理</a></td>
				<td class="menu_a" width="100px"><a class="a" href="user_utility/user_info.jsp">人员资料</a></td>
				<td class="menu_a" width="100px"><a class="a" href="user_utility/sys_module.jsp">系统模块</a></td>
			</tr>
		</table>
	</div>
	<div id="content_left">
		<div class="st_tree">
            <ul>
	            <li><a href="#" ref="调度中心">调度中心</a></li>
	            <li>供电单位</li>
                <ul show="true">
		            <li>临沧供电局</li>
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
					<TD background=user_utility/image/bt1_3.jpg height=28>
						<TABLE height=28 cellSpacing=0 cellPadding=0 width=900 border=0>
							<TBODY>
								<TR>
									<TD align=center width=30 background=user_utility/image/bt1_1.jpg>
										<IMG height=16 src="user_utility/image/ico_01.gif" width=16>
									 </TD>
									 <TD class=font-red width=105 background=user_utility/image/bt1_1.jpg>
										用户管理
									 </TD>
									 <TD width=23>
										<IMG height=28 src="user_utility/image/bt1_2.jpg" width=23>
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
				    <td id="button_1"  ><input type="button" value="添加用户" onclick="location='user_utility/user_add.jsp'"/></a></td>
				    <td id="button_2"  ><input type="button" value="保存顺序" /></td>
			    </tr>
		    </table>
	    </div>
	    <div id="mid_middle">
            <div id="table">
		    <table cellspacing="0" cellpadding="0">
		        <tr height="30px">
				    <td id="number" width="75px" align="center">序号</td>
				    <td id="type" width="150px" align="center">用户类型</td>
				    <td id="unit" width="175px" align="center">单位</td>
				    <td id="department" width="175px" align="center">部门</td>
				    <td id="name" width="100px" align="center">用户姓名</td>
				    <td id="order" width="75px" align="center">顺序</td>
				    <td id="operation" width="100px" align="center">操作</td>
			    </tr>
			    <tr height="30px">
				    <td class="number" align="center">0001</td>
				    <td class="type" align="center">省调用户</td>
				    <td class="unit" align="center">调度中心</td>
				    <td class="department" align="center">方式科</td>
				    <td class="name" align="center">张鹏</td>
				    <td class="order" align="center"><input style="width:50px;text-align:center;" value="01"/></td>
				    <td class="operation" align="center"><a href="user_utility/user_edit.jsp">编辑</a>&nbsp<a href="#">删除</a></td>
			    </tr>
			    <%for(int i=0;i<100;i++){ %>
			    <tr height="30px">
				    <td class="number" align="center"></td>
				    <td class="type" align="center"></td>
				    <td class="unit" align="center"></td>
				    <td class="department" align="center"></td>
				    <td class="name" align="center"></td>
				    <td class="order" align="center"><input style="width:50px;text-align:center;"/></td>
				    <td class="operation" align="center"><a href="user_utility/user_edit.jsp">编辑</a>&nbsp<a href="#">删除</a></td>
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
