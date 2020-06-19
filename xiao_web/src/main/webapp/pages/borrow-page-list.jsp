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
            我的图书借阅记录
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">我的</a></li>
			<li class="am-active">我的图书借阅记录</li>
		</ol>
		<div class="tpl-portlet-components">
<%--			<div class="portlet-title">--%>
<%--				<div class="caption font-green bold">--%>
<%--					<span class="am-icon-code"></span> 图书借阅列表--%>
<%--				</div>--%>
<%--				<div class="tpl-portlet-input tpl-fz-ml">--%>
<%--					<div class="portlet-input input-small input-inline">--%>
<%--						<d+
iv class="input-icon right">--%>
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
								<button id="flushBtn" onclick="location.href='${pageContext.request.contextPath}/advance/MyadvanceList.do'" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 刷新</button>
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
						<div class="am-input-group am-input-group-sm">
							<input type="text" class="am-form-field" id="queryValue" placeholder="用户名，电话，书名，isbn">
							<span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
          </span>
						</div>
					</div>
				</div>





				<div class="am-g">
					<div class="am-u-sm-12">
						<div id="queryDiv">

						</div>
						<form class="am-form">
                            <c:if test="${flag == 2}">
                                <table class="am-table am-table-striped am-table-hover table-main" id="dataList">
                                    <thead>
                                    <tr>
                                        <th class="table-title">用户名称</th>
                                        <th class="table-title">联系方式</th>
                                        <th class="table-type">借书时间</th>
                                        <th class="table-type">是否归还</th>
                                        <th class="table-author am-hide-sm-only">图书名称</th>
                                        <th class="table-type">图书isbn</th>
                                        <th class="table-type">借阅天数</th>
                                        <th class="table-type">应归还时间</th>
                                        <th class="table-type">归还时间</th>
                                        <th class="table-type">是否有损坏</th>
                                        <th class="table-type">是否丢失</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list}" var="borrow">
                                        <tr>
                                            <td>${borrow.user.username}</td>
                                            <td><a href="#">${borrow.user.phoneNum}</a></td>
                                            <td>${borrow.bStartStr }</td>
                                            <td>${borrow.bStatusStr}</td>
                                            <td class="am-hide-sm-only">${borrow.book.book_name}</td>
                                            <td>${borrow.book.book_isbn}</td>
                                            <td>${borrow.b_day}</td>
                                            <td>${borrow.bEndStr}</td>
                                            <td>${borrow.bBackStr}</td>
                                            <td>${borrow.b_ruin_intStr}</td>
                                            <td>${borrow.b_loseStr}</td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <div class="am-cf">

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
                                                <li><a href="${pageContext.request.contextPath}/borrow/findAll.do?page=1&flag=2&size=${pageInfo.pageSize}">首页</a></li>
                                                <li><a href="${pageContext.request.contextPath}/borrow/findAll.do?page=${pageInfo.pageNum-1}&flag=2&size=${pageInfo.pageSize}">上一页</a></li>
                                                    <%--										<li class="am-active"><a href="#">1</a></li>--%>
                                                <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                                    <li><a href="${pageContext.request.contextPath}/borrow/findAll.do?page=${pageNum}&flag=2&size=${pageInfo.pageSize}">${pageNum}</a></li>
                                                </c:forEach>
                                                <li><a href="${pageContext.request.contextPath}/borrow/findAll.do?page=${pageInfo.pageNum+1}&flag=2&size=${pageInfo.pageSize}">下一页</a></li>
                                                <li><a href="${pageContext.request.contextPath}/borrow/findAll.do?page=${pageInfo.pages}&flag=2&size=${pageInfo.pageSize}">尾页</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
							<c:if test="${flag == 1}">
                                <table class="am-table am-table-striped am-table-hover table-main" id="dataList">
                                    <thead>
                                    <tr>
                                        <th class="table-type">图书isbn</th>
                                        <th class="table-author am-hide-sm-only">图书名称</th>
                                        <th class="table-type">借书时间</th>
                                        <th class="table-type">借阅天数</th>
                                        <th class="table-type">续借天数</th>
                                        <th class="table-type">是否归还</th>
                                        <th class="table-type">归还时间</th>
                                        <th class="table-type">是否有损坏</th>
                                        <th class="table-type">损坏程度</th>
                                        <th class="table-type">是否丢失</th>
                                        <th class="table-type">损坏记录</th>
                                        <th class="table-type">赔偿记录</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${borrowList}" var="borrow">
                                        <tr>
                                            <td>${borrow.book.book_isbn}</td>
                                            <td class="am-hide-sm-only">${borrow.book.book_name}</td>
                                            <td>${borrow.bStartStr }</td>
                                            <td>${borrow.b_day}</td>
                                            <td>${borrow.b_renew}</td>
                                            <td>${borrow.bStatusStr}</td>
                                            <td>${borrow.bBackStr}</td>
                                            <td>${borrow.b_ruin_intStr}</td>
                                            <td>${borrow.b_ruin_level}</td>
                                            <td>${borrow.b_loseStr}</td>
                                            <td>${borrow.b_ruin}</td>
                                            <td>${borrow.b_compensate}</td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </c:if>

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
<script type="text/javascript">
	$(function() {
		$("#queryValue").keyup(function() {
			//2。 获取输入框的值
			//var word = $("#word").val();
			//this  对应就是执行这个方法的那个对象， $("#word")
			var queryValue = $(this).val();
			// alert("hahaha");

			if(queryValue == ""){
				$("#queryDiv").hide();
			}else{
				//3. 请求数据。
				$.post("http://localhost:81/xiao/borrow/query.do",{queryValue:queryValue} ,function(data , status){
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