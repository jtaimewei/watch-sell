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
	$("#brandForm").submit();
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
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/type/brand/list">品牌列表</a></li>
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/type/brand/save">添加品牌</a></li>
				</ul>
				<br>
				<form id="brandForm" action="${pageContext.request.contextPath }/a/type/brand/list" method="post">
				<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
				<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">品牌名</td>
							<td class="info">操作</td>
						</tr>
						<c:forEach items="${page.list}" var="brand">
							<tr>
								<td class="active">${brand.brandName}</td>
								<td class="info">
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/type/brand/edit?id=${brand.id}">修改</a>
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/type/brand/delete?id=${brand.id}">删除</a>
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