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
		/* var currentUrl = this.location.href;
		//alert(currentUrl)
		//http://localhost:8080/watch-sell/a/user/list 
		var index = currentUrl.lastIndexOf("watch-sell");
		var obj = currentUrl.substring(index + 10, currentUrl.length);
		console.log(obj);

		if (obj == "/a/user/list") {
			$("#user").attr("class", "active");
		} else if (obj == "/a/role/list") {
			$("#role").attr("class", "active");
		} else if (obj == "/a/menu/list") {
			$("#menu").attr("class", "active");

		}
		$("a[href=='/watch-sell/a/user/list']").parent().attr("class", "active"); */
	}); 
</script>
</head>
<body>
	<div id="left-head" class="col-md-2">
	<div class="thumbnail" id="leftDive">
			      <div class="caption">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" id="user" ${urm == 'user'?'class="active"':''}><a
				href="${pageContext.request.contextPath }/a/user/list">用户管理</a></li>
			<li role="presentation" id="role" ${urm == 'role'?'class="active"':''}><a
				href="${pageContext.request.contextPath }/a/role/list">角色管理</a></li>
			<li role="presentation" id="menu" ${urm == 'menu'?'class="active"':''}><a
				href="${pageContext.request.contextPath }/a/menu/list">菜单管理</a></li>
		</ul>
	</div>
	</div>
	</div>
</body>
</html>