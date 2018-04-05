<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/back/header/backHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台信息</title>
<style type="text/css">
.caozhuo-class {
	margin-left: 10px;
}
</style>
<script type="text/javascript">
function page(n,s){
	if (n) $("#pageNo").val(n);
	if (s) $("#pageSize").val(s);
	$("#watchForm").submit();
	return false;
	
}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/watch/list">名表列表</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/a/watch/save">添加名表</a></li>
				</ul>
				<br>
				<form id="watchForm" action="${pageContext.request.contextPath }/a/watch/list" method="post">
				<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
				<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">序列号</td>
							<td class="success">标题</td>
							<td class="warning">型号</td>
							<td class="warning">原价</td>
							<td class="warning">现价</td>
							<td class="warning">数量</td>
							<td class="danger">促销内容</td>
							<td class="info">操作</td>
						</tr>
						<c:forEach items="${page.list}" var="watch">
							<tr>
								<td class="active">${watch.watchSerialNumber}</td>
								<td class="success">${watch.watchTitle}</td>
								<td class="warning">${watch.watchModel}</td>
								<td class="warning">${watch.watchOrgPrice}</td>
								<td class="warning">${watch.watchPrePrice}</td>
								<td class="warning">${watch.watchNumber}</td>
								<td class="danger">促销</td>
								<td class="info"><a class="caozhuo-class" href="${pageContext.request.contextPath }/a/watch/toedit?id=${watch.id}">修改</a><a
									class="caozhuo-class" href="${pageContext.request.contextPath }/a/watch/delete?id=${watch.id}">删除</a></td>
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