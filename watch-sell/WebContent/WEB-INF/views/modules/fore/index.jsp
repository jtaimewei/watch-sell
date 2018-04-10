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
		<script type="text/javascript">
			$(document).ready(function() {
				var length,
					currentIndex = 0,
					interval,
					hasStarted = false, //是否已经开始轮播 
					t = 3000; //轮播时间间隔 
				length = $('.slider-panel').length;
				//将除了第一张图片隐藏 
				$('.slider-panel:not(:first)').hide();
				//将第一个slider-item设为激活状态 
				$('.slider-item:first').addClass('slider-item-selected');
				//隐藏向前、向后翻按钮 
				$('.slider-page').hide();
				//鼠标上悬时显示向前、向后翻按钮,停止滑动，鼠标离开时隐藏向前、向后翻按钮，开始滑动 
				$('.slider-panel, .slider-pre, .slider-next').hover(function() {
					stop();
					$('.slider-page').show();
				}, function() {
					$('.slider-page').hide();
					start();
				});
				$('.slider-item').hover(function(e) {
					stop();
					var preIndex = $(".slider-item").filter(".slider-item-selected").index();
					currentIndex = $(this).index();
					play(preIndex, currentIndex);
				}, function() {
					start();
				});
				$('.slider-pre').unbind('click');
				$('.slider-pre').bind('click', function() {
					pre();
				});
				$('.slider-next').unbind('click');
				$('.slider-next').bind('click', function() {
					next();
				});
				/** 
				 * 向前翻页 
				 */
				function pre() {
					var preIndex = currentIndex;
					currentIndex = (--currentIndex + length) % length;
					play(preIndex, currentIndex);
				}
				/** 
				 * 向后翻页 
				 */
				function next() {
					var preIndex = currentIndex;
					currentIndex = ++currentIndex % length;
					play(preIndex, currentIndex);
				}
				/** 
				 * 从preIndex页翻到currentIndex页 
				 * preIndex 整数，翻页的起始页 
				 * currentIndex 整数，翻到的那页 
				 */
				function play(preIndex, currentIndex) {
					$('.slider-panel').eq(preIndex).fadeOut(500)
						.parent().children().eq(currentIndex).fadeIn(1000);
					$('.slider-item').removeClass('slider-item-selected');
					$('.slider-item').eq(currentIndex).addClass('slider-item-selected');
				}
				/** 
				 * 开始轮播 
				 */
				function start() {
					if (!hasStarted) {
						hasStarted = true;
						interval = setInterval(next, t);
					}
				}
				/** 
				 * 停止轮播 
				 */
				function stop() {
					clearInterval(interval);
					hasStarted = false;
				}
				//开始轮播 
				start();
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
				<li><a href="${pageContext.request.contextPath}/b/user/order/myOrder?userId=${gUser.id}" id="headtop_ul_li_a1">我的订单</a></li>
				<li>|</li>
				<li><a href="${pageContext.request.contextPath}/b/logout">注销</a></li>
				<li><a id="headtop_ul_li_a5" href="${pageContext.request.contextPath}/b/user/own">${gUser.userName }&nbsp;[${gUser.vip}]</a></li>
				</c:if>
				<li><a href="${pageContext.request.contextPath}/b/index">首页</a></li>
			</ul>
		</div>

		<div id="headmiddle">
			<div id="headmiddle1">
				<img src="${ctxStatic}/resources/img/20180408140857.png" height="45px" />

			</div>
			<div id="headmiddle2">
				<img src="${ctxStatic}/resources/img/adelodimsdkeidjsmqq.gif" />
			</div>
			<div id="headmiddle3">
				<form action="" method="">
					<input id="headmiddle3_text" type="text" />
					<input id="headmiddle3_submit" type="submit" value="搜索" />
				</form>
			</div>
			<div id="headmiddle4">
				<a href="${pageContext.request.contextPath }/b/user/cart"><button>购物车</button></a>
			</div>
		</div>
		<div id="navigationbar">
			<div id="navigationbar1">
				<center>
					<a href="">全部腕表</a>
				</center>
			</div>
			<div id="navigationbar2">
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
		<div class="slider">
			<ul class="slider-main">
				<li class="slider-panel">
					<a href="" target="_blank"><img  src="${ctxStatic}/resources/img/spellpicture01.jpg"></a>
				</li>
				<li class="slider-panel">
					<a href="" target="_blank"><img  src="${ctxStatic}/resources/img/spellpicture02.jpg"></a>
				</li>
				<li class="slider-panel">
					<a href="" target="_blank"><img  src="${ctxStatic}/resources/img/spellpicture03.jpg"></a>
				</li>
				<li class="slider-panel">
					<a href="" target="_blank"><img  src="${ctxStatic}/resources/img/spellpicture04.png"></a>
				</li>
				<li class="slider-panel">
					<a href="" target="_blank"><img  src="${ctxStatic}/resources/img/spellpicture05.jpg"></a>
				</li>
				<li class="slider-panel">
					<a href="" target="_blank"><img  src="${ctxStatic}/resources/img/spellpicture06.jpg"></a>
				</li>
				<li class="slider-panel">
					<a href="" target="_blank"><img  src="${ctxStatic}/resources/img/spellpicture07.jpg"></a>
				</li>
			</ul>
			<div class="slider-extra">
				<ul class="slider-nav">
					<li class="slider-item">1</li>
					<li class="slider-item">2</li>
					<li class="slider-item">3</li>
					<li class="slider-item">4</li>
					<li class="slider-item">5</li>
					<li class="slider-item">6</li>
					<li class="slider-item">7</li>
				
				</ul>
				<div class="slider-page">
					<a class="slider-pre" href="javascript:;;">
						<</a>
							<a class="slider-next" href="javascript:;;">></a>
				</div>
			</div>
			<div class="slider-select">
				<div class="slider-select_div">
					<br />
					<a class="slider-select_a" href="">顶级品牌</a><br /><hr style="visibility: hidden;"/><hr style="visibility: hidden;"/>
					<span><a href="${pageContext.request.contextPath}/b/watch/search?brandName=百达翡丽">百达翡丽</a><a href="">亨利·慕时</a><a href="">积家</a><a href="">柏高</a></span>
					<br /><br /><hr />
				</div >
				<div class="slider-select_div">
					<br />
					<a class="slider-select_a" href="">奢华品牌</a><br />
					<span><a href="">欧米茄</a><a href="">劳力士</a><a href="">库尔</a><a href="">沃莫勒</a></span>
					<br /><br /><hr />
				</div>
				<div class="slider-select_div">
					<br />
					<a class="slider-select_a" href="">轻奢品牌</a><br />   
					<span><a href="">天梭</a><a href="">浪琴</a><a href="">赫柏林</a><a href="${pageContext.request.contextPath}/b/watch/search?brandName=爱宝时">爱宝时</a><a href="">宝玑</a></span>
					<br /><br /><hr />
				</div>
				
				<div class="slider-select_div">
					<br />
					<a class="slider-select_a" href="">时尚、潮牌</a><br />  
					<span><a href="">卡西欧</a><a href="">CK</a><a href="">MINI</a><a href="">阿玛尼</a><a href="">DW</a></span>
					<br /><br /><hr />
				</div>
				<div class="slider-select_div">
					<br />
					<a class="slider-select_a" href="">智能表、国产表</a><br />
					<span><a href="">飞亚达</a><a href="">华为</a><a href="">海鸥</a><a href="">唯路时</a><a href="">表带</a></span>
					<br /><br /><br />
				</div>
				
				
				
				
			</div>
			
		</div>
		<br><br>
		<p  style="font-size: 20px;font-weight:bold; #4a4a4a;font-family: 'Microsoft Yahei';">热卖推荐</p>	
<!-- 第一栏 热卖推荐 -->
<div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
    	<a href="#" class="thumbnail">
      <img src="${ctxStatic}/resources/img/3e42cdc61f19419e9f792b4d95cf3a7a.jpg" alt="...">
     </a>
      <div class="caption">
      	<center>
	        <h3>汉米尔顿</h3>
	        <p>大胆坚定的美国设计</p>
        </center>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
    <a href="#" class="thumbnail">
      <img src="${ctxStatic}/resources/img/338eb63710384628ba7bee3933cc7278.jpg" alt="...">
     </a>
      <div class="caption">
      	<center>
	        <h3>法国赫柏林</h3>
	        <p>岁月中的恒久坚恒</p>
        </center>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
    <a href="#" class="thumbnail">
      <img src="${ctxStatic}/resources/img/ef5a9592e673468fb4d08ead45b20ee9.jpg" alt="...">
      </a>
      <div class="caption">
      	<center>
	        <h3>东方双狮</h3>
	        <p>低调内涵，精明之选</p>
        </center>
      </div>
    </div>
  </div>
</div>
<!-- 第二栏 热卖推荐 -->
<div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
    	<a href="#" class="thumbnail">
      <img src="${ctxStatic}/resources/img/b04ae7b6d3b8457e997e82d198d82317.jpg" alt="...">
     </a>
      <div class="caption">
      	<center>
	        <h3>瑞士驰客</h3>
	        <p>无谓时间，Rock前行</p>
        </center>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
    <a href="#" class="thumbnail">
      <img src="${ctxStatic}/resources/img/c6d3d945e0b14c69bd7b2df43ae49534.jpg" alt="...">
     </a>
      <div class="caption">
      	<center>
	        <h3>阿玛尼</h3>
	        <p>热切追求,人生所有</p>
        </center>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
    <a href="#" class="thumbnail">
      <img src="${ctxStatic}/resources/img/d8199b064b654f7c90e9007522cc5932.jpg" alt="...">
      </a>
      <div class="caption">
      	<center>
	        <h3>瑞士天铭</h3>
	        <p>鉴赏镂空艺术，聆听机芯律动</p>
        </center>
      </div>
    </div>
  </div>
</div>
</body>
</html>