<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台个人信息</title>
<style type="text/css">
.caozhuo-class {
	margin-left: 10px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/modules/back/urm/headerURM.jsp"%>
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li role="presentation"><a href="${pageContext.request.contextPath }/a/role/list">角色列表</a></li>
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/role/toadd">添加角色</a></li>
					<li role="presentation"  class="active"><a href="#">角色分配</a></li>
					
				</ul>
				<br>
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">用户邮箱</td>
							<td class="success">用户名</td>
							<td class="warning">用户类型</td>
							<td class="info">操作</td>
						</tr>
						<c:forEach items="${page.list}" var="user">
							<tr>
								<td class="active">${user.email}</td>
								<td class="success">${user.userName}</td>
								<td class="warning">${user.userType}</td>
								<td class="info">
								<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/role/remove?userId=${user.id}&roleId=${roleId}">移除</a></td>
							</tr>
						</c:forEach>
					</table>
					<div>${page}</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>