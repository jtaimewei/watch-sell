<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/modules/back/header/backHeader.jsp"%>
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
.message-p {
	margin-top: 8px;
	color: red;
	margin-left: 200px;
}

.form-group {
	margin-top: 20px;
}
#notice-div{
	position: fixed;
	z-index: 999;
	left: 500px;
    top: 160px;
}

</style>
<script type="text/javascript">
	$(function(){
		$(".header-user-notice").hide();
		$("#notice-div").hide();
		
		$("#editPasswordButton").click(function(){
			$(".header-user-notice").hide();
			$("#notice-div").hide();
			var key = true;
			$("#password-div").find(".form-control").each(function(){
				if ($(this).val() == '') {
					key = false;
					$(this).parent().next().show();
				}
			});
			
			if ($("#new-password").val() != '' && $("#g-password").val() != '' && $("#new-password").val() != $("#g-password").val()) {
				key = false;
				$("#notice-div").html("2次密码不一致");
				$("#notice-div").show();
			}
			if (key == true) {
				$("#editPasswordForm").submit();
			}
			
			
		});
	});

</script>
</head>
<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="thumbnail rigthDiv">
			  <div class="caption">
			<ul class="nav nav-tabs">
					<li role="presentation" ><a href="${pageContext.request.contextPath}/a/headerUser">个人信息</a></li>
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/user/editPassword">修改密码</a></li>
				</ul>
				<div class="row">
			<div id="password-div" class="col-md-8 col-md-offset-2">
			<div id="notice-div" class="alert alert-danger" style="padding: 5px;" role="alert"></div>
				<p class="message-p">${message}</p><br>
					<form id="editPasswordForm" class="form-horizontal" action="${pageContext.request.contextPath}/a/user/password/edit" method="post">
						
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">旧密码</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="old-password"
									name="password"  placeholder="旧密码">
							</div>
							<p class="header-user-notice">*请输入旧密码</p>
						</div>
						
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">新密码</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="new-password"
									name="newPassword"  placeholder="新密码">
							</div>
							<p class="header-user-notice">*请输入新密码</p>
						</div>
						
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">确认密码</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="g-password"
									name="cPassword"  placeholder="确认密码">
							</div>
							<p class="header-user-notice">*请输入新密码</p>
						</div>
			
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-10">
								<button type="button" id="editPasswordButton" class="btn btn-default">修改</button>
							</div>
						</div>
					</form>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
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