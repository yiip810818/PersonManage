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
<!-- <script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script> -->
<title>人力资源管理系统登录</title>
<script type="text/javascript" src="js/index.js"></script>
<style type="text/css">
/*	body{
		font-size: 12px;
		margin:0;
		padding:0;
		width:100%
	}*/
 #main {
	background: url("./image/login.jpg") no-repeat;
	background-position: center;
	width: 100%;
	height: 650px;
	margin: 0 auto;
	position: relative;
	background-size:cover;
} 
/*form{
		margin:0 auto;
		position:absolute; 
		left:500px;
		top:300px;
	}
	#input{
	width:500px;
	height:200px;
	}
	.inp{
		width: 100px;
	}
	#error{
		padding:10px 0;
	}*/
</style>
</head>
<body>
	<div id="main">
		<form action="login" method="post">
			<table id="input" align="center" style="height: 150px;margin-left: 20px;margin-top: 350px">
				<tbody>
					<tr>
						<td><label>用户名：</label></td>
						<td><input type="username" value="" class="easyui-validatebox"
							required="true" name="user.userName" id="userName" /></td>
					</tr>
					<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
					<td><input type="password" value=""
						class="easyui-validatebox" required="true" name="user.password"
						id="password" /></td>
					</tr>
					</tr>
					<!-- <td>确认密码：</td>
					<td class="rename"><input type="password" value=""
						class="easyui-validatebox" required="true" name="user.repassword"
						id="repassword" validType="equals['#password']"/></td>
					</tr> -->
					<tr width="1000px">
						&nbsp;&nbsp;&nbsp;
						<td width="50px"><input type="submit" value="登录" /></td>
						<td><input type="button" value="重置" onclick="resetValue()" style="float: right" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td id="error"><font color="red">${error}</font></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>