<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			日志信息列表
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">系统管理</a></li>
			<li class="am-active">日志信息列表</li>
		</ol>
		<div class="tpl-portlet-components">
<%--			<div class="portlet-title">--%>
<%--				<div class="caption font-green bold">--%>
<%--					<span class="am-icon-code"></span> 列表--%>
<%--				</div>--%>
<%--				<div class="tpl-portlet-input tpl-fz-ml">--%>
<%--					<div class="portlet-input input-small input-inline">--%>
<%--						<div class="input-icon right">--%>
<%--							<i class="am-icon-search"></i>--%>
<%--							<input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>--%>
<%--					</div>--%>
<%--				</div>--%>


<%--			</div>--%>
			<div class="tpl-block">
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-6">
						<div class="am-btn-toolbar">
							<div class="am-btn-group am-btn-group-xs">
								<button onclick="location.href='${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size=30'" type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 刷新</button>
							</div>
						</div>
					</div>
<%--					<div class="am-u-sm-12 am-u-md-3">--%>
<%--						<div class="am-form-group">--%>
<%--							<select data-am-selected="{btnSize: 'sm'}">--%>
<%--								<option value="option1">所有类别</option>--%>
<%--								<option value="option2">IT业界</option>--%>
<%--								<option value="option3">数码产品</option>--%>
<%--								<option value="option3">笔记本电脑</option>--%>
<%--								<option value="option3">平板电脑</option>--%>
<%--								<option value="option3">只能手机</option>--%>
<%--								<option value="option3">超极本</option>--%>
<%--							</select>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--					<div class="am-u-sm-12 am-u-md-3">--%>
<%--						<div class="am-input-group am-input-group-sm">--%>
<%--							<input type="text" class="am-form-field">--%>
<%--							<span class="am-input-group-btn">--%>
<%--            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>--%>
<%--          </span>--%>
<%--						</div>--%>
<%--					</div>--%>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table class="am-table am-table-striped am-table-hover table-main">
								<thead>
								<tr>
									<th class="table-check"><input type="checkbox" class="tpl-table-fz-check"></th>
									<th class="table-id">ID</th>
									<th class="table-date am-hide-sm-only">访问时间</th>
									<th class="table-type">访问用户</th>
									<th class="table-title">访问IP</th>
									<th class="table-type">资源URL</th>
									<th class="table-date am-hide-sm-only">执行时间</th>
									<th class="table-set">访问方法</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${pageInfo.list}" var="syslog">
									<tr>
										<td><input type="checkbox"></td>
										<td>${syslog.id}</td>
										<td><a href="#">${syslog.visitTimeStr }</a></td>
										<td>${syslog.username }</td>
										<td>${syslog.ip }</td>
										<td>${syslog.url}</td>
										<td>${syslog.executionTime}毫秒</td>
										<td>${syslog.method}</td>
									</tr>
								</c:forEach>

								</tbody>
							</table>
							<div class="am-cf">

								<div class="am-fr">
									<ul class="am-pagination tpl-pagination">
										<li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size=${pageInfo.pageSize}">首页</a></li>
										<li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
										<%--										<li class="am-active"><a href="#">1</a></li>--%>
										<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum" step="10">
											<li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
										</c:forEach>
										<li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
										<li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a></li>
									</ul>
								</div>
							</div>
							<hr>

						</form>
					</div>

				</div>
			</div>
			<div class="tpl-alert"></div>
		</div>










	</div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>

</html>