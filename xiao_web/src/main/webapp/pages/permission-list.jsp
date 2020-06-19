<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<body data-type="generalComponents">


<jsp:include page="header.jsp"></jsp:include>







<div class="tpl-page-container tpl-page-header-fixed">


	<jsp:include page="aside.jsp"></jsp:include>





	<div class="tpl-content-wrapper">
		<div class="tpl-content-page-title">
			资源权限列表
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="${pageContext.request.contextPath}/permission/findAll.do">资源权限管理</a></li>
			<li class="am-active">资源权限列表</li>
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
								<button onclick="location.href='${pageContext.request.contextPath}/pages/permission-add.jsp'" type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
								<button id="flushBtn" onclick="location.href='${pageContext.request.contextPath}/permission/findAll.do'" type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 刷新</button>
							</div>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-3">
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
					</div>
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
									<th class="table-title">权限名称</th>
									<th class="table-type">URL</th>
									<th class="table-set">操作</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${permissionList}" var="p">
									<tr>
										<td><input type="checkbox"></td>
										<td>${p.id }</td>
										<td><a href="#">${p.permissionName }</a></td>
										<td>${p.url }</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<button type="button" onclick="location.href='${pageContext.request.contextPath}/permission/findById.do?id=${p.id}'" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 详情</button>
													<span id="test">

														<button value="${p.id}" type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-pencil-square-o"></span> 删除</button>
													</span>
<%--													<button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">--%>
<%--														<span class="am-icon-trash-o" id="text">--%>
<%--															<a id="permission" href="${pageContext.request.contextPath}/permission/deletePermission.do?id=${p.id}">删除权限</a>--%>
<%--														</span>--%>
<%--													</button>--%>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>

								</tbody>
							</table>
<%--							<div class="am-cf">--%>

<%--								<div class="am-fr">--%>
<%--									<ul class="am-pagination tpl-pagination">--%>
<%--										<li class="am-disabled"><a href="#">«</a></li>--%>
<%--										<li class="am-active"><a href="#">1</a></li>--%>
<%--										<li><a href="#">2</a></li>--%>
<%--										<li><a href="#">3</a></li>--%>
<%--										<li><a href="#">4</a></li>--%>
<%--										<li><a href="#">5</a></li>--%>
<%--										<li><a href="#">»</a></li>--%>
<%--									</ul>--%>
<%--								</div>--%>
<%--							</div>--%>
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
<script src="${pageContext.request.contextPath}/assets/js/sweetalert-dev.js"></script>
<script type="text/javascript">
	$("#test button").click(function(){
		var id = $(this).val();
		// if(confirm("确定要删除吗?")){
		// 	$.ajax({
		// 		type:'get',
		// 		url:$(this).attr('href'),
		//
		// 		success:function(result){
		// 			if(result == 0){
		// 				alert("删除成功")
		// 			}else {
		// 				alert("删除失败，有角色用到权限")
		// 			}
		// 			$("#flushBtn").trigger("click");
		// 		}
		// 	});
		// }

		swal({
			title: "确定删除吗？",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "确定删除！",
			closeOnConfirm: false
		},
		function(){
			console.log("进入ajax");
			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/permission/deletePermission.do?id=' + id,

				success:function(result){
					console.log("接收到返回消息" + result);
					if(result == 0){
						swal("删除！", "该角色已被删除。", "success");
					}else {
						swal("删除失败！", "有用户使用到给角色。", "error");
					}
					// $("#flushBtn").trigger("click");
				}
			});
		});
		return false;
	});
</script>

</body>

</html>