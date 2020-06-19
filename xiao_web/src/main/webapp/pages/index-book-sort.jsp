<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jPages.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>

		<table class="am-table tpl-table">
			<thead>
			<tr class="tpl-table-uppercase">
				<th>图书名称</th>
				<th>作者</th>
				<th>借阅次数</th>
				<th>所占全部比例</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${bookHotSort}" var="book">
				<tr>
					<td>
						<c:if test="${book.book.book_img != null}">
							<img src="/pic/book/${book.book.book_img}" alt="" class="user-pic">
						</c:if>
						<a class="user-name" href="###">${book.book.book_name}</a>
					</td>
					<td>${book.book.book_author}</td>
					<td>${book.num}</td>
					<td class="font-green bold">${book.num / count}
<%--						<fmt:formatNumber value="${book.num / count}" maxFractionDigits="2" />--%>
					</td>

				</tr>
			</c:forEach>

			</tbody>
		</table>







