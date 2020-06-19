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
			续借
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">借阅管理</a></li>
			<li class="am-active">续借</li>
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
						<form id="form" class="am-form am-form-horizontal">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">搜索用户</label>
								<div class="am-u-sm-9">
									<input id="word" name="word" type="text" placeholder="输入电话号码或用户名">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">借阅天数</label>
								<div class="am-u-sm-9">
									<input id="renew"  name="renew" type="text" placeholder="借阅天数">
								</div>
							</div>



<%--							<div style="height: 200px"></div>--%>

							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<button type="button" class="am-btn am-btn-primary">续借</button>
								</div>
							</div>
						</form>
						<div id="tishi">


						</div>

					</div>
				</div>
			</div>

		</div>










	</div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sweetalert-dev.js"></script>
<script type="text/javascript">
	$(function() {
		$("#word").keyup(function() {
			//2。 获取输入框的值
			//var word = $("#word").val();
			//this  对应就是执行这个方法的那个对象， $("#word")
			var queryValue = $(this).val();
			if(queryValue == ""){
				$("#tishi").hide();
			}else{
				//3. 请求数据。
				$.post("http://localhost:81/xiao/user/queryUserAndBorrows.do",{queryValue:queryValue} ,function(data , status){
					// alert(data);
					$("#tishi").show();
					$("#tishi").html(data);
				});
			}
		})
	});



	// function submitForm() {
	// 	alert("进入了")
	//
	// 	return false;
	// }

	// $("#form button").click(function(){
	// 	if(confirm("确定要删除吗?")){
	// 		$.ajax({
	// 			type:'get',
	// 			url:$(this).attr('href'),
	// 			success:function(result){
	// 				if(result == 0){
	// 					alert("删除成功")
	// 				}else {
	// 					alert("删除失败，有角色用到权限")
	// 				}
	// 				$("#flushBtn").trigger("click");
	// 			}
	// 		});
	// 	}
	// 	return false;
	// });
	$("#form button").click(function () {
		var user_id = $("#user_id").val();
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
		var b_renew = $("#renew").val();  //续借天数
		console.log(user_id);
		console.log(b_renew);
		console.log(bookIds.toString());
		var book = bookIds.toString();
		$.post("http://localhost:81/xiao/borrow/renew.do",
				{user_id:user_id,
					book:book,
					b_renew:b_renew} ,
				function(data , status){
					if(data == 1){
						// alert("续借成功");
						swal("续借成功！", "该书籍续借成功","success")
					}else if(data == 2){
						swal("续借失败！", "该书籍续借失败","success")
					}else{
						swal("操作失败！", "服务器出现异常","error")
					}
					if(status == 500){
						swal("操作失败！", "服务器出现异常","error")
					}
				});
		return false;
	})
</script>
</body>

</html>