<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
#left-head {
	
}
</style>
<script type="text/javascript">
	$(function() {
	});
</script>
</head>
<body>
	<div id="left-head" class="col-md-2">
	<br><br>
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" ${type == 'brand'?'class="active"':''}><a
				href="${pageContext.request.contextPath}/b/user/own">个人信息</a></li>
			<li role="presentation" ${type == 'crowd'?'class="active"':''}><a
				href="${pageContext.request.contextPath }/b/user/editPassword">修改密码</a></li>
			<li role="presentation"  ${type == 'movement'?'class="active"':''}><a
				href="${pageContext.request.contextPath }/b/user/reception">收货地址</a></li>
			<li role="presentation"  ${type == 'movement'?'class="active"':''}><a
				href="${pageContext.request.contextPath }/a/type/movement/list">会员中心</a></li>
		</ul>
	</div>
</body>
</html>