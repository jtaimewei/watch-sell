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
<script type="text/javascript">
function page(n,s){
	if (n) $("#pageNo").val(n);
	if (s) $("#pageSize").val(s);
	$("#movementForm").submit();
	return false;
	
}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/modules/back/type/headerType.jsp"%>
			<div class="col-md-10">
			<div class="thumbnail rigthDiv">
			
			  <div class="caption">
			<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/type/movement/list">机芯列表</a></li>
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/type/movement/save">添加机芯</a></li>
				</ul>
				<br>
				<form id="movementForm" action="${pageContext.request.contextPath }/a/type/movement/list" method="post">
				<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
				<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">机芯名</td>
							<td class="info">操作</td>
						</tr>
						<c:forEach items="${page.list}" var="movement">
							<tr>
								<td class="active">${movement.movementName}</td>
								<td class="info">
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/type/movement/edit?id=${movement.id}">修改</a>
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/type/movement/delete?id=${movement.id}">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div>${page}</div>
				</div>
				</form>
			</div>
			</div>
			</div>

		</div>
	</div>
</body>
</html>