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
		$(".notic-label").hide();
		//验证码换图
		$('.user-reg-yanz-img').click(
				function() {
					var time = new Date().getTime();
					$(this).attr(
							'src',
							'${pageContext.request.contextPath}/b/check/code?d='
									+ time);
				});
		//检查 输入为空-密码不一致
		$("#user-reg-button").click(function(){
			$(".notic-label").hide();
			$("#notice-div").html("");
			var key = true;
			if ($("#userName").val()=='') {
				$("#userName-label").show();
				key = false;
			}
			if ($("#email").val()=='') {
				$("#email-label").show();
				key = false;
			}
			if ($("#checkCode").val()=='') {
				$("#checkCode-label").show();
				key = false;
			}
			if ($("#email-input-code").val()=='') {
				$("#email-input-code-label").show();
				key = false;
			}
			if ($("#f-password").val()=='') {
				$("#f-password-label").show();
				key = false;
			}
			if ($("#s-password").val()=='') {
				$("#s-password-label").show();
				key = false;
			}
			if ($("#f-password").val()!='' && $("#s-password").val()!=''&& $("#f-password").val()!=$("#s-password").val()) {
				$("#notice-div").html("2次密码不一致");
				key = false;
			}
			if (key == true){
				$("#regForm").submit();
			}
		});
		//点击获取验证码
		$("#email-button").click(function(){
			$("#notice-div").html("");
			$("#email-label").hide();
			if ($("#email").val()=='') {
				$("#email-label").show();
				return;
			}
			var email = $("#email").val();
			alert(email);
			$.ajax({  
			    type: "POST",  
			    url: "${pageContext.request.contextPath}/b/email",  
			    data:{"email":email},  
			    async: false,
			    error: function() {  
			        alert("获取失败");  
			    },  
			    success: function(data) {
			    	$("#notice-div").html(data);
			    	}
			    	
			    });
		});
		
		
		
	});
</script>
</head>
<body>
	<div id="reg-head">图标</div>
	<div id="reg-re">
	
		<div id="reg-re-reg">
			<p>注册名表会员</p>
			<div id="notice-div" style="color: red;margin-left: 350px;">
			${message}
			</div>
			<form id="regForm" action="${pageContext.request.contextPath }/b/user/add" method="post">
			<input class="user-reg-input" type="text" id="userName" name="userName" placeholder="用户名" /><label id="userName-label" class="notic-label">&nbsp;*不能为空</label> <br />
			<input class="user-reg-input" type="text" id="email" name="email" placeholder="邮箱" /><label id="email-label" class="notic-label">&nbsp;*不能为空</label> <br />
			<input class="user-reg-input" id="checkCode" name="checkCode" type="text" placeholder="图形验证码" /> <img class="user-reg-yanz-img" alt="验证码" src="${pageContext.request.contextPath}/b/check/code"><label id="checkCode-label" class="notic-label">&nbsp;*不能为空</label><br />
			<input class="user-reg-input" id="email-input-code" name="emailCode" type="text" placeholder="邮箱验证码" /> <input id="email-button" type="button"
				value="获取验证码" /><label id="email-input-code-label" class="notic-label">&nbsp;*不能为空</label> <br /> 
			<input class="user-reg-input" type="password" id="f-password" name="password" placeholder="密码" /><label id="f-password-label" class="notic-label">&nbsp;*不能为空</label> <br /> 
			<input class="user-reg-input" type="password" id="s-password" placeholder="确认密码" /><label id="s-password-label" class="notic-label">&nbsp;*不能为空</label> <br />
			<input id="user-reg-button" type="button" value="立即注册" />
			</form>
		</div>

	</div>
</body>
</html>