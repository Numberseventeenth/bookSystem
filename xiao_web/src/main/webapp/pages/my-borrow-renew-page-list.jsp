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
			续借图书
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">我的</a></li>
			<li class="am-active">续借图书</li>
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
								<button id="flushBtn" onclick="location.href='${pageContext.request.contextPath}/borrow/findAll.do?page=1&size=10'" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 刷新</button>
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
<%--							<input type="text" class="am-form-field" id="queryValue" placeholder="用户名，电话，书名，isbn">--%>
<%--							<span class="am-input-group-btn">--%>
<%--            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>--%>
<%--          </span>--%>
<%--						</div>--%>
<%--					</div>--%>
				</div>





				<div class="am-g">
					<div class="am-u-sm-12">
						<div id="queryDiv">

						</div>
<%--						<form class="am-form">--%>
                            <c:if test="${users.size() != 0}">
                                <table  class="am-table am-table-striped am-table-hover table-main" >
                                    <thead>
                                    <tr>
                                        <th class="table-title">用户名</th>
                                        <th class="table-type">邮箱</th>
                                        <th class="table-type">状态</th>
                                        <th class="table-type">联系电话</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${users}" var="user">
                                        <tr>
                                            <input id="user_id" type="text" hidden value="${user.id}">
                                            <td><a href="#">${user.username }</a></td>
                                            <td>${user.email }</td>
                                            <td>${user.statusStr }</td>
                                            <td>${user.phoneNum }</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <table id="dataList" class="am-table am-table-striped am-table-hover table-main" >
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th class="table-title">图书封面</th>
                                        <th class="table-title">ISBN</th>
                                        <th class="table-title">图书名称</th>
                                        <th class="table-type">归还状态</th>
                                        <th class="table-type">归还时间</th>
                                        <th class="table-type">已经续借天数</th>
                                        <th class="table-type">图书毁坏记录</th>
                                        <th class="table-type">丢失状态</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${users}" var="user">
                                        <c:forEach items="${user.borrows}" var="borrow">
                                            <c:if test="${borrow.b_status != 0}">
                                                <tr>
                                                    <input id="book_isbn" type="text" hidden value="${borrow.book.book_isbn}">
                                                    <td><input type="checkbox" name="bookIds" value="${borrow.book.book_isbn}"></td>
                                                    <td>
                                                        <c:if test="${book.book_img != null}">
                                                            <img src="/pic/book/${book.book_img}"/>
                                                            <br/>
                                                        </c:if>
                                                    </td>
                                                    <td>${borrow.book.book_isbn}</td>
                                                    <td><a href="#">${borrow.book.book_name }</a></td>
                                                    <td>${borrow.bStatusStr }</td>
                                                    <td>${borrow.bBackStr}</td>
                                                    <td>${borrow.b_renew }</td>
                                                    <td>${borrow.b_ruin }</td>
                                                    <td>${borrow.b_loseStr }</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${books.size() == 0}">
                                <script>
                                    // alert("没有查到")
                                </script>
                            </c:if>
							<hr>
                        <form id="form" class="am-form am-form-horizontal">
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">借阅天数</label>
                                <div class="am-u-sm-9">
                                    <input id="renew"  name="renew" type="text" placeholder="借阅天数">
                                </div>
                            </div>

                            <div style="height: 200px"></div>

                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="button" class="am-btn am-btn-primary">续借</button>
                                </div>
                            </div>
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
    $("#form button").click(function () {
        var userid = $("#user_id").val();
        // var book_isbn = $("#book_isbn").val();  只能取一个值
        var bookIds = [];   //借阅书籍isbn值集
        $('input[type=checkbox]:checked');
        $.each($('input:checkbox:checked'),function(){
            // window.alert("你选了："+
            // 		$('input[type=checkbox]:checked').length+"个，其中有："+$(this).val());
            bookIds.push($(this).val());
        });
        // var bookIds = $('input[type=checkbox]:checked').val();
        // $.each(bookIds,function () {
        // 	// console.log("选择了"+bookIds.length);
        // 	console.log($(this).val());
        // });
        var renew = $("#renew").val();  //续借天数
        console.log(userid);
        console.log(renew);
        console.log(bookIds.toString());
        var book = bookIds.toString();
        $.post("http://localhost:81/xiao/borrow/myReNew.do",
            {userid:userid,
                book:book,
                renew:renew} ,
            function(data , status){
                if(data == 1){
                    // alert("续借成功");
                    swal("正在等待审核，请在1-2天工作日查看审核结果");
                }else{
                    swal("操作失败！", "服务器出现异常","error")
                }
                if(status == 500){
                    swal("操作失败！", "系统出现故障，正在维护！","error");
                }
            });
        return false;
    })
</script>
</body>

</html>