<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%--<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--	alert("登录失败");--%>
<%--</script>--%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>图书管理系统</title>
	<meta name="description" content="这是一个 index 页面">
	<meta name="keywords" content="index">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sweetalert.css">
</head>

<body data-type="login">

<div class="am-g myapp-login">
	<div class="myapp-login-logo-block  tpl-login-max">
		<div class="myapp-login-logo-text">
			<div class="myapp-login-logo-text">
				图书管理系统<span> Login</span> <i class="am-icon-skyatlas"></i>

			</div>
		</div>

<%--		<div class="login-font">--%>
<%--			<i id="logina"><a style="color: #53d192">Log In</a> </i> or <span id="registera"><a style="color: white">Sign Up</a> </span>--%>
<%--		</div>--%>
<%--		<div  class="am-u-sm-10 login-am-center">--%>
<%--			<form id="login" class="am-form" action="${pageContext.request.contextPath}/login.do" method="post">--%>
<%--				<span style="color: white">${status}</span>--%>
<%--				<fieldset >--%>
<%--					<div class="am-form-group">--%>
<%--						<input name="username" type="text"  class="" id="doc-ipt-email-1" placeholder="输入用户名">--%>
<%--					</div>--%>
<%--					<div class="am-form-group">--%>
<%--						<input name="password" type="password" class="" id="doc-ipt-pwd-1" placeholder="输入密码">--%>
<%--					</div>--%>
<%--					<p><button type="submit" class="am-btn am-btn-default">登录</button></p>--%>
<%--				</fieldset>--%>
<%--			</form>--%>
<%--			<form id="register" hidden class="am-form" action="${pageContext.request.contextPath}/user/save.do" method="post">--%>
<%--				<fieldset >--%>
<%--					<input name="roleId" value="2" hidden>--%>
<%--					<input name="status" value="1" hidden>--%>
<%--					&lt;%&ndash;					表示注册   1   &ndash;%&gt;--%>
<%--					<input name="flag" value="1" hidden>--%>
<%--					<div class="am-form-group">--%>
<%--						<input id="usernameInput" name="username" type="text"  class=""  placeholder="输入用户名"><span id="tishi" style="color: white"></span>--%>
<%--					</div>--%>
<%--					<div class="am-form-group">--%>
<%--						<input name="password" type="password" class=""  placeholder="输入密码">--%>
<%--					</div>--%>
<%--					<div class="am-form-group">--%>
<%--						<input name="rePassword" type="password" class=""  placeholder="再次输入密码">--%>
<%--					</div>--%>
<%--					<div class="am-form-group">--%>
<%--						<input name="email" type="text"  class=""  placeholder="邮箱">--%>
<%--					</div>--%>
<%--					<div class="am-form-group">--%>
<%--						<input name="phoneNum" type="text"  class=""  placeholder="联系方式">--%>
<%--					</div>--%>
<%--					<p><button type="submit" class="am-btn am-btn-default">注册</button></p>--%>
<%--				</fieldset>--%>
<%--			</form>--%>
<%--		</div>--%>
	</div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sweetalert-dev.js"></script>
<script type="text/javascript">
	swal("登录失败", "用户名或者密码有误","error");
</script>
</body>

</html>



