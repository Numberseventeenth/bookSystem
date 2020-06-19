<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
				<th class="table-type">预借时间</th>
				<th class="table-type">审核状态</th>
				<th class="table-type">管理员审核时间</th>
				<th class="table-type">是否取走</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${users}" var="user">
				<c:forEach items="${user.advances}" var="advance">
					<tr>
						<input id="book_isbn" type="text" hidden value="${advance.book_isbn}">
						<td><input type="checkbox" name="bookIds" value="${advance.book.book_isbn}"></td>
						<td>
							<c:if test="${advance.book.book_img != null}">
								<img src="/pic/book/${advance.book.book_img}"/>
								<br/>
							</c:if>
						</td>
						<td>${advance.book.book_isbn}</td>
						<td><a href="#">${advance.book.book_name }</a></td>
						<td>${advance.createTimeStr }</td>
						<td>${advance.flagStr}</td>
						<td>${advance.operateTimeStr }</td>
						<td>${advance.takeStr }</td>
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




