<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>
<body>
	<br>
	
	<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
	<div class="container-fluid">
		<div class="row">
		<%@ include file="/WEB-INF/views/modules/fore/user/leftUser.jsp"%>
			<div class="col-md-10">
				<div id="password-div" class="col-md-5 col-md-offset-1">
				<br><br>
				<h3><span class="label label-default">vip级别:</span>&nbsp;&nbsp;&nbsp;&nbsp;${gUser.vip}</h3>
				<h3><span class="label label-default">会员积分:</span>&nbsp;&nbsp;&nbsp;&nbsp;${gUser.credits}</h3>
				</div>
			</div>
		</div>

	</div>
</body>
</html>