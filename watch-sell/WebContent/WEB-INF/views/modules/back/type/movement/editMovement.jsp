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
.role-edit-notice{
	white-space: nowrap;
	margin-top: 8px;
	color: red;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".role-edit-notice").hide();
		$("#editMovementButton").click(function(){
			$(".role-edit-notice").hide();
			key = true;
			if ($("#movementName").val() == null ||$("#movementName").val() == '') {
				key = false;
				$("#role-name-edit-notice").show();
			}
			
			if(key == true){
				$("#editMovementForm").submit();
			}
		});
	});

</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/modules/back/type/headerType.jsp"%>
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/type/movement/list">机芯列表</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/a/type/movement/save">添加机芯</a></li>
					<li role="presentation" class="active"><a href="#">修改</a></li>
				</ul>
				<br><br>
				<div class="col-md-6 col-md-offset-1">
				<form id="editMovementForm" action="${pageContext.request.contextPath }/a/type/movement/edit" method="post">
				 		<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">机芯ID</span>
  							<input type="hidden" name="id" value="${movement.id}">
  							<input type="text" value="${movement.id}" class="form-control" disabled="disabled" aria-describedby="sizing-addon1">
						</div>
						<br><br>
				 		<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">机芯名*</span>
  							<input type="text" id="movementName" name="movementName" value="${movement.movementName }" class="form-control" aria-describedby="sizing-addon1">
							<p id="role-name-edit-notice" class="role-edit-notice">*请输入机芯名</p>
						</div>
						<br><br>
							<button type="button" id="editMovementButton" class="btn btn-primary btn-lg btn-block">修改</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>