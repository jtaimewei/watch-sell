<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台角色管理</title>
<style type="text/css">
.caozhuo-class{
    margin-left: 10px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/modules/back/urm/headerURM.jsp"%>
			<div class="col-md-10">
			<div class="thumbnail rigthDiv">
			  <div class="caption">
			<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/role/list">角色列表</a></li>
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/role/toadd">添加角色</a></li>
				</ul>
				<br>
				
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">角色名</td>
							<td class="info">操作</td>
						</tr>
						<c:forEach items="${roleList}" var="role">
							<tr>
								<td class="active">${role.roleName}</td>
								<td class="info">
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/role/distri?id=${role.id}">分配</a>
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/role/toedit?id=${role.id}">修改</a>
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/role/delete?id=${role.id}">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			</div>
			</div>

		</div>
	</div>
</body>
</html>