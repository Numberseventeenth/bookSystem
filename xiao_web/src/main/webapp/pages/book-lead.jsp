<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			图书excel表购入
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">图书管理</a></li>
			<li class="am-active">图书excel表购入</li>
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

			<div class="tpl-block">

				<div class="am-g">
					<div class="tpl-form-body tpl-form-line">
						<div class="am-form-group">
							<p><span class="label label-danger">提示:</span> 传文件时需要按照模板内容填写
							</p>
							<a href="${pageContext.request.contextPath}/download/bookLead.xls">点击下载模板文件</a>
						</div>
						<form class="am-form tpl-form-line-form" action="${pageContext.request.contextPath}/export/lead.do"
							  enctype="multipart/form-data" method="post">

							<div class="am-form-group">
								<label for="user-weibo" class="am-u-sm-3 am-form-label">上传excel文件 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<div class="am-form-group am-form-file">
										<div class="tpl-form-file-img">
											<img src="${pageContext.request.contextPath}/assets/img/a5.png" alt="">
										</div>
										<button type="button" class="am-btn am-btn-danger am-btn-sm">
											<i class="am-icon-cloud-upload"></i> 上传excel文件</button>
										<input id="doc-form-file" type="file"  name="excelFile">
									</div>

								</div>
							</div>



							<div style="height: 200px"></div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
									<button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success " onclick="history.back(-1);">返回</button>
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