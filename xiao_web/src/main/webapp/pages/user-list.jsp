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
</head>

<body data-type="generalComponents">

<jsp:include page="header.jsp"></jsp:include>

<div class="tpl-page-container tpl-page-header-fixed">


	<jsp:include page="aside.jsp"></jsp:include>


	<div class="tpl-content-wrapper">
		<div class="tpl-content-page-title">
			用户信息列表
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">系统管理</a></li>
			<li class="am-active">用户管理</li>
		</ol>
		<div class="tpl-portlet-components">
<%--			<div class="portlet-title">--%>
<%--				<div class="caption font-green bold">--%>
<%--					<span class="am-icon-code"></span> 用户信息列表--%>
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
								<button onclick="location.href='${pageContext.request.contextPath}/user/findRole.do'" type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
								<button onclick="location.href='${pageContext.request.contextPath}/user/findAll.do?page=1&size=10'" type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 刷新</button>
								<button onclick="location.href='${pageContext.request.contextPath}/export/exportExcelByUser.do'" type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 导出excel</button>
<%--								<button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>--%>
							</div>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-3">
						<div class="am-form-group">
							<form name="queryId" action="${pageContext.request.contextPath}/user/selectUser.do" method="post">
								<select data-am-selected="{btnSize: 'sm'}" name="queryId">
									<option value="option1">所有类别</option>
									<c:forEach items="${roles}" var="role">
										<option value="${role.id}">${role.roleDesc}</option>
									</c:forEach>
									<option value="4">开启状态</option>
									<option value="5">关闭状态</option>
								</select>
								<button type="submit">查询</button>
							</form>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-3">
						<div class="am-input-group am-input-group-sm">
							<input id="queryValue" placeholder="用户名，电话号码，邮箱" name="queryValue"  type="text" class="am-form-field">
							<span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
          </span>
						</div>
					</div>
				</div>


<%--				<div id="queryDiv">--%>
<%--					&lt;%&ndash;								查询后的结果&ndash;%&gt;--%>
<%--				</div>--%>



				<div class="am-g">
					<div class="am-u-sm-12">
						<div id="queryDiv">
							<%--								查询后的结果--%>
						</div>
						<form class="am-form">
							<table class="am-table am-table-striped am-table-hover table-main">
								<thead>
								<tr>
									<th class="table-check"><input type="checkbox" class="tpl-table-fz-check"></th>
									<th class="table-id" style="display: none">ID</th>
									<th class="table-title">用户名</th>
									<th class="table-type">邮箱</th>
									<th class="table-type">状态</th>
									<th class="table-type">角色</th>
									<th class="table-author am-hide-sm-only">联系电话</th>
<%--									<th class="table-date am-hide-sm-only">修改日期</th>--%>
									<th class="table-set">操作</th>
								</tr>
								</thead>
								<tbody>
									<c:forEach items="${pageInfo.list}" var="user">
										<tr>
											<td><input type="checkbox"></td>
											<td style="display: none">${user.id }</td>
											<td><a href="#">${user.username }</a></td>
											<td>${user.email }</td>
											<td>${user.statusStr }</td>
											<td class="am-hide-sm-only">
												<c:forEach items="${user.roles}" var="role">
													${role.roleDesc}
												</c:forEach>
											</td>
											<td class="am-hide-sm-only">${user.phoneNum }</td>
											<td>
												<div class="am-btn-toolbar">
													<div class="am-btn-group am-btn-group-xs">
														<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/findById.do?id=${user.id}'" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 详情</button>
														<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/findUserByIdAndAllRole.do?id=${user.id}'" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 添加角色</button>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="am-cf">

								<div class="form-group form-inline">
									总共${pageInfo.pages} 页，共${pageInfo.total} 条数据。 每页
<%--									<select class="form-control" id="changePageSize" onchange="changePageSize()">--%>
<%--										<option>1</option>--%>
<%--										<option>2</option>--%>
<%--										<option>3</option>--%>
<%--										<option>4</option>--%>
<%--										<option>5</option>--%>
<%--										<option>${pageInfo.total}</option>--%>
<%--									</select> 条--%>
								</div>

								<div class="am-fr">
									<ul class="am-pagination tpl-pagination">
										<li><a href="${pageContext.request.contextPath}/user/findAll.do?page=1&size=${pageInfo.pageSize}">首页</a></li>
										<li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
<%--										<li class="am-active"><a href="#">1</a></li>--%>
										<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
											<li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
										</c:forEach>
										<li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
										<li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a></li>
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
<script>
	function changePageSize() {
		//获取下拉框的值
		var pageSize = $("#changePageSize").val();

		//向服务器发送请求，改变没页显示条数
		location.href = "${pageContext.request.contextPath}/user/findAll.do?page=1&size="
				+ pageSize;
	}


	$(function() {
		$("#queryValue").keyup(function() {
			//2。 获取输入框的值
			//var word = $("#word").val();
			//this  对应就是执行这个方法的那个对象， $("#word")
			var queryValue = $(this).val();
			// alert("hahaha")

			if(queryValue == ""){
				$("#queryDiv").hide();
			}else{
				//3. 请求数据。
				$.post("http://localhost:81/xiao/user/queryUserNameAndPhoneAndEmail.do",{queryValue:queryValue} ,function(data , status){
					// alert(data);
					$("#queryDiv").show();
					$("#queryDiv").html(data);
				});
			}
		})
	});
</script>
</body>

</html>