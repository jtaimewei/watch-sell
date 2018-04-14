<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表首页</title>
<link href="${ctxStatic}/fore/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${ctxStatic}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
			//alert(window.screen.width);
			$(function() {
				//导航栏下红杠效果
				$("#navigationbar2_ul_li_a1").mouseover(function() {
					$("#navigationbar2_ul_li_a1").css("border-bottom", "6px #A52A2A solid");
				});
				$("#navigationbar2_ul_li_a1").mouseout(function() {
					$("#navigationbar2_ul_li_a1").css("border-bottom", " none");
				});
				$("#navigationbar2_ul_li_a2").mouseover(function() {
					$("#navigationbar2_ul_li_a2").css("border-bottom", "6px #A52A2A solid");
				});
				$("#navigationbar2_ul_li_a2").mouseout(function() {
					$("#navigationbar2_ul_li_a2").css("border-bottom", " none");
				});
				$("#navigationbar2_ul_li_a3").mouseover(function() {
					$("#navigationbar2_ul_li_a3").css("border-bottom", "6px #A52A2A solid");
				});
				$("#navigationbar2_ul_li_a3").mouseout(function() {
					$("#navigationbar2_ul_li_a3").css("border-bottom", " none");
				});
				$("#navigationbar2_ul_li_a4").mouseover(function() {
					$("#navigationbar2_ul_li_a4").css("border-bottom", "6px #A52A2A solid");
				});
				$("#navigationbar2_ul_li_a4").mouseout(function() {
					$("#navigationbar2_ul_li_a4").css("border-bottom", " none");
				});
				$("#navigationbar2_ul_li_a5").mouseover(function() {
					$("#navigationbar2_ul_li_a5").css("border-bottom", "6px #A52A2A solid");
				});
				$("#navigationbar2_ul_li_a5").mouseout(function() {
					$("#navigationbar2_ul_li_a5").css("border-bottom", " none");
				});
				/*$("#navigationbar2_ul_li_a6").mouseover(function(){
					$("#navigationbar2_ul_li_a6").css("border-bottom","6px #A52A2A solid");
				});
				$("#navigationbar2_ul_li_a6").mouseout(function(){
					$("#navigationbar2_ul_li_a6").css("border-bottom"," none");
				});*/
				$('#navigationbar2 li:eq(5)').hover(function() {
					$("#navigationbar2_ul_li_a6").css("border-bottom", "6px #A52A2A solid");
					//$(this).find('#navigationbar2_ul_li_a6_ul').css('display', 'block');
					$(this).find('#navigationbar2_ul_li_a6_ul').fadeIn();
				}, function() {
					//$(this).find('#navigationbar2_ul_li_a6_ul').css('display', 'none');
					$(this).find('#navigationbar2_ul_li_a6_ul').fadeOut();
					$("#navigationbar2_ul_li_a6").css("border-bottom", " none");
				});
				$("#navigationbar2_ul_li_a6_ul a").hover(function() {
					$(this).css("color", "#B32424");
				}, function() {
					$(this).css("color", "black");
				});
				/*轮播导航栏鼠标事件*/
				$(".slider-select_div").hover(function(){
					$(this).css({
						"opacity":"1","background-color":"white"
					});
					$(this).find("a").css("color","#000000");
					
				},function(){
					$(this).css({
						"opacity":"0.8","background-color":"#2E2E2E"
					});
					$(this).find("a").css("color","white");
				});
				
			});
		</script>

</head>
<body style="overflow-x:hidden ;">
		<div id="headmiddle">
			<div id="headmiddle1">
				<img src="${ctxStatic}/resources/img/20180408140857.png" height="45px" />

			</div>
			<div id="headmiddle2">
				<img src="${ctxStatic}/resources/img/adelodimsdkeidjsmqq.gif" />
			</div>
			<div id="headmiddle3">
				<form action="${pageContext.request.contextPath }/b/watch/searchAll" method="post">
					<input id="headmiddle3_text" name="name" value="${name }" type="text" />
					<input id="headmiddle3_submit" type="submit" value="搜索" />
				</form>
			</div>
			<div id="headmiddle4">
				<a href="${pageContext.request.contextPath }/b/user/cart">
				<button>
				购物车
				<c:if test="${cartNumber != null}">
				(${cartNumber})
				</c:if>
				</button>
				</a>
			</div>
		</div>
		<div id="navigationbar">
			<div id="navigationbar1">
				<center>
					<a href="">全部腕表</a>
				</center>
			</div>
			<div id="navigationbar2" style="margin-top: 18px;">
				<ul>
					<li><a id="navigationbar2_ul_li_a1" href="">钟表文化</a></li>
					<li><a id="navigationbar2_ul_li_a2" href="">会员福利</a></li>
					<li><a id="navigationbar2_ul_li_a3" href="">全球购表</a></li>
					<li><a id="navigationbar2_ul_li_a4" href="">名匠维修</a></li>
					<li><a id="navigationbar2_ul_li_a5" href="">线下体验</a></li>
					<li><a id="navigationbar2_ul_li_a6" href="">选表中心</a>
						<ul id="navigationbar2_ul_li_a6_ul">
							<li>
								<div>
									<br />
									<a href="" style="font-size: 26px;font-weight: bold;">男表</a><a style="font-size: 30px;font-weight: bold;float: right;margin-right: 3px;font-family:simsun ;" href="">></a>
									<br /><br />
									<img src="${ctxStatic}/resources/img/148738149447936.jpg" />
									<br /><br />
									<a class="navigationbar_class" href="">款式风格></a><span> <a href="">正装</a><a href="">商务休闲</a><a href="">时尚</a><a href="">运动</a><a href="">&sdot;&sdot;&sdot;</a></span>
									<br />
									<hr />
									<a class="navigationbar_class" href="">价格区间></a><span> <a href="">1千-3千</a><a href="">3千-5千</a><a href="">5千-1万</a><a href="">&sdot;&sdot;&sdot;</a></span>
									<br />
									<hr />
									<a class="navigationbar_class" href="">品牌优选></a><span><a href="">赫柏林</a><a href="">浪琴</a><a href="">DAVOSA</a><a href="">天梭</a><a href="" style="margin-left: -2px;">&sdot;&sdot;&sdot;</a>
															<br/><a href="" style="margin-left: 85px;">爱宝时</a><a href="">柏高</a><a href="">欧米茄</a></span>
								</div>
							</li>
							<li>
								<div>
									<br />
									<a href="" style="font-size: 26px;font-weight: bold;">女表</a><a style="font-size: 30px;font-weight: bold;float: right;margin-right: 3px;font-family:simsun ;" href="">></a>
									<br /><br />
									<img src="${ctxStatic}/resources/img/148738149493915.jpg" />
									<br /><br />
									<a class="navigationbar_class" href="">款式风格></a><span> <a href="">正装</a><a href="">商务休闲</a><a href="">时尚</a><a href="">运动</a><a href="">&sdot;&sdot;&sdot;</a></span>
									<br />
									<hr />
									<a class="navigationbar_class" href="">价格区间></a><span> <a href="">1千-3千</a><a href="">3千-5千</a><a href="">5千-1万</a><a href="">&sdot;&sdot;&sdot;</a></span>
									<br />
									<hr />
									<a class="navigationbar_class" href="">品牌优选></a><span><a href="">赫柏林</a><a href="">浪琴</a><a href="">DAVOSA</a><a href="">天梭</a><a href="" style="margin-left: -2px;">&sdot;&sdot;&sdot;</a>
															<br/><a href="" style="margin-left: 85px;">爱宝时</a><a href="">柏高</a><a href="">欧米茄</a></span>
								</div>
							</li>
							<li>
								<div><br />
									<a href="" style="font-size: 26px;font-weight: bold;">闪购</a><a style="font-size: 30px;font-weight: bold;float: right;margin-right: 3px;font-family:simsun ;" href="">></a>
									<br /><br />
									<img src="${ctxStatic}/resources/img/148738149462755.jpg" />
									<br /><br />
									<a class="navigationbar_class" href="">款式风格></a><span> <a href="">正装</a><a href="">商务休闲</a><a href="">时尚</a><a href="">运动</a><a href="">&sdot;&sdot;&sdot;</a></span>
									<br />
									<hr />
									<a class="navigationbar_class" href="">价格区间></a><span> <a href="">1千-3千</a><a href="">3千-5千</a><a href="">5千-1万</a><a href="">&sdot;&sdot;&sdot;</a></span>
									<br />
									<hr />
									<a class="navigationbar_class" href="">品牌优选></a><span><a href="">赫柏林</a><a href="">浪琴</a><a href="">DAVOSA</a><a href="">天梭</a><a href="" style="margin-left: -2px;">&sdot;&sdot;&sdot;</a>
															
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>

		</div>


</body>
</html>