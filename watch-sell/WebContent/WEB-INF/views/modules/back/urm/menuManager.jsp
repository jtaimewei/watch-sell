<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台菜单管理</title>
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
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/menu/list">菜单列表</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/a/menu/toadd">添加菜单</a></li>
				</ul>
				<br>
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">菜单名</td>
							<td class="success">访问链接</td>
							<td class="warning">排序</td>
							<td class="danger">访问权限</td>
							<td class="info">操作</td>
						</tr>
						<c:forEach items="${menuList}" var="menu">
							<tr>
								<td class="active">${menu.menuName}</td>
								<td class="success">${menu.href}</td>
								<td class="warning">${menu.sort}</td>
								<td class="danger">${menu.permission}</td>
								<td class="info"><a class="caozhuo-class" href="${pageContext.request.contextPath }/a/menu/toedit?id=${menu.id}">修改</a><a class="caozhuo-class" href="${pageContext.request.contextPath }/a/menu/delete?id=${menu.id}">删除</a></td>
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