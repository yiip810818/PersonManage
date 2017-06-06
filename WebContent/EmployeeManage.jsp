<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工管理</title>
 		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
		<style type="text/css">
			input{
				width:80px;
			}
		</style>
		<script type="text/javascript" src="js/EmployeeManage.js">
			
		</script>
</head>
<body>
	<table id="dg" title="" class="easyui-datagrid" style="width:700px;height:250px"
				fitColumns="true" rownumbers="true" fit="true" pagination="true" url="employee" toolbar="#tb" >
			<thead>
				<tr>
					<th field="cb" checkbox="true" ></th>
					<th data-options="field:'employeeId'" width="5" hidden="true">ID</th>
					<th data-options="field:'employeeNo'" width="10">编号</th>
					<th data-options="field:'name'" width="10">姓名</th>
					<th data-options="field:'sex'" width="10">性别</th>
					<th data-options="field:'birthday'" width="10">出生日期</th>
					<th data-options="field:'nationality'" width="10">民族</th>
					<th data-options="field:'education'" width="10">学历</th>
					<th data-options="field:'profession'" width="10">专业</th>
					<th data-options="field:'departmentName'" width="10">部门</th>
					<th data-options="field:'departmentId'" width="10" hidden="true">部门ID</th>
					<th data-options="field:'position'" width="10" >职务</th>
					<th data-options="field:'baseMoney'" width="10" hidden="true">基本工资</th>
					<th data-options="field:'overtime'" width="10" hidden="true">加班费</th>
					<th data-options="field:'age'" width="10" hidden="true">工龄工资</th>
					<th data-options="field:'check1'" width="10" hidden="true">考勤费</th>
					<th data-options="field:'absent'" width="10" hidden="true">旷工费</th>
					<th data-options="field:'safety'" width="10" hidden="true">保险费</th>
				</tr>
			</thead>
	</table>
	<div id="tb" >
		<div>
			<a href="javascript:openEmployeeAddDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">添加</a>
			<a href="javascript:openEmployeeModifyDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" plain="true">修改</a>
			<a href="javascript:deleteEmployee()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" plain="true">删除</a>
			<a href="javascript:exportEmployee()" class="easyui-linkbutton" data-options="iconCls:'icon-export'" plain="true">导出Execl</a>
		</div>
		<div>
			<form id="search" method="post" >
				&nbsp;编号:&nbsp;<input type="text" name="s_employeeNo" id="s_employeeNo" size="10" />
			    &nbsp;姓名:&nbsp;<input type="text" name="s_name" id="s_name" size="10" />
				&nbsp;性别:&nbsp;<select class="easyui-combobox" id="s_sex" name="s_sex" editable="false" panelHeight="auto" >
									<option value="" >请选择</option>
									<option value="男" >男</option>
									<option value="女" >女</option>
								</select>
				&nbsp;出生日期:&nbsp;<input type="text" class="easyui-datebox" name="s_bbirthday" id="s_bbirthday" size="11" editable="false" />
									<input type="text" class="easyui-datebox" name="s_ebirthday" id="s_ebirthday" size="11" editable="false" />
				&nbsp;民族:&nbsp;<input type="text" name="s_nationality" id="s_nationality" size="10" />
				&nbsp;学历:&nbsp;<input type="text" name="s_education" id="s_education" size="10" />		
				&nbsp;部门:&nbsp;<input class="easyui-combobox" id="s_departmentId" name="s_departmentId" size="8" panelHeight="auto" data-options="editable:false,valueField:'departmentId',textField:'departmentName',url:'department!departmentComboList'" />	
				&nbsp;职务:&nbsp;<input type="text" name="s_position" id="s_position" size="10" />				
				<a href="javascript:searchEmployee()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" plain="true">搜索</a>
			</form>
		</div>
		<br />
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:250px;padding:20px 10px 0;" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post" >
			<table>
				<tr>
					<td>&nbsp;编号:&nbsp;</td>
					<td><input type="text" name="employee.employeeNo" id="employeeNo" class="easyui-validatebox" required="true" ></td>
					<td></td>
					<td></td>
				</tr>			
				<tr>
					<td>&nbsp;姓名:&nbsp;</td>
					<td><input type="text" name="employee.name" id="name" class="easyui-validatebox" required="true" ></td>
					<td>&nbsp;性别:&nbsp;</td>
					<td><select class="easyui-combobox" name="employee.sex" id="sex"  editable="false" panelHeight="auto" style="width:85px;">
								<option value="" >请选择</option>
								<option value="男" >男</option>
								<option value="女" >女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>&nbsp;出生日期:&nbsp;</td>
					<td><input type="text" class="easyui-datebox" name="employee.birthday" id="birthday" editable="false" required="true" /></td>
					<td>&nbsp;民族:&nbsp;</td>
					<td><input type="text" name="employee.nationality" id="nationality" class="easyui-validatebox" required="true" ></td>
				</tr>
				<tr>
					<td>&nbsp;学历:&nbsp;</td>
					<td><input type="text" name="employee.education" id="education" class="easyui-validatebox" required="true" ></td>
					<td>&nbsp;专业:&nbsp;</td>
					<td><input type="text" name="employee.profession" id="profession" class="easyui-validatebox" required="true" ></td>
				</tr>
				<tr>
					<td>&nbsp;部门:&nbsp;</td>
					<td><input class="easyui-combobox" id="departmentId" name="employee.departmentId" size="8" panelHeight="auto" data-options="editable:false,valueField:'departmentId',textField:'departmentName',url:'department!departmentComboList'" /></td>
					<td>&nbsp;职务:&nbsp;</td>
					<td><input type="text" name="employee.position" id="position" class="easyui-validatebox" required="true" ></td>
				</tr>
				<tr>
					<input type="text" name="employee.baseMoney" id="baseMoney" class="easyui-validatebox" hidden="true">
					<input type="text" name="employee.overtime" id="overtime" class="easyui-validatebox" hidden="true" >
					<input type="text" name="employee.age" id="age" class="easyui-validatebox" hidden="true">
					<input type="text" name="employee.check1" id="check1" class="easyui-validatebox" hidden="true">
					<input type="text" name="employee.absent" id="absent" class="easyui-validatebox" hidden="true">
					<input type="text" name="employee.safety" id="safety" class="easyui-validatebox" hidden="true">
				</tr>
			</table>			
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveEmployee()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
		<a href="javascript:closeEmployeeDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
	</div>
</body>
</html>