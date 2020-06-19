<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	<c:if test="${books.size() != 0}">
		<form class="am-form">
			<table style="border: solid 1px red" class="am-table am-table-striped am-table-hover table-main" id="dataList">
				<thead>
				<tr>
					<th class="table-title">用户名称</th>
					<th class="table-title">联系方式</th>
					<th class="table-type">借书时间</th>
					<th class="table-type">是否归还</th>
					<th class="table-author am-hide-sm-only">图书名称</th>
					<th class="table-type">图书isbn</th>
					<th class="table-type">归还时间</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${borrows}" var="borrow">
					<tr>
						<td>${borrow.user.username}</td>
						<td><a href="#">${borrow.user.phoneNum}</a></td>
						<td>${borrow.bStartStr }</td>
						<td>${borrow.bStatusStr}</td>
						<td class="am-hide-sm-only">${borrow.book.book_name}</td>
						<td>${borrow.book.book_isbn}</td>
						<td>${borrow.bBackStr}</td>
					</tr>
				</c:forEach>

				</tbody>
			</table>
		</form>
	</c:if>
	<c:if test="${books.size() == 0}">
		<script>
			// alert("没有查到")
		</script>
	</c:if>



