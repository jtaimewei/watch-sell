<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表首页</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link href="${ctxStatic}/fore/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctxStatic}/resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
			//alert(window.screen.width);
			$(function() {
				//导航栏顶部广告部分X点击隐藏广告部分
				$("#headad span").click(function() {
					$("#headad").hide();
				});
				//导航栏顶部字体鼠标经过颜色变白色
				//导航栏顶部字体鼠标离开颜色变回
				$("#headtop_ul_li_a1").mouseover(function() {
					$("#headtop_ul_li_a1").css("color", "white");
				});
				$("#headtop_ul_li_a1").mouseout(function() {
					$("#headtop_ul_li_a1").css("color", "lightgrey");
				});
				//
				$("#headtop_ul_li_a2").mouseover(function() {
					$("#headtop_ul_li_a2").css("color", "white");
				});
				$("#headtop_ul_li_a2").mouseout(function() {
					$("#headtop_ul_li_a2").css("color", "lightgrey");
				});
				//
				$("#headtop_ul_li_a3").mouseover(function() {
					$("#headtop_ul_li_a3").css("color", "white");
				});
				$("#headtop_ul_li_a3").mouseout(function() {
					$("#headtop_ul_li_a3").css("color", "lightgrey");
				});
				$('#headtop li:eq(4)').hover(function() {
					$("#headtop_ul_li_a4").css({
						"color": "#333333",
						"background-color": "white"
					});
					//$(this).find('#headtop_ul_li_a4_ul').css('display', 'block');
					$(this).find('#headtop_ul_li_a4_ul').slideDown();
				}, function() {
					//$(this).find('#headtop_ul_li_a4_ul').css('display', 'none');
					$(this).find('#headtop_ul_li_a4_ul').slideUp();
					$("#headtop_ul_li_a4").css({
						"color": "lightgrey",
						"background-color": "#333333"
					});
				});
				//
				$("#headtop_ul_li_a5").mouseover(function() {
					$("#headtop_ul_li_a5").css("color", "white");
				});
				$("#headtop_ul_li_a5").mouseout(function() {
					$("#headtop_ul_li_a5").css("color", "lightgrey");
				});
				//
				$("#headtop_ul_li_a6").mouseover(function() {
					$("#headtop_ul_li_a6").css("color", "white");
				});
				$("#headtop_ul_li_a6").mouseout(function() {
					$("#headtop_ul_li_a6").css("color", "lightgrey");
				});
				//搜索栏聚焦失焦事件
				$('#headmiddle3_text').bind('input propertychange', function() {
					headmiddle3textcheck();
				});

				function headmiddle3textcheck() {
					var subvalue = $("#headmiddle3_text").val();
					if (subvalue == "") {
						$("#headmiddle3_submit").hide();
					} else {
						$("#headmiddle3_submit").show();
					}
				};
				$("#headmiddle3_text").blur(function() {
					var subvalue = $(this).val();
					if (subvalue == "") {
						$("#headmiddle3_submit").hide();
					} else {
						$("#headmiddle3_submit").show();
					}
				});
				
				
				
			});
		</script>
		
</head>
<body style="overflow-x:hidden ;">
<div id="headad">
			<span>&times;</span>
		</div>
		<div id="headtop">
			<ul>
				<li><a id="headtop_ul_li_a4" href="">服务专线</a>
					<ul id="headtop_ul_li_a4_ul">
						<li><a href="#">订单0111</a></li>
						<li><a href="#">订单0222</a></li>
						<li><a href="#">订单0333</a></li>
						<li><a href="#">订单0333</a></li>
						<hr width="80%" style="margin-left: -2px;" />
						<a href="">查看更多订单</a>
					</ul>
				</li>
				<li><a id="headtop_ul_li_a2" href="">办理业务</a></li>
				<li><a id="headtop_ul_li_a3" href="">手机表行</a></li>
				
				
				<c:if test="${empty gUser}">
				<li>|</li>
				<li><a id="headtop_ul_li_a5" href="${pageContext.request.contextPath }/b/register">注册</a></li>
				<li><a id="headtop_ul_li_a6" href="${pageContext.request.contextPath }/b/login">登录</a></li>
				</c:if>
				<c:if test="${!empty gUser}">
				<li>|</li>
				<li><a href="" id="headtop_ul_li_a1">我的订单</a></li>
				<li>|</li>
				<li><a href="${pageContext.request.contextPath}/b/logout">注销</a></li>
				<li><a id="headtop_ul_li_a5" href="${pageContext.request.contextPath}/b/user/own">${gUser.userName }</a></li>
				</c:if>
				<li><a href="${pageContext.request.contextPath}/b/index">首页</a></li>
			</ul>
		</div>

		

</body>
</html>