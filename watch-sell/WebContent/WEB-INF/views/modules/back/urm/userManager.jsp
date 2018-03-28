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
<script type="text/javascript">
function page(n,s){
	if (n) $("#pageNo").val(n);
	if (s) $("#pageSize").val(s);
	$("#userForm").submit();
	return false;
	
}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/modules/back/urm/headerURM.jsp"%>
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/user/list">用户列表</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/a/user/toadd">添加用户</a></li>
				</ul>
				<br>
				<form id="userForm" action="${pageContext.request.contextPath }/a/user/list" method="post">
				<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
				<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">用户邮箱</td>
							<td class="success">用户名</td>
							<td class="warning">用户类型</td>
							<td class="danger">用户角色</td>
							<td class="info">操作</td>
						</tr>
						<c:forEach items="${page.list}" var="user">
							<tr>
								<td class="active">${user.email}</td>
								<td class="success">${user.userName}</td>
								<td class="warning">${user.userType}</td>
								<td class="danger">用户角色</td>
								<td class="info"><a class="caozhuo-class" href="${pageContext.request.contextPath }/a/user/get?id=${user.id}">修改</a><a
									class="caozhuo-class" href="${pageContext.request.contextPath }/a/user/delete?id=${user.id}">删除</a></td>
							</tr>
						</c:forEach>
					</table>
					<div>${page}</div>
				</div>
				</form>
			</div>

		</div>
	</div>
</body>
</html>