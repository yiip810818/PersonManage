<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门管理</title>
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/DepartmentManage.js"></script>
</head>
<body>
    <!-- datagrid指表格屬性 
	pagination显示底部分页功能 
	fitColumns自动扩大或缩小列的大小自动适应界面-->
	<table id="dg" title="" class="easyui-datagrid"
		style="width: 700px; height: 250px" fitColumns="true"
		rownumbers="true" fit="true" pagination="true" url="department"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th data-options="field:'departmentId'" width="20">编号</th>
				<th data-options="field:'departmentName'" width="40">部门名称</th>
				<th data-options="field:'departmentDesc'" width="100">部门描述</th>
			</tr>
		</thead>
	</table>
	<div style="padding: 5px;" id="tb">
		<a href="javascript:openDepartmentAddDialog()"
			class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			plain="true">添加</a> <a href="javascript:openDepartmentModifyDialog()"
			class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
			plain="true">修改</a> <a href="javascript:deleteDepartment()"
			class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
			plain="true">删除</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门名称：&nbsp;<input
			type="text" name="s_departmentName" id="s_departmentName" />&nbsp; <a
			href="javascript:searchDepartment()" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon-search'" plain="true">搜索</a>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px;" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>部门名称：</td>
					<td><input type="text" name="department.departmentName"
						id="departmentName" class="easyui-validatebox" required="true"></td>
				</tr>
				<tr>
					<td valign="top">部门描述：</td>
					<td><textarea rows="7" cols="30"
							name="department.departmentDesc" id="departmentDesc"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveDepartment()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a
			href="javascript:closeDepartmentDialog()" class="easyui-linkbutton"
			iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>