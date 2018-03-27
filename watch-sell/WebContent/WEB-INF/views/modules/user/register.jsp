<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link href="${ctxStatic}/resources/css/register_style.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(function() {
		$('.user-reg-yanz-img').click(
				function() {
					var time = new Date().getTime();
					$(this).attr(
							'src',
							'${pageContext.request.contextPath}/b/check/code?d='
									+ time);
				});
	});
</script>
</head>
<body>
	<div id="reg-head">图标</div>
	<div id="reg-re">
		<div id="reg-re-reg">
			<p>注册名表会员</p>
			<form action="${pageContext.request.contextPath }/b/add" method="post">
			<input class="user-reg-input" type="text" name="userName" placeholder="用户名" /> <br />
			<input class="user-reg-input" type="text" name="email" placeholder="邮箱" /> <br />
			<input class="user-reg-input" type="text" placeholder="图形验证码" /> <img
				class="user-reg-yanz-img" alt="验证码"
				src="${pageContext.request.contextPath}/b/check/code"><br />
			<input id="email-input-code" class="user-reg-input" type="text"
				placeholder="邮箱验证码" /> <input id="email-button" type="button"
				value="获取验证码" /> <br /> <input class="user-reg-input"
				type="password" name="password" placeholder="密码" /> <br /> <input
				class="user-reg-input" type="password" placeholder="确认密码" /> <br />
			<input id="user-reg-button" type="submit" value="立即注册" />
			</form>
		</div>

	</div>
</body>
</html>