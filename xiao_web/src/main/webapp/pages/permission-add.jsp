<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
</head>

<body data-type="generalComponents">


<jsp:include page="header.jsp"></jsp:include>







<div class="tpl-page-container tpl-page-header-fixed">
	<jsp:include page="aside.jsp"></jsp:include>





	<div class="tpl-content-wrapper">
		<div class="tpl-content-page-title">
			新增资源权限
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="${pageContext.request.contextPath}/permission/findAll.do">资源权限管理</a></li>
			<li class="am-active">新增资源权限</li>
		</ol>
		<div class="tpl-portlet-components">
<%--			<div class="portlet-title">--%>
<%--				<div class="caption font-green bold">--%>
<%--					<span class="am-icon-code"></span> 表单--%>
<%--				</div>--%>
<%--				<div class="tpl-portlet-input tpl-fz-ml">--%>
<%--					<div class="portlet-input input-small input-inline">--%>
<%--						<div class="input-icon right">--%>
<%--							<i class="am-icon-search"></i>--%>
<%--							<input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>--%>
<%--					</div>--%>
<%--				</div>--%>


<%--			</div>--%>
			<div class="tpl-block ">

				<div class="am-g tpl-amazeui-form">


					<div class="am-u-sm-12 am-u-md-9">
						<form class="am-form am-form-horizontal" action="${pageContext.request.contextPath}/permission/save.do"
							  method="post">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">权限名称</label>
								<div class="am-u-sm-9">
									<input type="text" name="permissionName" placeholder="权限名称">
									<%--									<small>角色名称</small>--%>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">RUL</label>
								<div class="am-u-sm-9">
									<input type="text" name="url" placeholder="RUL">
									<%--									<small>角色描述</small>--%>
								</div>
							</div>


							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<button type="submit" class="am-btn am-btn-primary">保存</button>
									<button onclick="history.back(-1);" type="button" class="am-btn am-btn-primary">返回</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>










	</div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>

</html>