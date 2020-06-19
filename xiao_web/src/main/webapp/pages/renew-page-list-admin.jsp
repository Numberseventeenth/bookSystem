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
			待审核续借图书
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">通知</a></li>
			<li class="am-active">列表</li>
		</ol>
		<div class="tpl-portlet-components">
			<div class="portlet-title">
				<c:if test="${renews.size() == 0}">
					<div class="caption font-green bold">
						<span class="am-icon-code" style="color: red"></span> 暂无待审核的借阅用户
					</div>
				</c:if>

<%--				<div class="tpls-portlet-input tpl-fz-ml">--%>
<%--					<div class="portlet-input input-small input-inline">--%>
<%--						<div class="input-icon right">--%>
<%--							<i class="am-icon-search"></i>--%>
<%--							<input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>--%>
<%--					</div>--%>
<%--				</div>--%>


			</div>
			<div class="tpl-block">
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-6">
						<div class="am-btn-toolbar">
							<div class="am-btn-group am-btn-group-xs">
								<button id="flushBtn" onclick="location.href='${pageContext.request.contextPath}/borrow/myReNewList.do'" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 刷新</button>
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
					<div class="am-u-sm-12 am-u-md-3">
<%--						<div class="am-input-group am-input-group-sm">--%>
<%--							<input type="text" class="am-form-field" id="queryValue" placeholder="用户名，电话，书名，isbn">--%>
<%--							<span class="am-input-group-btn">--%>
<%--            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>--%>
<%--          </span>--%>
<%--						</div>--%>
					</div>
				</div>





				<div class="am-g">
					<div class="am-u-sm-12">

						<c:if test="${renews.size() != 0}">
							<form class="am-form">
								<table class="am-table am-table-striped am-table-hover table-main" id="dataList">
									<thead>
									<tr>
										<th class="table-type">续借用户名称</th>
										<th class="table-type">联系方式</th>
										<th class="table-type">用户状态</th>
										<th class="table-title">ISBN</th>
										<th class="table-title">图书名称</th>
										<th class="table-title">作者</th>
										<th class="table-title">是否上架</th>
										<th class="table-title">库存</th>
										<th class="table-title">剩余</th>
										<th class="table-title">续借时间</th>
										<th class="table-title">续借天数</th>
										<th class="table-author am-hide-sm-only">审核进度</th>
										<th class="table-set">操作</th>

									</tr>
									</thead>
									<tbody>
									<c:forEach items="${renews}" var="renew">
										<tr>
											<input id="userid" value="${renew.userid}" hidden>
											<input id="book_isbn" value="${renew.book_isbn}" hidden>
											<input id="renew" value="${renew.renew}" hidden>
											<td><a href="#">${renew.user.username}</a></td>
											<td>${renew.user.phoneNum}</td>
											<td>${renew.user.statusStr}</td>
											<td class="am-hide-sm-only">${renew.book_isbn}</td>
											<td>${renew.book.book_name}</td>
											<td>${renew.book.book_author}</td>
											<td>${renew.book.outStr}</td>
											<td>${renew.book.book_count}</td>
											<td>${renew.book.book_count - renew.book.book_borrow}</td>
											<td class="am-hide-sm-only">${renew.createTimeStr}</td>
											<td>${renew.renew}</td>
											<td>${renew.statusStr}</td>
											<td>
												<div class="am-btn-toolbar">
													<div id="btn" class="am-btn-group am-btn-group-xs">
														<button value="0" type="button"  class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 审核通过</button>
														<button value="1" type="button"  class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 审核失败</button>

													</div>
												</div>
											</td>
										</tr>
									</c:forEach>

									</tbody>
								</table>




								<div class="am-cf">


								</div>
								<hr>
							</form>
						</c:if>

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
	$("#btn button").click(function () {
		var userid = $("#userid").val();
		var book_isbn = $("#book_isbn").val();
		//0-通过，1-失败
		var status = $(this).val();
		var renew = $("#renew").val();
		$.post("http://localhost:81/xiao/borrow/checkReNew.do",
				{userid:userid,
					book_isbn:book_isbn,
					status:status,
					renew:renew},
				function(data,status){
					if(data == 0){
						swal("服务器出现异常！", "","error");
					}else if(data == 1){
						swal("审核成功，该用户成功续借", "","success");
					}
				});
		// $("#flushBtn").trigger("click");
		return false;
	})
</script>
</body>

</html>