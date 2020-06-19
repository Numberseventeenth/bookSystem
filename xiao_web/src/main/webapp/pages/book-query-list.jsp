<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jPages.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>

	<c:if test="${books.size() != 0}">
<%--        style="border: solid 1px red"--%>
		<table  id="dataList" class="am-table am-table-striped am-table-hover table-main" >
			<thead>
			<tr>
				<th></th>
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
<%--				<th class="table-set">操作</th>--%>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${books}" var="book">
				<tr>
					<input id="book_isbn" type="text" hidden value="${book.book_isbn}" name="book_isbn">
					<td><input type="checkbox" name="book_choose" value="${book.book_isbn}"></td>
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
					<td>${book.remain }</td>
<%--					<td>--%>
<%--						<div class="am-btn-toolbar">--%>
<%--							<div class="am-btn-group am-btn-group-xs">--%>
<%--								<button class="am-btn am-btn-default am-btn-xs am-text-secondary" id="updateBtn">--%>
<%--									<span class="am-icon-pencil-square-o">--%>
<%--										<c:choose>--%>
<%--											<c:when test="${book.out == 1}">--%>
<%--												<a href="${pageContext.request.contextPath}/book/outById.do?id=${book.book_isbn}&out=${book.out}" >下架</a>--%>
<%--											</c:when>--%>
<%--											<c:otherwise>--%>
<%--												<a href="${pageContext.request.contextPath}/book/outById.do?id=${book.book_isbn}&out=${book.out}" style="color: #00ee00">上架</a>--%>
<%--											</c:otherwise>--%>
<%--										</c:choose>--%>
<%--									</span>--%>
<%--								</button>--%>
<%--								<button type="button" onclick="location.href='${pageContext.request.contextPath}/book/findById.do?id=${book.book_isbn}'" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 详情</button>--%>
<%--								<button type="button" onclick="location.href='${pageContext.request.contextPath}/book/updateById.do?book_isbn=${book.book_isbn}'" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 编辑</button>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</td>--%>
				</tr>
			</c:forEach>

			</tbody>
		</table>
	</c:if>
	<c:if test="${books.size() == 0}">
		<script>
			// alert("没有查到")
		</script>
	</c:if>


<script type="text/javascript">
	$("#updateBtn a").click(function () {
		$.ajax({
			type:'get',
			url:$(this).attr('href'),
			// beforeSend:function(){
			// 	$(".main-content").html("加载中.......")
			// },
			success:function(result){
				// alert(result);
				if(result == 1){
					alert("操作成功，图书下架")
					$("#flushBtn").trigger("click");
				}else if(result == 2){
					//成功上架
					alert("操作成功，图书已上架");
					//刷新
				}else if(result == 0){
					alert("操作失败！！！")
				}
			}
		})
		return false;
	})

	// $(function () {
	// 	$('.holder').jPages({
	// 		containerID: 'list',
	// 		first: '第一页',//false为不显示
	// 		previous: '前一页',//false为不显示
	// 		next: '后一页',//false为不显示 自定义按钮
	// 		last: '最后一页',//false为不显示
	// 		perPage: 3,//每页最多显示5个
	// 		keyBrowse: true,//键盘切换
	// 		scrollBrowse: false,//滚轮切换
	// 		//pause: 1000,//自动切换
	// 		//clickStop: true,//点击停止自动切换
	// 		//delay: 250,//每张图片显示动画延迟
	// 		//direction: "auto",//本页图片显示的顺序 -> "forward", "backwards", "auto" or "random".
	// 		//fallback: 5000,//每张图片显示透明度延迟
	// 		callback: function(pages, items) {
	// 			$('#count').html(items.count);
	// 			console.log(pages);
	// 			console.log(items);
	// 			console.log(pages.current);
	// 		},
	// 	});
	// })


</script>



