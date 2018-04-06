<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
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
	<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
	<div class="container-fluid">
		<div class="row">
		<%@ include file="/WEB-INF/views/modules/fore/user/leftUser.jsp"%>
			<div class="col-md-10">
				<div class="col-md-5 col-md-offset-1">
				<br><br>
					<form id="headerUserForm" class="form-horizontal" action="" method="post">
						<input type="hidden" name="id" value="${gUser.id}">
						
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">旧密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="old-password"
									name="password"  placeholder="旧密码">
							</div>
							<p id="user-name-notice" class="header-user-notice">*请输入旧密码</p>
						</div>
						
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="new-password"
									name="newPassword"  placeholder="新密码">
							</div>
							<p id="phone-num-notice" class="header-user-notice">*请输入新密码</p>
						</div>
						
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="new-password"
									name="phoneNum"  placeholder="确认密码">
							</div>
							<p id="phone-num-notice" class="header-user-notice">*请输入新密码</p>
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

	</div>
</body>
</html>