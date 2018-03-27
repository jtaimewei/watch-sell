<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线客服</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/back/header/backHeader.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<table class="table table-striped">
					<tr>
						<th>序号</th>
						<th>用户IP</th>
						<th>用户名</th>
						<th>登录时间</th>
					</tr>
					<c:forEach items="${onlineList}" var="list" varStatus="status">
						<tr>
							<td>${ status.index + 1}</td>
							<td>${list.ip }</td>
							<td>${list.loginId }</td>
							<td><fmt:formatDate value="${list.onlineTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>

						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

	</div>
</body>
</html>