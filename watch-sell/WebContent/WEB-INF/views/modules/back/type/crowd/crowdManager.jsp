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
			<%@ include file="/WEB-INF/views/modules/back/type/headerType.jsp"%>
			<div class="col-md-10">
			<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/type/crowd/list">人群列表</a></li>
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/type/crowd/save">添加人群</a></li>
				</ul>
				<br>
				
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">人群</td>
							<td class="info">操作</td>
						</tr>
						<c:forEach items="${crowdList}" var="crowd">
							<tr>
								<td class="active">${crowd.crowdName}</td>
								<td class="info">
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/type/crowd/edit?id=${crowd.id}">修改</a>
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/type/crowd/delete?id=${crowd.id}">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>

		</div>
	</div>
</body>
</html>