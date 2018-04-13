<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台菜单管理</title>
<script type="text/javascript" src="${ctxStatic}/resources/js/jquery-1.11.3.js"></script>
<style type="text/css">
.menu-notice{
	white-space: nowrap;
	margin-top: 8px;
	color: red;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".menu-notice").hide();
		$("#editMenuButton").click(function(){
			$(".menu-notice").hide();
			key = true;
			if ($("#menuName").val() == null ||$("#menuName").val() == '') {
				key = false;
				$("#menuName-notice").show();
			}
			if ($("#href").val() == null ||$("#href").val() == '') {
				key = false;
				$("#href-notice").show();
			}
			if ($("#sort").val() == null ||$("#sort").val() == '') {
				key = false;
				$("#sort-notice").show();
			}
			if ($("#permission").val() == null ||$("#permission").val() == '') {
				key = false;
				$("#permission-notice").show();
			}
			if(key == true){
				$("#editMenuForm").submit();
			}
		});
	});

</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/modules/back/urm/headerURM.jsp"%>
			<div class="col-md-10">
			<div class="thumbnail rigthDiv">
			  <div class="caption">
				<ul class="nav nav-tabs">
					<li role="presentation"><a href="${pageContext.request.contextPath }/a/menu/list">菜单列表</a></li>
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/menu/toadd">添加菜单</a></li>
					<li role="presentation"  class="active"><a href="#">修改菜单</a></li>
				</ul>
				<br><br>
				<div class="row">
				<div class="col-md-6 col-md-offset-1">
				<form id="editMenuForm" action="${pageContext.request.contextPath }/a/menu/edit" method="post">
						<input type="hidden" name="id" value="${editMenu.id}">
				 		<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">菜单名&nbsp;&nbsp;&nbsp;&nbsp;*</span>
  							<input type="text" id="menuName" name="menuName" value="${editMenu.menuName}" class="form-control" aria-describedby="sizing-addon1">
							<p id="menuName-notice" class="menu-notice">*请输入菜单名</p>
						</div>
						<br><br>
						<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">访问链接*</span>
  							<input type="text" id="href" name="href" value="${editMenu.href}" class="form-control" aria-describedby="sizing-addon1">
							<p id="href-notice" class="menu-notice">*请输入访问链接</p>
						</div>
						<br><br>
						<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">排序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</span>
  							<input type="text" id="sort" name="sort" value="${editMenu.sort}" class="form-control" aria-describedby="sizing-addon1">
							<p id="sort-notice" class="menu-notice">*请输入排序号</p>
						</div>
						<br><br>
						<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">访问权限*</span>
  							<input type="text" id="permission" value="${editMenu.permission}" name="permission" class="form-control" aria-describedby="sizing-addon1">
							<p id="permission-notice" class="menu-notice">*请输入访问权限</p>
						</div>
						<br><br>
						
							<button type="button" id="editMenuButton" class="btn btn-primary btn-lg btn-block">修改</button>
						
					</form>
					<br>
					<br>
					<br>
					<br>
				</div>
				</div>
			</div>
			</div>
			</div>

		</div>
	</div>
</body>
</html>