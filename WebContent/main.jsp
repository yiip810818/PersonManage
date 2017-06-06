<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<title>人力资源管理系统主界面</title>
<%
	//权限验证
	if(session.getAttribute("currentUser")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
</head>
<!-- easyUI布局  分为东西南北部和中心部分 -->
<body class="easyui-layout">
	<div data-options="region:'north',title:'您正在使用金慧人事管理系统',split:true" iconCls="icon-tip"
		style="height: 100px; background-color: #F9F7F8">
		<img alt="" src="image/table.jpg"
			style="height: 100%; width: 100%; float: left;background-size:cover;">
		<div style="margin: 50px 50px 20px; float: right;">
			当前登录用户：&nbsp;<font color="red">${currentUser.userName }</font>
		</div>
	</div>
	<div data-options="region:'south'" style="height: 30px; padding: 5px;"
		align="center">
		版权所有&nbsp;&nbsp;<a href="http://www.baidu.com">yii</a>
	</div>
	<!-- spilt属性是指使导航菜单可以缩放显示，同时可以拖动框的大小 -->
	<div data-options="region:'west',split:true" title="导航菜单"
		style="width: 200px;">
		<ul id="tree" class="easyui-tree"></ul>
	</div>
	<div data-options="region:'center'">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" style="padding: 10px;">
				<div align="center" style="padding-top: 100px;background-image: url("image/table.jpg");">
					<font color="red" size="7">欢迎进入人事管理系统</font>
				</div>
			</div>
			<div title="系统公告" style="padding: 10px">
				<div align="center" style="padding-top: 100px;">
					<font color="red" size="7">热烈庆祝人事管理系统竣工</font>
				</div>
			</div>
		</div>
	</div>
</body>
</html>