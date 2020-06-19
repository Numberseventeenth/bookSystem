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
			个人资料
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">我的</a></li>
			<li class="am-active">个人资料</li>
		</ol>
		<div class="tpl-portlet-components">
			<div class="portlet-title">
				<div class="caption font-green bold">
					<span class="am-icon-code"></span> 个人资料表单
				</div>
<%--				<div class="tpl-portlet-input tpl-fz-ml">--%>
<%--					<div class="portlet-input input-small input-inline">--%>
<%--						<div class="input-icon right">--%>
<%--							<i class="am-icon-search"></i>--%>
<%--							<input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>--%>
<%--					</div>--%>
<%--				</div>--%>


			</div>

			<div class="tpl-block">

				<div class="am-g">
					<div class="tpl-form-body tpl-form-line">
						<form class="am-form tpl-form-line-form" action="${pageContext.request.contextPath}/user/updateUser.do?flag=1"
							  enctype="multipart/form-data" method="post">
                            <input hidden name="flag" value="1">
							<input type="text" name="id" style="display: none" value="${user.id}">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">用户名 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<input name="username" value="${user.username}"" type="text" class="tpl-form-input" >
									<%--                                    <small>请填写标题文字10-20字左右。(必填项)</small>--%>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">邮箱 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<input name="email" value="${user.email}" type="text" class="tpl-form-input" >
									<%--                                    <small>请填写标题文字10-20字左右。（必填项）</small>--%>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">创建时间 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<input readonly value="${user.createTimeStr}" type="text" class="tpl-form-input"  >
									<%--                                    <small>请填写标题文字10-20字左右。（必填项）</small>--%>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">联系电话 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<input name="phoneNum" value="${user.phoneNum}" type="text" class="tpl-form-input" >
									<%--                                    <small>请填写标题文字10-20字左右。（必填项）</small>--%>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">距现在已 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<input readonly value="${days}天" type="text" class="tpl-form-input" >
									<%--                                    <small>请填写标题文字10-20字左右。(必填项)</small>--%>
								</div>
							</div>
                            <input value="${user.status}" name="status" hidden>
                            <div hidden>
                                <select hidden name="roleId">
                                    <c:forEach items="${user.roles}" var="role">
                                        <option hidden value="${role.id}" selected="selected">${role.roleDesc}</option>
                                    </c:forEach>
                                </select>
                            </div>

							<c:if test="${flag != 1}">
								<div class="am-form-group">
									<label for="user-phone" class="am-u-sm-3 am-form-label">用户状态 <span class="tpl-form-line-small-title">Author</span></label>
									<div class="am-u-sm-9">
										<select data-am-selected="{searchBox: 1}" name="status">
											<option value="${user.status}" selected="selected">${user.statusStr}</option>
											<c:choose>
												<c:when test="${user.status == 1}">
													<option value="0">关闭</option>
												</c:when>
												<c:otherwise>
													<option value="1">开启</option>
												</c:otherwise>
											</c:choose>
										</select>
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-u-sm-3 am-form-label">用户角色 <span class="tpl-form-line-small-title">Author</span></label>
									<div class="am-u-sm-9">
										<select data-am-selected="{searchBox: 1}" name="roleId">
											<c:forEach items="${user.roles}" var="role">
												<option value="${role.id}" selected="selected">${role.roleDesc}</option>
												<c:choose>
													<c:when test="${role.id == 1}">
														<option value="2">普通用户</option>
<%--														<option value="3">超级管理员</option>--%>
													</c:when>
													<c:when test="${role.id == 2}">
														<option value="1">管理员</option>
<%--														<option value="3">超级管理员</option>--%>
													</c:when>
													<c:otherwise>
														<option value="1">管理员</option>
														<option value="2">普通用户</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>
							</c:if>

							<div class="am-form-group">
								<label for="user-weibo" class="am-u-sm-3 am-form-label">用户头像 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<div class="am-form-group am-form-file">
										<div class="tpl-form-file-img">
											<c:if test="${user.img !=null}">
												<img src="/pic/user/${user.img}"/>
												<br/>
											</c:if>
										</div>
										<input name="img" value="${user.img}" hidden>
										<button type="button" class="am-btn am-btn-danger am-btn-sm">
											<i class="am-icon-cloud-upload"></i> 添加头像</button>
										<input id="doc-form-file" type="file"  name="pictureFile">
									</div>

								</div>
							</div>




							<div style="height: 200px"></div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">修改</button>
									<c:choose>
										<c:when test="${flag == null }">
											<button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success "
													onclick="location.href='${pageContext.request.contextPath}/user/findAll.do?page=1&size=10'">返回</button>

										</c:when>
										<c:otherwise>
											<button onclick="history.back(-1);" type="button" class="am-btn am-btn-primary">返回</button>
										</c:otherwise>
									</c:choose>
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