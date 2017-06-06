<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>培训管理</title>
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/TrainingManage.js"></script>
</head>
<body>
	<table id="dg" title="" class="easyui-datagrid"
		style="width: 700px; height: 250px" fitColumns="true"
		rownumbers="true" fit="true" pagination="true" url="trainment"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th data-options="field:'trainID'" width="20">编号</th>
				<th data-options="field:'deparentName'" width="40">部门名称</th>
				<th data-options="field:'trainDate'" width="40">培训时间</th>
				<th data-options="field:'trainTime'" width="20">培训次数</th>
				<th data-options="field:'trainContent'" width="100">培训内容</th>
			</tr>
		</thead>
	</table>
	<div style="padding: 5px;" id="tb">
		<a href="javascript:openTrainingAddDialog()" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'" plain="true">添加</a> <a
			href="javascript:openTrainingModifyDialog()"
			class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
			plain="true">修改</a> <a href="javascript:deleteTraining()"
			class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
			plain="true">删除</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门名称：&nbsp;<input
			class="easyui-combobox" id="departmentName" name="departmentName"
			size="8" panelHeight="auto"
			data-options="editable:false,valueField:'departmentName',textField:'departmentName',url:'department!departmentComboList'" />
		<a href="javascript:searchDepartment()" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon-search'" plain="true">搜索</a>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px;" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>培训编号：</td>
					<td><input type="text" name="trainment.trainID" id="trainID"
						class="easyui-validatebox" required="true"></td>
				</tr>
				<tr>
					<td>部门名称：</td>
					<td><input class="easyui-combobox" id="deparentName"
						name="trainment.deparentName" panelHeight="auto"
						data-options="editable:false,valueField:'departmentName',textField:'departmentName',url:'department!departmentComboList'" />
					</td>
				</tr>
				<tr>
					<td>培训时间：</td>
					<td><input type="text" name="trainment.trainDate"
						id="trainDate" class="easyui-datebox" editable="false"
						required="true"></td>
				</tr>
				<tr>
					<td>培训次数：</td>
					<td><input type="text" name="trainment.trainTime"
						id="trainTime" class="easyui-validatebox" required="true"></td>
				</tr>
				<tr>
					<td valign="top">培训内容：</td>
					<td><textarea rows="7" cols="30" name="trainment.trainContent"
							id="trainContent"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveTraining()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeTrainingDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>