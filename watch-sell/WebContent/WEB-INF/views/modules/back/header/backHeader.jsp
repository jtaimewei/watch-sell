<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台头部</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
.nav-pills {
	font-size: 16px;
}
</style>
<script type="text/javascript">
	/* $(function() {
		var Urls = this.location.href;
		//alert(currentUrl)
		// http://localhost:8080/watch-sell/a/user/list
		var index = Urls.lastIndexOf("watch-sell");
		var obj = Urls.substring(index + 10, Urls.length);
		console.log(obj);
		if (obj == "/a/headerUser") {
			$("#ownUser").addClass("active");
		}
		$('.menu-a-class').each(function() {
			var thisUrl = $(this).attr("href");
			console.log("12", thisUrl);
			var index2 = thisUrl.lastIndexOf("watch-sell");
			var obj2 = thisUrl.substring(index2 + 10, thisUrl.length);

			console.log("11", obj2);
			if (obj == obj2) {
				$(this).parent().attr("class", "active");
			}
		});

	}); */
</script>
</head>
<body>
<br>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
      <a class="navbar-brand" href="#">
        <img alt="名表网后台" src="...">
      </a>
    </div>
			<ul class="nav nav-pills">
				<!-- <li role="presentation"><a>名表网后台</a></li> -->
				<c:forEach items="${menus}" var="menu">
					<li role="presentation" ${head == menu.href?'class="active"':''}><a class="menu-a-class"
						href="${pageContext.request.contextPath}${menu.href}">${menu.menuName}</a></li>
				</c:forEach>
				<li role="presentation" style="float: right;"><a
					href="${pageContext.request.contextPath}/a/logout">退出</a></li>
				<li role="presentation" id="ownUser" class="dropdown ${head == 'headerUser'?'active':''}" style="float: right;">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false"> 个人中心<span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li>
						<a href="${pageContext.request.contextPath}/a/headerUser">${userOwn.userName}</a>
						</li>
					</ul>
				</li>

			</ul>
	</div>
	</nav>
</body>
</html>