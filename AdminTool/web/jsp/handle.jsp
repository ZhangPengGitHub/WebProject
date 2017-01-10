<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Paper Importer</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="https://cn.avoscloud.com/scripts/lib/av-0.3.3.min.js"></script>
<script type="text/javascript" src="js/import.js"></script>
</head>
<body>
	<%
		String[][] result = (String[][]) session.getAttribute("array");
	%> 
<script> 
        var res = [];
        <%for(int i=0;i <result.length;i++){%> 
              res[<%=i%>] = [];
            <%for(int j=0;j <6;j++){%>
                  res[<%=i%>][<%=j%>] = "<%=result[i][j]%>"; 
            <%}%> 
        <%}%> 
        test();
        alert("导入完成！");
        window.location.href="jsp/import.jsp";
</script>
</body>
</html>
