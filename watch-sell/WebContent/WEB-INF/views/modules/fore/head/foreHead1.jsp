<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表首页</title>
<%
	String path = request.getContextPath();
	String http = request.getScheme()+"://";
	String base = request.getServerName()+":"+request.getServerPort()+path+"/";
	String basePath =http+base;
	%>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link href="${ctxStatic}/fore/index.css" rel="stylesheet" type="text/css">
<style type="text/css">
.thName1{
	width: 60px;
	white-space: nowrap;
　　	overflow: hidden; 
 	text-overflow: ellipsis;        
 　　-moz-text-overflow: ellipsis;  
}
.thName2{
	width: 60px;
}
.thMessage1{
    width: 170px;
    word-break: break-all;
    background-color: white;
    box-shadow: 1px 1px 6px 2px #b4adad;border-radius:5px 5px 5px 5px;border: 1px solid #b4adad;
    padding: 10px;    
}
.thMessage2{
	width: 170px;
    word-break: break-all;	
    background-color: white;
    box-shadow: 1px 1px 6px 2px #b4adad;border-radius:5px 5px 5px 5px;border: 1px solid #b4adad;
    padding: 10px; 
}
.thNotice{
    width: 100px;
}
</style>
<script type="text/javascript">
$(function(){
	 
	var mydate = new Date();
	if((mydate.getMonth()+1)<10){
		var myMonth="0"+(mydate.getMonth()+1);
	}else{
		var myMonth=""+(mydate.getMonth()+1);
	}
	// mydate.getMonth(); //获取当前月份(0-11,0代表1月)
	 //mydate.getDate(); //获取当前日(1-31)
	 if(mydate.getDate()<10){
			var myDate="0"+mydate.getDate();
		}else{
			var myDate=""+mydate.getDate();
		}
	 if(mydate.getHours()<10){
			var myHours="0"+mydate.getHours();
		}else{
			var myHours=""+mydate.getHours();
		}
	// mydate.getHours(); //获取当前小时数(0-23)
	 if(mydate.getMinutes()<10){
			var myMinutes="0"+mydate.getMinutes();
		}else{
			var myMinutes=""+mydate.getMinutes();
		}
	//mydate.getMinutes(); //获取当前分钟数(0-59)
	
	/* for(i=0;i<user.length;i++){
		alert(user[i].username);
	} */
	$("#divDetail").scrollTop($("#tableDetail").height());
	var base="<%=base%>";
	var kefu;
	var webSocket = null;
	var kk = 0;
	$("#socketButton").click(function(){
		//alert($("#divDetail").height());
		//$("#divDetail").scrollTop($("body").find("#tableDetail").height());
		$("#divDetail").scrollTop(document.getElementById("tableDetail").offsetHeight);
		if (kk == 0) {
			$.ajax({  
			    type: "POST",  
			    url: "${pageContext.request.contextPath }/b/message/getKefu",  
			    async: false,
			    contentType:"application/json;charset=utf-8",
			    error: function() {  
			        alert("获取在线客服失败");  
			    },  
			    success: function(data) {
			    	kefu = data;
			    	console.log("在线客服",kefu);
			    	
			    }  
			  });
		 	$("#kefuSpan").html(kefu);
			webSocket = new WebSocket("ws://"+base+"chat//ws");
			webSocket.onopen = function(event){
				kk = 1;
			    console.log("连接成功");
			    console.log(event);
			};
			webSocket.onerror = function(event){
				kk = 0;
			    console.log("连接失败");
			    console.log(event);
			};
			webSocket.onclose = function(event){
				kk = 0;
			    console.log("Socket连接断开");
			    console.log(event);
			};
			//接收消息
			webSocket.onmessage = function(event){
				var message = JSON.parse(event.data);
				//alert(message.messageText);
				$("#tableDetail").append(
						'<tr>'+
			 			'<td class="thName1" valign="top">'+message.fromWho+'</td>'+
			 			'<td class="thMessage1">'+message.messageText+'</td>'+
			 			'<td class="thNotice"></td>'+
			 			'<td ></td>'+
			 			'<td class="thName2"></td>'+
		 				'</tr>'
					);
				$("#divDetail").scrollTop($("#tableDetail").height());
			} 
		}
		 
		
		
	});
	/* 回车发送消息 */
	$("body").keydown(function () {
		if (event.keyCode == "13") {//keyCode=13是回车键
			$('#sendMessageButton').trigger("click");
		}
		});
	//点击发送按钮给用户发送消息
	$("#sendMessageButton").click(function(){
		var messageText=$("#messageText").val();
		if (messageText != '') {
			$("#tableDetail").append(
					'<tr>'+
		 			'<td class="thName1"></td>'+
		 			'<td></td>'+
		 			'<td class="thNotice"></td>'+
		 			'<td class="thMessage2">'+messageText+'</td>'+
		 			'<td class="thName2" align="right" valign="top">ME</td>'+
					'</tr>'
				);
			console.log($("#tableDetail").height());
			$("#divDetail").scrollTop(document.getElementById("tableDetail").offsetHeight);
	/* 		$("#divDetail").scrollTop($("#tableDetail").height()); */
			//console.log($("#messageText").val());
			//console.log("在线客服1",kefu);
			var data = {};//新建data对象，并规定属性名与相应的值
		    data['fromWho'] = "${gUser.email }";
		    data['toWho'] = kefu;
		    data['messageText'] = $("#messageText").val();
		   	webSocket.send(JSON.stringify(data));
		   	$("#messageText").val("");
		}
	});	
		
	  
});

</script>
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
				<li> 
				<button id="socketButton" type="button" style="background-color: #333333;color: white;border: none;" data-toggle="modal" data-target="#myModal">联系客服</button>
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

		
<!-- 模态框 联系客服 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">客服:<span id="kefuSpan"></span></h4>
						      </div>
						      <div id="divDetail" class="modal-body" style="height: 400px;overflow: auto;">
						 			<table id="tableDetail" style="border-collapse:separate; border-spacing:10px; table-layout:fixed;display:inline-block;word-wrap:break-word;">
						 				<tr>
								 			<td class="thName1"></td>
								 			<td></th>
								 			<td class="thNotice" align="center">122112</td>
								 			<td></td>
								 			<td class="thName2"></td>
							 			</tr>
							 			<tr>
								 			<td class="thName1" valign="top">张三123312321312133213</td>
								 			<td class="thMessage1">消息1qweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedasdasdadsadadasdasdadasdasdasdasdasdasdasdas</td>
								 			<td class="thNotice"></td>
								 			<td></td>
								 			<td class="thName2"></td>
							 			</tr>
							 			<tr>
								 			<td class="thName1"></td>
								 			<td></td>
								 			<td class="thNotice"></td>
								 			<td class="thMessage2">消息1qweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedasdasdadsadadasdasdadasdasdasdasdasdasdasdas</td>
								 			<td class="thName2" align="right" valign="top">张三</td>
							 			</tr>
							 			<tr>
								 			<td class="thName1" valign="top">张三</td>
								 			<td class="thMessage1">消息1qweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedasdasdadsadadasdasdadasdasdasdasdasdasdasdas</td>
								 			<td class="thNotice"></td>
								 			<td></td>
								 			<td class="thName2"></td>
							 			</tr>
							 			<tr>
								 			<td class="thName1"></td>
								 			<td ></td>
								 			<td class="thNotice"></td>
								 			<td class="thMessage2">消息1qweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedasdasdadsadadasdasdadasdasdasdasdasdasdasdas</td>
								 			<td class="thName2" align="right" valign="top">张三</td>
							 			</tr>
							 			<tr>
								 			<td class="thName1" valign="top">张三</td>
								 			<td class="thMessage1">消息1qweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedasdasdadsadadasdasdadasdasdasdasdasdasdasdas</td>
								 			<td class="thNotice"></td>
								 			<td></td>
								 			<td class="thName2"></td>
							 			</tr>
							 			<tr>
								 			<td class="thName1"></td>
								 			<td ></td>
								 			<td class="thNotice"></td>
								 			<td class="thMessage2">消息1qweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedasdasdadsadadasdasdadasdasdasdasdasdasdasdas</td>
								 			<td class="thName2" align="right" valign="top">张三</td>
							 			</tr>

						 			</table>
						      </div>
						      <div class="modal-footer">
						       <input id="messageText" type="text" value="21313123" style="width:480px;border: none;height: 35px;font-size: 17px;"/>
						        <button type="button" id="sendMessageButton" class="btn btn-primary">发送</button>
						        <hr style="margin-left: -14px;margin-right: -14px;">
						      </div>
						    </div>
						  </div>
						</div>

</body>
</html>