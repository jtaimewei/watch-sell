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
		// console.log(roles);
		//判断选择的必须数据是否 有数据
		$("#addButton").click(function(){
			$(".header-user-notice").hide();
			var key = true;
			if ($("#email").val() == null || $("#email").val() == '') {
				key = false;
				$("#email-notice").show();
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
				$("#addUserForm").submit();
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
				<ul class="nav nav-tabs">
					<li role="presentation"><a
						href="${pageContext.request.contextPath }/a/user/list">用户列表</a></li>
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/user/toadd">添加用户</a></li>
				</ul>
				<br>
				<div class="col-md-6 col-md-offset-1">
					<form id="addUserForm" class="form-horizontal" action="${pageContext.request.contextPath }/a/user/add"
						method="post">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">登录名*</label>
							<div class="col-sm-10">
								<input type="text" id="email" name="email" class="form-control" value="">
							</div>
							<p id="email-notice" class="header-user-notice">*请输入登录名</p>
						</div>
						<!-- <div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">用户名*</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userName"
									name="userName" value="" placeholder="用户名">
							</div>
							<p id="user-name-notice" class="header-user-notice">*请输入用户名</p>
						</div> -->
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">密码*</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password"
									name="password" value="" placeholder="密码">
							</div>
							<p id="password-notice" class="header-user-notice">*请输入密码</p>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<select name="sex" form="addUserForm" class="selectpicker">
									<option value="">请选择</option>
									<option value="0">女</option>
									<option value="1">男</option>
								</select>
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">生日</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="birthday"
									name="birthday" value=""
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});">
							</div>
							<p id="birthday-notice" class="header-user-notice">*请输入生日</p>
						</div> -->
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">用户类型</label>
							<div class="col-sm-10">
							<select name="userType" form="addUserForm" class="selectpicker">
									<option value="1">客服</option>
									<option value="2">管理员</option>
								</select>
								
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">电话号码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="phoneNum"
									name="phoneNum" value="" placeholder="电话号码">
							</div>
							<p id="phone-num-notice" class="header-user-notice">*请输入电话号码</p>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">角色*</label>
							<div class="col-sm-10">
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
								<button type="button" id="addButton" class="btn btn-default">增加</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>