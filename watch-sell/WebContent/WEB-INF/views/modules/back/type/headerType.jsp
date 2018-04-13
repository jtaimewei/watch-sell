<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/back/header/backHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台个人信息</title>
<style type="text/css">
#left-head {
	
}
</style>
<script type="text/javascript">
	$(function() {
		$("#leftDive").height($(window).height());
	});
</script>
</head>
<body>
	<div id="left-head" class="col-md-2">
		<div class="thumbnail" id="leftDive">
			      <div class="caption">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" id="user" ${type == 'brand'?'class="active"':''}><a
				href="${pageContext.request.contextPath }/a/type/brand/list">品牌分类</a></li>
			<li role="presentation" id="role" ${type == 'crowd'?'class="active"':''}><a
				href="${pageContext.request.contextPath }/a/type/crowd/list">人群分类</a></li>
			<li role="presentation" id="menu" ${type == 'movement'?'class="active"':''}><a
				href="${pageContext.request.contextPath }/a/type/movement/list">机芯分类</a></li>
		</ul>
		
	</div>
	</div>
	</div>
</body>
</html>