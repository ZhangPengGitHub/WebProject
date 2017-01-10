<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>添加用户</title>
	<link type="text/css" rel="stylesheet" href="css/user_add.css" />

  </head>
<body>
<div id="Layer">
	<div id="header"><img src="css/imgs/top.jpg" width=1150px height=78px/></div>
	<div id="menu">
		<table cellSpacing=0 cellPadding=0>
			<tr>
				<td class="self_1" width="100px"><a class="self_2" href="user_manage.jsp">用户管理</a></td>
				<td class="menu_a" width="100px"><a class="a" href="role_manage.jsp">角色管理</a></td>
				<td class="menu_a" width="100px"><a class="a" href="user_info.jsp">人员资料</a></td>
				<td class="menu_a" width="100px"><a class="a" href="sys_module.jsp">系统模块</a></td>
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
										添加用户
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
				    <td id="button_1"  ><a href="user_add.jsp"><input type="button" value="保存用户信息" /></a></td>
			    </tr>
		    </table>
	    </div>
	    <div id="mid_middle1">
		    <table id="table1" cellspacing="0" cellpadding="0">
		        <tr height="30px">
				    <td id="type" width="100px" align="center">用户类型:</td>
				    <td class="input" width="300px" align="center">
				        <select name="type" id="selectType" style="width:250px;">   
                            <option value="1">省调用户</option>   
                            <option value="2">地调用户</option>   
                            <option value="3">县调用户</option>   
                            <option value="4">电厂用户</option>     
                        </select></td>
				    <td id="role" width="100px" align="center">账户角色:</td>
				    <td class="input" width="300px" align="center">
                        <select name="role" id="selectRole" style="width:250px;">   
                            <option value="1">省调管理员</option>   
                            <option value="2">省调查询用户</option>   
                            <option value="3">地调管理员</option>   
                            <option value="4">地调查询用户</option> 
                            <option value="5">县调管理员</option>   
                            <option value="6">县调查询用户</option>   
                            <option value="7">电站管理</option>   
                            <option value="8">电站查询</option>    
                        </select></td></td>
			    </tr>
			    <tr height="30px">
				    <td id="unit" width="100px" align="center">用户单位:</td>
				    <td class="input" width="300px" align="center">
                        <select name="unit" id="selectUnit" style="width:250px;">   
                            <option value="1">调度中心</option>      
                        </select></td>
				    <td id="name" width="100px" align="center">账户姓名:</td>
				    <td class="input" width="300px" align="center"><input style="width:250px;"/></td>
			    </tr>
			    <tr height="30px">
				    <td id="department" width="150px" align="center">部门名称:</td>
				    <td class="input" width="325px" align="center">
				        <select name="department" id="selectDepartment" style="width:250px;">   
                            <option value="1">公司领导</option>   
                            <option value="2">方式科</option>   
                            <option value="3">调度科</option>      
                        </select></td>
				    <td id="password" width="150px" align="center">账户密码:</td>
				    <td class="input" width="325px" align="center"><input style="width:250px;"/></td>
			    </tr>
		    </table>
	    </div>
	    <div id="mid_middle2">
	         <table id="table2" cellspacing="0" cellpadding="0">
		        <tr height="30px">
				    <td id="name" width="100px" align="center">模块名称</td>
				    <td id="limit" width="750px" align="center">权限信息</td>
				    <td id="all" width="100px" align="center">全选</td>
			    </tr>
	            <%for(int i=0;i<100;i++){ %>
			    <tr height="30px">
				    <td class="name" align="center">模块</td>
				    <td class="limit" align="center"><input name="limit" type="checkbox" value="" />查看
				                                     <input name="limit" type="checkbox" value="" />修改
				                                     <input name="limit" type="checkbox" value="" />审批
				                                     <input name="limit" type="checkbox" value="" />审核</td>
				    <td class="all" align="center"><input name="limit" type="checkbox" value="" /></td>
			    </tr>
			    <%} %>
			</table>
	    </div>
	    <div id="mid_down">
	    </div>
	</div>
</div>
</body>
</html>
