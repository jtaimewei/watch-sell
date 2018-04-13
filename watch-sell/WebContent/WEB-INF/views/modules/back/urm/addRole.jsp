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
.role-add-notice{
	white-space: nowrap;
	margin-top: 8px;
	color: red;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".role-add-notice").hide();
		$("#addRoleButton").click(function(){
			$(".role-add-notice").hide();
			key = true;
			if ($("#roleName").val() == null ||$("#roleName").val() == '') {
				key = false;
				$("#role-name-add-notice").show();
			}
			
			if(key == true){
				$("#addRoleForm").submit();
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
					<li role="presentation"><a href="${pageContext.request.contextPath }/a/role/list">角色列表</a></li>
					<li role="presentation"  class="active"><a href="${pageContext.request.contextPath }/a/role/toadd">添加角色</a></li>
				</ul>
				<br><br>
				<div class="row">
				<div class="col-md-6 col-md-offset-1">
				<form id="addRoleForm" action="${pageContext.request.contextPath }/a/role/add" method="post">
				 		<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">角色名*</span>
  							<input type="text" id="roleName" name="roleName" class="form-control" aria-describedby="sizing-addon1">
							<p id="role-name-add-notice" class="role-add-notice">*请输入角色名</p>
						</div>
						<br><br>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label" style="font-size: 20px;">菜单*</label>
							<div class="col-sm-10">
								<c:forEach items="${menuList}" var="menus" varStatus="status">
									<label class="checkbox-inline" style="font-size: 18px;"> <input type="checkbox"
										class="roles-class" name="menus[${ status.index + 1}].id"  value="${menus.id }"> ${menus.menuName }
									</label>
									<br><br>
								</c:forEach>
							</div>
							<!-- <p id="role-notice" class="role-add-notice">*至少选择一个</p> -->
						</div>
							<button type="button" id="addRoleButton" class="btn btn-primary btn-lg btn-block">添加</button>
						
					</form>
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