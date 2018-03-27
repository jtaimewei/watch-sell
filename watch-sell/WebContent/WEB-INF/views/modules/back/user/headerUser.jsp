<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台个人信息</title>
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
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/back/header/backHeader.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5 col-md-offset-2">
				<form id="headerUserForm" class="form-horizontal" action="" method="post">
					<input type="hidden" name="id" value="${userOwn.id}">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-10">
							<input type="email" class="form-control"
								value="${userOwn.email}" disabled="disabled">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userName"
								name="userName" value="${userOwn.userName}" placeholder="用户名">
						</div>
						<p id="user-name-notice" class="header-user-notice">*请输入用户名</p>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="password"
								name="password" value="${userOwn.password}" placeholder="密码">
						</div>
						<p id="password-notice" class="header-user-notice">*请输入密码</p>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-10">
							<select name="sex" form="headerUserForm" class="selectpicker">
								<option value="" >请选择</option>
								<option value="0" ${userOwn.sex == '0'?'selected="selected"':''}>女</option>
								<option value="1" ${userOwn.sex == '1'?'selected="selected"':''}>男</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">生日</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="birthday"
								name="birthday" value="${userOwn.birthday}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});">
						</div>
						<p id="birthday-notice" class="header-user-notice">*请输入生日</p>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">用户类型</label>
						<div class="col-sm-10">
						<c:if test="${userOwn.userType == '0'}">
							<input type="text" class="form-control" 
								value="顾客" disabled="disabled">
						</c:if>
						<c:if test="${userOwn.userType == '1'}">
							<input type="text" class="form-control" 
								value="客服" disabled="disabled">
						</c:if>
						<c:if test="${userOwn.userType == '2'}">
							<input type="text" class="form-control" 
								value="管理员" disabled="disabled">
						</c:if>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">电话号码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="phoneNum"
								name="phoneNum" value="${userOwn.phoneNum}" placeholder="电话号码">
						</div>
						<p id="phone-num-notice" class="header-user-notice">*请输入电话号码</p>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">修改</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>