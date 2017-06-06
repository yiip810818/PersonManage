<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>招聘管理</title>
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/RecruitmentManage.js"></script>
</head>
<body>
	<!-- datagrid指表格屬性 
	pagination显示底部分页功能 
	fitColumns自动扩大或缩小列的大小自动适应界面-->
	<table id="dg" title="" class="easyui-datagrid"
		style="width: 700px; height: 250px" fitColumns="true"
		rownumbers="true" fit="true" pagination="true" url="recruitment"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th data-options="field:'tableid'" width="20">编号</th>
				<th data-options="field:'positionName'" width="40">招聘岗位</th>
				<th data-options="field:'workYears'" width="40">工作年限</th>
				<th data-options="field:'positionRemark'" width="100">招聘要求</th>
			</tr>
		</thead>
	</table>
	<div style="padding: 5px;" id="tb">
		<a href="javascript:openRecruitmentAddDialog()"
			class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			plain="true">添加</a> <a href="javascript:openRecruitmentEditDialog()"
			class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
			plain="true">修改</a> <a href="javascript:deleteRecruitment()"
			class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
			plain="true">删除</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;招聘岗位：&nbsp;<input
			type="text" name="positionName" id="positionName" />&nbsp; <a
			href="javascript:searchPosition()" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon-search'" plain="true">搜索</a>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px;" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>招聘编号：</td>
					<td><input type="text" name="recruitment.tableid" id="tableid"
						class="easyui-validatebox" required="true"></td>
				</tr>
				<tr>
					<td>招聘岗位：</td>
					<td><input type="text" name="recruitment.positionName"
						id="positionName1" class="easyui-validatebox" required="true"></td>
				</tr>
				<tr>
					<td>工作年限：</td>
					<td><input type="text" name="recruitment.workYears"
						id="workYears" class="easyui-validatebox" required="true"></td>
				</tr>
				<tr>
					<td valign="top">招聘要求：</td>
					<td><textarea rows="7" cols="30"
							name="recruitment.positionRemark" id="positionRemark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveRecruitment()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeDepartmentDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>