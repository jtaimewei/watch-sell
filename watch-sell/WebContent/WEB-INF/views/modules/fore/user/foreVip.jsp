<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表网</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>
<body>
	<br>
	
	<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
	<div class="container-fluid">
		<div class="row">
		<%@ include file="/WEB-INF/views/modules/fore/user/leftUser.jsp"%>
			<div class="col-md-10">
				<div class="thumbnail myDiv">
			      <div class="caption">
				<br><br>
				<h3><span class="label label-default">vip级别:</span>&nbsp;&nbsp;&nbsp;&nbsp;${gUser.vip}</h3>
				<h3><span class="label label-default">会员积分:</span>&nbsp;&nbsp;&nbsp;&nbsp;${gUser.credits}</h3>
				<br><br><br><br><br><br>
			</div>
			</div>
			</div>
		</div>

	</div>
</body>
</html>