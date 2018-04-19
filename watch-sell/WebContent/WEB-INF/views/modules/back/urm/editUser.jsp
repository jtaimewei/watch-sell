<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户</title>
<script type="text/javascript" src="${ctxStatic}/resources/js/jquery-1.11.3.js"></script>
<style type="text/css">
.header-user-notice {
	white-space: nowrap;
	margin-top: 8px;
	color: red;
}

.form-group {
	margin-top: 20px;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".header-user-notice").hide();
		var roles = [];
		var roleids = ${roleids};
		$(".roles-class").each(function(){
			//roles.push($(this).val());
			for(i = 0 ; i <roleids.length;i++){
				if (roleids[i] == $(this).val()){
					$(this).attr("checked","checked");
				}
			}
		});
		// console.log(roles);
		//判断选择的必须数据是否 有数据
		$("#editButton").click(function(){
			$(".header-user-notice").hide();
			var key = true;
			if ($("#userName").val() == null || $("#userName").val() == '') {
				key = false;
				$("#user-name-notice").show();
			}
			 if ($("#password").val() == null || $("#password").val() == '') {
				key = false;
				$("#password-notice").show();
			}
			var  len = $("input[type='checkbox']:checked").length;
			if (len < 1) {
				key = false;
				$("#role-notice").show();
			}
			if (key == true){
				$("#editUserForm").submit();
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
					<li role="presentation"><a
						href="${pageContext.request.contextPath }/a/user/list">用户列表</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/a/user/toadd">添加用户</a></li>
					<li role="presentation" class="active"><a href="#">修改用户</a></li>
				</ul>
				<br>
				<div class="row">
				<div class="col-md-8 col-md-offset-1">
					<form id="editUserForm" class="form-horizontal" action="${pageContext.request.contextPath }/a/user/edit"
						method="post">
						<input type="hidden" name="id" value="${user.id}">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-6">
								<input type="email" class="form-control" value="${user.email}"
									disabled="disabled">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">用户名*</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="userName"
									name="userName" value="${user.userName}" placeholder="用户名">
							</div>
							<p id="user-name-notice" class="header-user-notice">*请输入用户名</p>
						</div>
			
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-6">
								<select name="sex" form="editUserForm" class="selectpicker">
									<option value="">请选择</option>
									<option value="0" ${user.sex == '0'?'selected="selected"':''}>女</option>
									<option value="1" ${user.sex == '1'?'selected="selected"':''}>男</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">生日</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="birthday"
									name="birthday" value="${user.birthday}"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});">
							</div>
							<p id="birthday-notice" class="header-user-notice">*请输入生日</p>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">用户类型</label>
							<div class="col-sm-6">
								<c:if test="${user.userType == '0'}">
									<input type="text" class="form-control" value="顾客"
										disabled="disabled">
								</c:if>
								<c:if test="${user.userType == '1'}">
									<input type="text" class="form-control" value="客服"
										disabled="disabled">
								</c:if>
								<c:if test="${user.userType == '2'}">
									<input type="text" class="form-control" value="管理员"
										disabled="disabled">
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">电话号码</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="phoneNum"
									name="phoneNum" value="${user.phoneNum}" placeholder="电话号码">
							</div>
							<p id="phone-num-notice" class="header-user-notice">*请输入电话号码</p>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">角色*</label>
							<div class="col-sm-6">
								<c:forEach items="${roles}" var="role" varStatus="status">
									<label class="checkbox-inline"> <input type="checkbox"
										class="roles-class" name="roles[${ status.index + 1}].id"  value="${role.id }"> ${role.roleName }
									</label>
								</c:forEach>
							</div>
							<p id="role-notice" class="header-user-notice">*至少选择一个角色</p>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" id="editButton" class="btn btn-default">修改</button>
							</div>
						</div>
					</form>
				</div>
				</div>
			</div>
			</div>
			</div>

		</div>
	</div>
</body>
</html>