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
		
		var list = '${myMenuList}';
		var reg = new RegExp(" ","g");//g,表示全部替换。
		list = list.replace("[","");
		list = list.replace(reg,"");
		
		var ids = list.replace("]","");
		var menuids = ids.split(',');
		$(".menus-class").each(function(){
			//roles.push($(this).val());
			console.log('id',$(this).val());
			for(i = 0 ; i <menuids.length;i++){
			console.log('menuids',menuids[i]);
				if (menuids[i] == $(this).val()){
			console.log('menuids[i]',menuids[i]);
					$(this).attr("checked","checked");
				}
			}
		});
		
		$(".role-add-notice").hide();
		$("#editRoleButton").click(function(){
			$(".role-add-notice").hide();
			key = true;
			if ($("#roleName").val() == null ||$("#roleName").val() == '') {
				key = false;
				$("#role-name-add-notice").show();
			}
			
			if(key == true){
				$("#editRoleForm").submit();
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
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/role/toadd">添加角色</a></li>
					<li role="presentation"  class="active"><a href="#">修改角色</a></li>
					
				</ul>
				<br><br>
				<div class="row">
				<div class="col-md-6 col-md-offset-1">
				<form id="editRoleForm" action="${pageContext.request.contextPath }/a/role/edit" method="post">
					<input type="hidden" name="id" value="${roleEdit.id}">
				 		<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">角色名*</span>
  							<input type="text" id="roleName" name="roleName" value="${roleEdit.roleName}" class="form-control" aria-describedby="sizing-addon1">
							<p id="role-name-add-notice" class="role-add-notice">*请输入角色名</p>
						</div>
						<br><br>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label" style="font-size: 20px;">菜单*</label>
							<div class="col-sm-10">
								<c:forEach items="${menuList}" var="menus" varStatus="status">
									<label class="checkbox-inline" style="font-size: 18px;"> <input type="checkbox"
										class="menus-class" name="menus[${ status.index + 1}].id"  value="${menus.id }"> ${menus.menuName }
									</label>
									<br><br>
								</c:forEach>
							</div>
							<!-- <p id="role-notice" class="role-add-notice">*至少选择一个</p> -->
						</div>
							<button type="button" id="editRoleButton" class="btn btn-primary btn-lg btn-block">修改</button>
						
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