<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表网</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
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
		$("#user-name-notice").hide(); 
		$("#editUserButton").click(function(){
			$("#user-name-notice").hide(); 
			if ($("#userName").val() == '') {
				$("#user-name-notice").show();
				return;
			}
			$("#headUserForm").submit();
		})
	});

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
	<div class="container-fluid">
		<div class="row">
		<%@ include file="/WEB-INF/views/modules/fore/user/leftUser.jsp"%>
			<div class="col-md-10">
				<div class="col-md-5 col-md-offset-1">
					<form id="headUserForm" class="form-horizontal" action="${pageContext.request.contextPath}/b/user/edit" method="post">
						<input type="hidden" name="id" value="${gUser.id}">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="email" class="form-control"
									value="${gUser.email}" disabled="disabled">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userName"
									name="userName" value="${gUser.userName}" placeholder="用户名">
							</div>
							<p id="user-name-notice" class="header-user-notice">*请输入用户名</p>
						</div>
						
						<div class="form-group">
							<label for="inputPassword4" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<select name="sex" form="headUserForm" class="selectpicker">
									<option value="" >请选择</option>
									<option value="0" ${gUser.sex == '0'?'selected="selected"':''}>女</option>
									<option value="1" ${gUser.sex == '1'?'selected="selected"':''}>男</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">生日</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="birthday"
									name="birthday" readonly="readonly" value="${gUser.birthday}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});">
							</div>
						</div>
			
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">手机号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="phoneNum"
									name="phoneNum" value="${gUser.phoneNum}" placeholder="电话号码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button id="editUserButton" type="button" class="btn btn-default">修改</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>