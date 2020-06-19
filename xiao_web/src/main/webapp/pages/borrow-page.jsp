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
			借阅 / 归还
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">图书借阅管理</a></li>
			<li class="am-active">借阅 / 归还</li>
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
						<form class="am-form am-form-horizontal" id="form">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">搜索用户</label>
								<div class="am-u-sm-9">
									<input id="word" name="word" type="text" placeholder="输入电话号码或用户名">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">搜索书籍</label>
								<div class="am-u-sm-9">
									<input id="book" name="book" type="text"  placeholder="输入书籍名称或者isbn码">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">归还图书：是否丢失 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<select data-am-selected="{searchBox: 1}" name="b_ruin_int" id="b_lose">
										<option value="0">否</option>
										<option value="1">是</option>
									</select>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">归还图书：是否有损坏 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<select data-am-selected="{searchBox: 1}" name="b_ruin_int" id="b_ruin_int">
										<option value="0">无</option>
										<option value="1">有</option>
									</select>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">归还图书：损坏程度 <span class="tpl-form-line-small-title"></span></label>
								<div class="am-u-sm-9">
									<select data-am-selected="{searchBox: 1}" name="b_ruin_int" id="b_ruin_level">
										<option value="0">0%</option>
										<option value="1">1%-30%</option>
										<option value="2">30%-70%</option>
										<option value="3">70%-100%</option>
									</select>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-intro" class="am-u-sm-3 am-form-label">归还图书：图书损坏记录</label>
								<div class="am-u-sm-9">
									<textarea name="b_ruin" id="b_ruin" class="" rows="5" placeholder="图书损坏记录"></textarea>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-intro" class="am-u-sm-3 am-form-label">归还图书：赔偿金额记录</label>
								<div class="am-u-sm-9">
									<textarea name="b_compensate" id="b_compensate" class="" rows="5" placeholder="赔偿金额记录"></textarea>
								</div>
							</div>


<%--							<div style="height: 200px"></div>--%>

							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<button type="button" name="submitStatus" value="1" class="am-btn am-btn-primary">借阅</button>
									<button type="button" name="submitStatus" value="0" class="am-btn am-btn-primary">归还</button>
								</div>
							</div>
						</form>
						<div id="tishi">


						</div>
						<div id="tishibook">


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
				$.post("http://localhost:81/xiao/user/queryUserNameAndPhoneAndEmail.do",{queryValue:queryValue} ,function(data , status){
					// alert(data);
					$("#tishi").show();
					$("#tishi").html(data);
				});
			}
		})
	});

	$(function() {
		$("#book").keyup(function() {
			//2。 获取输入框的值
			//var word = $("#word").val();
			//this  对应就是执行这个方法的那个对象， $("#word")
			var book = $(this).val();

			if(book == ""){
				$("#tishibook").hide();
			}else{
				//3. 请求数据。
				$.post("http://localhost:81/xiao/book/queryBookByNameAndIsbn.do",{book:book} ,function(data , status){
					// alert(data);
					$("#tishibook").show();
					$("#tishibook").html(data);
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
		// alert(123);
		var user_id = $("#user_id").val();
		var book_isbn = $("#book_isbn").val();
		var submitStatus = $(this).val();
		var b_ruin_int = $("#b_ruin_int").val();
		var b_ruin = $("#b_ruin").val();
		var b_compensate = $("#b_compensate").val();
		var b_ruin_level = $("#b_ruin_level").val();
		var b_lose = $("#b_lose").val();
		console.log(user_id);
		console.log(book_isbn);
		console.log(submitStatus);
		console.log(b_ruin_int);
		console.log(b_ruin);
		console.log(b_compensate);
		console.log(b_ruin_level);
		console.log(b_lose);
		$.post("http://localhost:81/xiao/borrow/borrow.do",
				{user_id:user_id,
					book_isbn:book_isbn,
					submitStatus:submitStatus,
					b_ruin_int:b_ruin_int,
					b_ruin:b_ruin,
					b_compensate:b_compensate,
					b_ruin_level:b_ruin_level,
					b_lose:b_lose},
				function(data , status){
					// alert(data);
					if(data == 1){
						// alert("操作成功")
						swal("操作成功！", "该书籍借阅/归还成功！","success")
					}
					if(data == 0){
						//表示借出失败
						swal("操作失败！", "该书籍库存不足","error")
					}
				});
		return false;
	})
</script>
</body>

</html>