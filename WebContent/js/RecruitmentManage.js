var url;
function searchPosition() {
	$('#dg').datagrid('load', {
		positionName : $('#positionName').val()
	});
}
function deleteRecruitment() {
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length == 0) {
		$.messager.alert("系统提示", "请选择要删除的数据！");
		return;
	}
	var strIds = [];
	for (var i = 0; i < selectedRows.length; i++) {
		strIds.push(selectedRows[i].tableid);
	}
	var ids = strIds.join(",");
	$.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length
			+ "</font>条数据吗？", function(r) {
		if (r) {
			$.post("recruitment!delete", {
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
function openRecruitmentAddDialog() {
	$('#dlg').dialog('open').dialog("setTitle", "招聘信息");
	url = ("recruitment!save");
}

function openRecruitmentEditDialog() {
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length != 1) {
		$.messager.alert("系统提示", "请选择一条要编辑的数据！");
		return;
	}
	var row = selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle", "编辑招聘信息");
	$("#tableid").val(row.tableid);
	$("#positionName1").val(row.positionName);
	$("#workYears").val(row.workYears);
	$("#positionRemark").val(row.positionRemark);
	url = "recruitment!save?id=" + row.tableid;
}

function closeDepartmentDialog() {
	$('#dlg').dialog("close");
	resetValue();
}

function resetValue() {
	$('#tableid').val("");
	$('#positionName1').val("");
	$('#workYears').val("");
	$('#positionRemark').val("");
}

function saveRecruitment() {
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