<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表网</title>
<link href="${ctxStatic}/resources/css/login_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctxStatic}/resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){
	//刷新验证码
	$('#lg-yanz-img').click(function(){
		var time = new Date().getTime();
		$(this).attr('src','${pageContext.request.contextPath}/b/check/code?d='+time);
	});
	document.getElementById("user-name-p").style.visibility="hidden";
	document.getElementById("passward-p").style.visibility="hidden";
	document.getElementById("yanz-p").style.visibility="hidden";
	
	$('#user-log-button').click(function(){
		$('.message-p').html("&nbsp;");
		document.getElementById("user-name-p").style.visibility="hidden";
		document.getElementById("passward-p").style.visibility="hidden";
		document.getElementById("yanz-p").style.visibility="hidden";
		var userName = $('#userName').val();
		var password = $('#password').val();
		var yanz = $('#lg-img').val();
		var key = true;
		if (userName == '' || userName == null) {
			document.getElementById("user-name-p").style.visibility="visible";
			key = false;
		}
		if (password == '' || password == null) {
			document.getElementById("passward-p").style.visibility="visible";
			key = false;
		}
		if (yanz == '' || yanz == null) {
			document.getElementById("yanz-p").style.visibility="visible";
			key = false;
		}
		if (key) {
			/* var jsonObj = JSON.stringify({"email":userName,
				"password":password,
				"checkCode":yanz,
				});
			$.ajax({  
			    type: "POST",  
			    url: "${pageContext.request.contextPath }/sys/user/sigin",  
			    data:jsonObj,  
			    async: false, 
			    contentType:"application/json;charset=utf-8",
			    error: function(data) {  
			        alert("登录失败");  
			    },  
			    success: function(data) {
			    	alert(data);
			    }  
			  }); */
			  $("#signinForm").submit();
		}

	});
});
</script>
</head>
<body>
	<div id="lg-head" style="margin-left: 120px;margin-top: 30px;">
	<img src="${ctxStatic}/resources/img/20180408140857.png" height="45px" />
	</div>
	<div id="lg-zong">
		<img src="${ctxStatic}/resources/img/0804923a26414d188686dc39f12d9de3.png" height="580px"
			width="1341px" />
		
		<div id="lg-zong-login">
			<div id="lg-zong-login-p">
				<form id="signinForm" action="${pageContext.request.contextPath }/b/signin" method="post">
				<p class="lg-zong-head">会员登录</p>
				<p class="notice-p message-p">&nbsp;${message}</p>
				<input class="user-log-input" id="userName" name="email" type="text" placeholder="用户名" /> <br>
				<p id="user-name-p" class="notice-p">*请输入用户名</p>
				<input class="user-log-input" id="password" name="password" type="password" placeholder="密码" /> <br>
				<p id="passward-p" class="notice-p">*请输入密码</p>
				<input id="lg-img" class="user-log-input" name="checkCode" type="text" placeholder="图形验证码" /> 
				<img id="lg-yanz-img" src="${pageContext.request.contextPath}/b/check/code">
				<p id="yanz-p" class="notice-p">*请输入验证码</p>
				<input id="user-log-button" type="button" value="立即登录" />
				</form>
			</div>
			<p id="register-p">
				<a id="register-a" href="${pageContext.request.contextPath }/b/register">免费注册</a>
			</p>
			<p id="lg-zong-but">名表特售|优质服务</p>
		</div>
	</div>
</body>
</html>