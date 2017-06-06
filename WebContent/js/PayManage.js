var url;
			function searchEmployee(){
				$('#dg').datagrid('load',{
					s_employeeNo:$('#s_employeeNo').val(),
					s_name:$('#s_name').val(),									
				});				
			}
			
			function openEmployeeAddDialog(){
				$('#dlg').dialog('open').dialog("setTitle","员工信息");
				resetValue();
				url=("employee!save");
			}
			
			function openEmployeeModifyDialog(){
				var selectedRows=$("#dg").datagrid('getSelections');
				if(selectedRows.length!=1){
					$.messager.alert("系统提示","请选择一条要编辑的数据！");
					return;
				}
				var row=selectedRows[0];
				$("#dlg").dialog("open").dialog("setTitle","编辑员工信息");
				$("#employeeNo").val(row.employeeNo);
				$("#name").val(row.name);
				$("#sex").combobox("setValue",row.sex);
				$('#birthday').datebox("setValue",row.birthday);
				$("#departmentId").combobox("setValue",row.departmentId);
				$("#nationality").val(row.nationality);
				$("#education").val(row.education);
				$("#profession").val(row.profession);
				$("#position").val(row.position);
				$("#baseMoney").val(row.baseMoney);
				$("#overtime").val(row.overtime);
				$("#age").val(row.age);
				$("#check1").val(row.check1);
				$("#absent").val(row.absent);
				$("#safety").val(row.safety);
				url="employee!save?employeeId="+row.employeeId;
			}
			
			function closeEmployeeDialog(){
				$('#dlg').dialog("close");
				resetValue();
			}
			
			function resetValue(){
				$('#employeeNo').val("");
				$('#name').val("");
				$('#sex').combobox("setValue","");
				$('#bbirthday').datebox("setValue","");
				$('#departmentId').combobox("setValue","");
				$('#nationality').val("");
				$('#education').val("");
				$('#profession').val("");
				$('#position').val("");
				$("#baseMoney").val("");
				$("#overtime").val("");
				$("#age").val("");
				$("#check1").val("");
				$("#absent").val("");
				$("#safety").val("");
			}
			
			function saveEmployee(){
				$('#fm').form("submit",{
					url:url,
					onSubmit:function(){
						return $(this).form("validate");
					},
					success:function(result){
						if(result.errorMsg){
							$.messager.alert("系统提示",result.errorMsg);
							return;
						}else{
							$.messager.alert("系统提示","保存成功");
							resetValue();
							$("#dlg").dialog("close");
							$("#dg").datagrid("reload");
						}
					}
				});
			}