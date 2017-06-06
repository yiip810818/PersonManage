function resetValue() {
		document.getElementById("userName").value = "";
		document.getElementById("password").value = "";
		document.getElementById("repassword").value = "";
	}
	    
	$(function() {
		$.extend($.fn.validatebox.defaults.rules, {   
		       equals: {   
		            validator: function(value, param){   
		               return value == $(param[0]).val();   
		            },   
		           message: '两次输入密码不一致'  
		        }   
		    });
		
		$('#main').dialog({
			title : '登录',
			width : 400,
			height : 400,
			collapsible : true, //是否显示折叠按钮
			closable : false, //在会话框不显示关闭按钮
			modal : true
		//显示背景颜色效果
		});
	});