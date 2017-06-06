var url;

function formatDatebox(value) {
	if (value == null || value == '') {
		return '';
	}
	var dt;
	if (value instanceof Date) {
		dt = value;
	} else {
		dt = new Date(value);
		if (isNaN(dt)) {
			value = value.replace(/\/Date(−?\d+)\//, '$1'); // 标红的这段是关键代码，将那个长字符串的日期值转换成正常的JS日期格式
			dt = new Date();
			dt.setTime(value);
		}
	}

	return dt.format("yy-MM-dd");
}
function searchPosition() {
	$('#dg').datagrid('load', {
		departmentname : $('#departmentName').combobox("getValue"),
		isLate : $('#isLate').combobox("getValue"),
	});
	

}
function deleteAttendment() {
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length == 0) {
		$.messager.alert("系统提示", "请选择要删除的数据！");
		return;
	}
	var strIds = [];
	for (var i = 0; i < selectedRows.length; i++) {
		strIds.push(selectedRows[i].attendId);
	}
	var ids = strIds.join(",");
	$.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length
			+ "</font>条数据吗？", function(r) {
		if (r) {
			$.post("attendment!delete", {
				delIds : ids
			}, function(result) {
				if (result.success) {
					$.messager.alert("系统提示", "您已成功删除<font color=red>"
							+ result.delNum + "</font>条数据!");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("系统提示", '<font color=red>'
							+ selectedRows[result.errorIndex].departmentName
							+ '</font>' + result.errorMsg);
				}
			}, "json");
		}
	});
}
function openAttendmentAddDialog() {
	$('#dlg').dialog('open').dialog("setTitle", "考勤信息");
	url = ("attendment!save");
}

function openAttendmentModifyDialog() {
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length != 1) {
		$.messager.alert("系统提示", "请选择一条要编辑的数据！");
		return;
	}
	var row = selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle", "编辑考勤信息");
	$("#attendId").val(row.attendId);
	$("#userName").val(row.userName);
	$("#offContent").val(row.offContent);
	$("#departmentName1").combobox("setValue", row.departmentName);
	$("#isOff").combobox("setValue", row.isOff);
	$("#isLate1").combobox("setValue", row.isLate);
	$('#workDate').datebox("setValue", row.workDate);
	$('#workoffDate').datebox("setValue", row.workoffDate);
	url = "attendment!save?id=" + row.attendId;
}

function closeDepartmentDialog() {
	$('#dlg').dialog("close");
	resetValue();
}

function resetValue() {
	$('#attendId').val("");
	$('#userName').val("");
	$('#departmentName1').combobox("setValue", "");
	$('#offContent').val("");
	$('#isLate1').combobox("setValue", "");
	$('#isOff').combobox("setValue", "");
	$('#workDate').datebox("setValue", "");
	$('#workoffDate').datebox("setValue", "");
}

function saveAttendment() {
	$('#fm').form("submit", {
		url : url,
		onSubmit : function() {
			return $(this).form("validate");
		},
		success : function(result) {
			if (result.errorMsg) {
				$.messager.alert("系统提示", result.errorMsg);
				return;
			} else {
				$.messager.alert("系统提示", "保存成功");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}
		}
	});
}