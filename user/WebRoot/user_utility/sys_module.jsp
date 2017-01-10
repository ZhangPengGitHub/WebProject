<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>用户管理</title>
	<link type="text/css" rel="stylesheet" href="css/sys_module.css" />
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
				<td class="menu_a" width="100px"><a class="a" href="user_manage.jsp">用户管理</a></td>
				<td class="menu_a" width="100px"><a class="a" href="role_manage.jsp">角色管理</a></td>
				<td class="menu_a" width="100px"><a class="a" href="user_info.jsp">人员资料</a></td>
				<td class="self_1" width="100px"><a class="self_2" href="sys_module.jsp">系统模块</a></td>
			</tr>
		</table>
	</div>
	<div id="content_mid">
	    <div id="mid_up">
	    <br>
	    <TABLE cellSpacing=0 cellPadding=0 width=1100  border=0 style="margin:0px auto;">
			<TBODY>
				<TR>
					<TD background=image/bt1_3.jpg height=28>
						<TABLE height=28 cellSpacing=0 cellPadding=0 width=1100 border=0>
							<TBODY>
								<TR>
									<TD align=center width=30 background=image/bt1_1.jpg>
										<IMG height=16 src="image/ico_01.gif" width=16>
									 </TD>
									 <TD class=font-red width=105 background=image/bt1_1.jpg>
										系统模块
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
				    <td id="button_1"  ><a href="#"><input type="button" value="添加系统模块" /></a></td>
				    <td id="button_2"  ><a href="#"><input type="button" value="保存修改" /></a></td>
			    </tr>
		    </table>
	    </div>
	    <div id="mid_middle">
		    <table id="table" cellspacing="0" cellpadding="0">
		        <tr height="30px">
				    <td id="number" width="75px" align="center">序号</td>
				    <td id="id" width="75px" align="center">ID</td>
				    <td id="name" width="100px" align="center">模块名称</td>
				    <td id="address" width="150px" align="center">模块地址</td>
				    <td id="supperior" width="75px" align="center">上级ID</td>
				    <td id="class" width="150px" align="center">权限分类</td>
				    <td id="picture" width="100px" align="center">图片</td>
				    <td id="modification" width="75px" align="center">修改</td>
				    <td id="add" width="75px" align="center">添加</td>
				    <td id="delete" width="75px" align="center">删除</td>
			    </tr>
                <%for(int i=0;i<10;i++){ %>
                <tr height="30px">
				    <td class="number" align="center"></td>
				    <td class="id" align="center"></td>
				    <td class="name" align="center"></td>
				    <td class="address" align="center"></td>
				    <td class="supperior" align="center"></td>
				    <td class="class" align="center"></td>
				    <td class="picture" align="center"></td>
				    <td class="modification" align="center"><a href="#">修改</a></td>
				    <td class="add" align="center"><a href="#">添加</a></td>
				    <td class="delete" align="center"><a href="#">删除</a></td>
			    </tr>
			    <%for(int j=0;j<10;j++){ %>
			    <tr height="30px">
				    <td class="number" align="center"></td>
				    <td class="id" align="center"></td>
				    <td class="name" align="center"></td>
				    <td class="address" align="center"></td>
				    <td class="supperior" align="center"></td>
				    <td class="class" align="center"></td>
				    <td class="picture" align="center"></td>
				    <td class="modification" align="center"><a href="#">修改</a></td>
				    <td class="add" align="center"><a href="#"></a></td>
				    <td class="delete" align="center"><a href="#">删除</a></td>
			    </tr>
			    <%} }%>
		    </table>
	    </div>
	    <div id="mid_down">
	    </div>
	</div>
</div>
</body>
</html>
