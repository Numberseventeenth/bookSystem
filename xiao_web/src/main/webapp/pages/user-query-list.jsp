<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:choose>
	<c:when test="${users.size() != 0}">
		<table id="dataList" class="am-table am-table-striped am-table-hover table-main">
			<thead>
			<tr>
<%--				<th class="table-check"><input type="checkbox" class="tpl-table-fz-check"></th>--%>
				<th></th>
				<th class="table-id" style="display: none">ID</th>
				<th class="table-title">用户名</th>
				<th class="table-type">邮箱</th>
				<th class="table-type">状态</th>
				<th class="table-type">角色</th>
				<th class="table-author am-hide-sm-only">联系电话</th>
					<%--									<th class="table-date am-hide-sm-only">修改日期</th>--%>
				<th class="table-set">操作</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<td><input type="checkbox"></td>
					<input id="user_id" type="text" hidden value="${user.id}" name="user_id">
					<td><a href="#">${user.username }</a></td>
					<td>${user.email }</td>
					<td>${user.statusStr }</td>
					<td class="am-hide-sm-only">
						<c:forEach items="${user.roles}" var="role">
							${role.roleDesc}
						</c:forEach>
					</td>
					<td class="am-hide-sm-only">${user.phoneNum }</td>
					<td>
						<div class="am-btn-toolbar">
							<div class="am-btn-group am-btn-group-xs">
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/findById.do?id=${user.id}'" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 详情</button>
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/findUserByIdAndAllRole.do?id=${user.id}'" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 添加角色</button>
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:when>
	<c:otherwise>
		<script>
			// alert("没有查到该用户！")
		</script>
	</c:otherwise>
</c:choose>

