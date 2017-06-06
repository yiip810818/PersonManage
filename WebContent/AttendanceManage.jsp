<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考勤管理</title>
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/AttendanceManage.js"></script>
</head>
<body>
	<!-- datagrid指表格屬性 
	pagination显示底部分页功能 
	fitColumns自动扩大或缩小列的大小自动适应界面-->
	<table id="dg" title="" class="easyui-datagrid"
		style="width: 700px; height: 250px" fitColumns="true"
		rownumbers="true" fit="true" pagination="true" url="attendment"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th data-options="field:'attendId'" width="20">编号</th>
				<th data-options="field:'userName'" width="40">姓名</th>
				<th data-options="field:'departmentName'" width="40">部门</th>
				<th data-options="field:'workDate' formatter : formatDatebox" width="60">上班时间</th>
				<th data-options="field:'workoffDate'" width="40">下班时间</th>
				<th data-options="field:'isLate'" width="40">是否迟到</th>
				<th data-options="field:'isOff'" width="40">是否请假</th>
				<th data-options="field:'offContent'" width="40">出差情况</th>
			</tr>
		</thead>
	</table>
	<div style="padding: 5px;" id="tb">
		<a href="javascript:openAttendmentAddDialog()"
			class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			plain="true">添加</a> <a href="javascript:openAttendmentModifyDialog()"
			class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
			plain="true">修改</a> <a href="javascript:deleteAttendment()"
			class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
			plain="true">删除</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门名称：&nbsp;<input
			class="easyui-combobox" id="departmentName" name="departmentName"
			size="8" panelHeight="auto"
			data-options="editable:false,valueField:'departmentName',textField:'departmentName',url:'department!departmentComboList'" />
		&nbsp;&nbsp;是否迟到：&nbsp;<select class="easyui-combobox" id="isLate"
			name="isLate" editable="false" panelHeight="auto">
			<option value="">请选择</option>
			<option value="是">是</option>
			<option value="否">否</option>
		</select> <a href="javascript:searchPosition()" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon-search'" plain="true">搜索</a>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 500px; height: 300px; padding: 20px 10px 0;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>&nbsp;考勤编号:</td>
					<td><input type="text" name="attendment.attendId"
						id="attendId" class="easyui-validatebox" required="true"></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;员工姓名:</td>
					<td><input type="text" name="attendment.userName"
						id="userName" class="easyui-validatebox" required="true">
					</td>
					<td>&nbsp;员工部门:</td>
					<td><input class="easyui-combobox" id="departmentName1"
						name="attendment.departmentName" panelHeight="auto"
						data-options="editable:false,valueField:'departmentName',textField:'departmentName',url:'department!departmentComboList'" /></td>
					</td>
				</tr>
				<tr>
					<td>&nbsp;上班时间:</td>
					<td><input type="text" class="easyui-datetimebox"
						name="attendment.workDate" id="workDate" editable="true"
						required="true" /></td>
					<td>&nbsp;下班时间:</td>
					<td><input type="text" name="attendment.workoffDate"
						id="workoffDate" class="easyui-datetimebox"
						data-options="required:true,showSeconds:true" required="true"></td>
				</tr>
				<tr>
					<td>&nbsp;是否迟到:</td>
					<td><select class="easyui-combobox" id="isLate1"
						name="attendment.isLate" editable="false" panelHeight="auto"
						style="width: 153px">
							<option value="">请选择</option>
							<option value="是">是</option>
							<option value="否">否</option>
					</select>
					<td>&nbsp;是否请假:</td>
					<td><select class="easyui-combobox" id="isOff"
						name="attendment.isOff" editable="false" panelHeight="auto"
						style="width: 153px">
							<option value="">请选择</option>
							<option value="是">是</option>
							<option value="否">否</option>
					</select></td>
				</tr>
				<tr>
					<td>&nbsp;出差情况:</td>
					<td><textarea rows="4" name="attendment.offContent"
							id="offContent"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveAttendment()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeDepartmentDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>