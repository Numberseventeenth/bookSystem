<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jPages.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>

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




