<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
			图书信息列表
		</div>
		<ol class="am-breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/main.jsp" class="am-icon-home">首页</a></li>
			<li><a href="#">图书管理</a></li>
			<li class="am-active">图书信息列表</li>
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
								<security:authorize access="hasRole('ADMIN')">
									<button onclick="location.href='${pageContext.request.contextPath}/book/findCategory.do'"  class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>

									<button onclick="location.href='${pageContext.request.contextPath}/export/exportExcelByBook.do'" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 导出Excel</button>
	<%--								<span id="queryBtn">--%>
									<button class="am-btn am-btn-default am-btn-warning">
										<span  class="am-icon-archive" id="queryBtn">
											<a id="outi" style="color: white">下架图书</a>
										</span>
									</button>
								</security:authorize>
								<button id="flushBtn" onclick="location.href='${pageContext.request.contextPath}/book/findAll.do?page=1&size=20'" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 刷新</button>
<%--								</span>--%>
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
							<input type="text" class="am-form-field" id="queryValue" name="queryValue" placeholder="搜索">
							<span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
          </span>
						</div>
					</div>
				</div>





				<div class="am-g">
					<div class="am-u-sm-12">
						<div id="queryDiv">
							<%--								查询后的结果--%>
						</div>
						<form class="am-form">
							<table class="am-table am-table-striped am-table-hover table-main" id="DdataList">
								<thead>
								<tr>
									<th class="table-id">ISBN</th>
									<th class="table-title">图书名称</th>
									<th class="table-type">价格</th>
									<th class="table-type">出版社</th>
									<th class="table-author am-hide-sm-only">作者</th>
									<th class="table-type">出版年份</th>
									<th class="table-type">分类</th>
									<th class="table-type">入库时间</th>
									<th class="table-type">库存</th>
									<th class="table-type">借出</th>
									<th class="table-type">剩余</th>
									<th class="table-set">操作</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${pageInfo.list}" var="book">
									<tr>
										<td>${book.book_isbn }</td>
										<td><a href="#">${book.book_name }</a></td>
										<td>${book.book_price }</td>
										<td>${book.book_public }</td>
										<td class="am-hide-sm-only">${book.book_author }</td>
										<td>${book.book_year }</td>
										<td>${book.category.c_name }</td>
										<td>${book.bookDateStr }</td>
										<td>${book.book_count }</td>
										<td>${book.book_borrow }</td>
										<td style="color: red">${book.remain }</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">

													<security:authorize access="hasRole('ADMIN')">
														<button class="am-btn am-btn-default am-btn-xs am-text-secondary" id="updateBtn">
															<span class="am-icon-pencil-square-o">
																<c:choose>
																	<c:when test="${book.out == 1}">
																		<a href="${pageContext.request.contextPath}/book/outById.do?id=${book.book_isbn}&out=${book.out}" >下架</a>
																	</c:when>
																	<c:otherwise>
																		<a href="${pageContext.request.contextPath}/book/outById.do?id=${book.book_isbn}&out=${book.out}" style="color: yellow">上架</a>
																	</c:otherwise>
																</c:choose>
															</span>
														</button>

														<button type="button" onclick="location.href='${pageContext.request.contextPath}/book/updateById.do?book_isbn=${book.book_isbn}'" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 编辑</button>
													</security:authorize>
													<button type="button" onclick="location.href='${pageContext.request.contextPath}/book/findById.do?id=${book.book_isbn}'" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 详情</button>

													<security:authorize access="hasRole('USER')">
														<span id="advanceA">
															<button type="button" value="${book.book_isbn}" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 预借</button>
														</span>
													</security:authorize>
<%--													<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" id="advanceBtn">--%>
<%--														<span class="am-icon-trash-o"></span>--%>
<%--														<a  href="${pageContext.request.contextPath}/book/advanceBook.do?book_isbn=${book.book_isbn}">预借</a>--%>
<%--													</button>--%>
												</div>
											</div>
										</td>
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
											<li><a href="${pageContext.request.contextPath}/book/findAll.do?page=1&size=${pageInfo.pageSize}">首页</a></li>
											<li><a href="${pageContext.request.contextPath}/book/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
											<%--										<li class="am-active"><a href="#">1</a></li>--%>
											<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
												<li><a href="${pageContext.request.contextPath}/book/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
											</c:forEach>
											<li><a href="${pageContext.request.contextPath}/book/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
											<li><a href="${pageContext.request.contextPath}/book/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a></li>
										</ul>
									</div>
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
<script src="${pageContext.request.contextPath}/assets/js/sweetalert-dev.js"></script>
<script type="text/javascript">
	$(function(){

		$("#queryValue").keyup(function() {
			//2。 获取输入框的值
			//var word = $("#word").val();
			//this  对应就是执行这个方法的那个对象， $("#word")
			var queryValue = $(this).val();
			// alert("hahaha")

			if(queryValue == ""){
				$("#queryDiv").hide();
				$("#DdataList").show();
				$("#page").show();
			}else{
				//3. 请求数据。
				$.post("http://localhost:81/xiao/book/query.do",{queryValue:queryValue} ,function(data , status){
					// alert(data);
					$("#queryDiv").show();
					$("#queryDiv").html(data);
					// $("#DdataList").hide();
					// $("#page").hide();
				});
			}
		})
	});

	function changePageSize() {
		//获取下拉框的值
		var pageSize = $("#changePageSize").val();

		//向服务器发送请求，改变没页显示条数
		location.href = "${pageContext.request.contextPath}/book/findAll.do?page=1&size="
				+ pageSize;
	}


	$("#updateBtn a").click(function () {
		$.ajax({
			type:'get',
			url:$(this).attr('href'),
			// beforeSend:function(){
			// 	$(".main-content").html("加载中.......")
			// },
			success:function(result){
				if(result == 1){
                    swal({
                        title: "操作成功，图书已下架！",
                        text: "2秒后自动关闭。",
                        timer: 2000,
                        showConfirmButton: false
                    });
					// $("#flushBtn").trigger("click");
				}else if(result == 2){
					//成功上架
                    swal({
                        title: "操作成功，图书已上架！",
                        text: "2秒后自动关闭。",
                        timer: 2000,
                        showConfirmButton: false
                    });
				}else if(result == 0){
                    swal("操作失败！", "系统出现故障，正在维护！","error");
				}
			}
		});
		return false;
	});

	$("#queryBtn a").click(function () {
		var out = document.getElementById("outi").textContent;
		if(out == "下架图书"){
			$("#queryBtn a").text("上架图书");
			$.get("${pageContext.request.contextPath}/book/queryBookByOut.do",function (data,status) {
				$("#queryDiv").show();
				$("#queryDiv").html(data);
				$("#DdataList").hide();
				$("#page").hide();
			})
		}else {
			$("#queryBtn a").text("下架图书");
			$("#queryDiv").hide();
			$("#DdataList").show();
			$("#page").show();
		}

		return false;
	});

	$("#advanceA button").click(function () {

		var book_isbn = $(this).val();

		// if(confirm("确定要预借这本书吗？")){
		// 	$.ajax({
		// 		type:'get',
		// 		url:$(this).attr('href'),
		// 		// beforeSend:function(){
		// 		// 	$(".main-content").html("加载中.......")
		// 		// },
		// 		success:function(result){
		// 			if(result == 1){
		// 				// alert("正在等待审核，请在1-2天工作日查看审核结果")
        //                 swal("正在等待审核，请在1-2天工作日查看审核结果");
		// 				// $("#advanveA").text("已预借")
		// 			}else if(result == 0){
		// 				//成功上架
        //                 swal("操作失败！", "系统出现故障，正在维护！","error");
		// 			}
		// 		}
		// 	})
		// }

		swal({
			title: "确定要预借吗？",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "确定！",
			closeOnConfirm: false
		},
		function(){
			console.log("进入ajax");
			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/book/advanceBook.do?book_isbn=' + book_isbn,

				success:function(result){
					if(result == 1){
						// alert("正在等待审核，请在1-2天工作日查看审核结果")
						swal("正在等待审核，请在1-2天工作日查看审核结果");
						// $("#advanveA").text("已预借")
					}else if(result == 0){
						//成功上架
						swal("操作失败！", "系统出现故障，正在维护！","error");
					}
					// $("#flushBtn").trigger("click");
				}
			});
		});
		return false;
	})
</script>
</body>

</html>