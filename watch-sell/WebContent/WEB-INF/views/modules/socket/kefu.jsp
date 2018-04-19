<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/back/header/backHeader.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表网</title>
<%
	String path = request.getContextPath();
	String http = request.getScheme()+"://";
	String base = request.getServerName()+":"+request.getServerPort()+path+"/";
	String basePath =http+base;
	%>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
.thName1{
	width: 80px;
}
.thName2{
	width: 80px;
}
.thMessage1{
    width: 250px;
    word-break: break-all; 
    background-color: white;
    box-shadow: 1px 1px 6px 2px #b4adad;border-radius:5px 5px 5px 5px;border: 1px solid #b4adad;
    padding: 10px;  
}
.thMessage2{
	width: 250px;
    word-break: break-all;
    background-color: white;
    padding: 10px; 
    box-shadow: 1px 1px 6px 2px #b4adad;border-radius:5px 5px 5px 5px;border: 1px solid #b4adad;	
}
.thNotice{
    width: 140px;
}
.badge{
    float: right;
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
	var table=[];//创建对话table集合
	var webSocket = new WebSocket("ws://"+base+"chat//ws");
		webSocket.onopen = function(event){
		    console.log("连接成功");
		    console.log(event);
		};
		webSocket.onerror = function(event){
		    console.log("连接失败");
		    console.log(event);
		};
		webSocket.onclose = function(event){
		    console.log("Socket连接断开");
		    console.log(event);
		};
		//接收消息
		webSocket.onmessage = function(event){
			var message = JSON.parse(event.data);
			for(i=0;i<table.length;i++){
				//alert(table);
				if(message.fromWho==table[i]){
					//alert("消息进来了-进入已经存在了的");
					var messageNum = Number($("#gukeUl").find("."+message.fromWho+"").html());
					
	
					$("#divDetail").find("#"+message.fromWho+"").append(
							'<tr>'+
				 			'<td class="thName1" valign="top">'+message.fromWho+'</td>'+
				 			'<td class="thMessage1">'+message.messageText+'</td>'+
				 			'<td class="thNotice"></td>'+
				 			'<td ></td>'+
				 			'<td class="thName2"></td>'+
			 				'</tr>'
					);
					if ($("#divDetail").find("#"+message.fromWho+"").is(":hidden")) {
						$("#gukeUl").find("."+message.fromWho+"").html(messageNum+1);
					} else {
						$("#divDetail").scrollTop($("#divDetail").find("#"+message.fromWho+"").height()) ;
					}
					return;
				}
			}
			//alert("消息进来了-创建一个新的");
			table.push(message.fromWho);
			//在会话窗口创建这个好友的会话
			$("#gukeUl").append(
					'<li role="presentation">'+
						'<a class="gukeLi">'+
							'<span class="gkName">'+message.fromWho+'</span>'+
							'<span class="badge '+message.fromWho+'">1</span>'+
						'</a>'+
					'</li>'
			);
			//创建好友聊天框
			$("#divDetail").append(
						'<table id="'+message.fromWho+'" style="display: none;border-collapse:separate; border-spacing:10px;">'+
	 				'<tr>'+
			 			'<td class="thName1"></td>'+
			 			'<td ></td>'+
			 			'<td class="thNotice" align="center">'+message.messageDate+'</td>'+
			 			'<td ></td>'+
			 			'<td class="thName2"></td>'+
		 			'</tr>'+
		 			'<tr>'+
			 			'<td class="thName1" valign="top">'+message.fromWho+'</td>'+
			 			'<td class="thMessage1">'+message.messageText+'</td>'+
			 			'<td class="thNotice"></td>'+
			 			'<td ></td>'+
			 			'<td class="thName2"></td>'+
		 			'</tr>'+
	 			'</table>'
			);
			$("#divDetail").find("#"+message.fromWho+"").hide();
		} 
	/* 回车发送消息 */
	$("body").keydown(function () {
		if (event.keyCode == "13") {//keyCode=13是回车键
			$('#sendMessageButton').trigger("click");
		}
		});
	//点击发送按钮给用户发送消息
	$("#sendMessageButton").click(function(){
		var messageText=$("#messageText").val();
		var toWho=$("#myModalLabel").html();
		//alert(messageText);
		if(messageText != ""){
			$("#divDetail").find("#"+toWho+"").append(
					'<tr>'+
			 			'<td class="thName1"></td>'+
			 			'<td></td>'+
			 			'<td class="thNotice"></td>'+
			 			'<td class="thMessage2">'+messageText+'</td>'+
			 			'<td class="thName2" align="right" valign="top">ME</td>'+
	 				'</tr>'
					);
			$("#divDetail").scrollTop($("#divDetail").find("#"+toWho+"").height()) ;
			
			
			var data = {};//新建data对象，并规定属性名与相应的值
		    data['fromWho'] = "${userOwn.email}";
		    data['toWho'] = toWho;
		    data['messageText'] = messageText;
		   	webSocket.send(JSON.stringify(data));
		  	$("#messageText").val("");
		}
	});	
	/* 点击一个顾客，进入聊天界面 */
	$("#gukeUl").on("click",".gukeLi",function(){
		var s = $(this).find(".gkName").html();
		$(this).find(".badge").html(0);
		//alert(s);
		$("#myModalLabel").html(s);
		$(this).parent().attr("class","active");
		$(this).parent().siblings().attr("class","");
		$("#divDetail").find("#"+s+"").show();
		$("#divDetail").find("#"+s+"").siblings().hide();
		$("#divDetail").scrollTop($("#divDetail").find("#"+s+"").height()) ;
	});
	  
});

</script>		
</head>
<body>
<div id="myMol" >
<div class="modal-dl" style="margin: 0px auto;width: 200px; float: left;margin-left: 80px;box-shadow: 1px 1px 6px 2px #b4adad;border-radius:5px 5px 5px 5px;border: 1px solid #b4adad;padding: 10px;" >
	    <div class="modal-nt">
	      <div class="modal-her">
	        <h4 class="modal-tle" id="myModalLabel1">顾客信息</h4>
	        
	      </div>
	      <hr>
	      <div id="ulDiv" class="moal-boy" style="height: 410px;overflow: auto;">
 			<ul id="gukeUl" class="nav nav-pills nav-stacked">
 					<li role="presentation" ><a class="gukeLi"><span class="gkName">Home</span><span class="badge">42</span></a></li>
 					<li role="presentation" ><a class="gukeLi"><span class="gkName">Profile</span><span class="badge">42</span></a></li>
 					<li role="presentation" ><a class="gukeLi"><span class="gkName">Messages</span><span class="badge">42</span></a></li>
 					<li role="presentation"><a class="gukeLi"><span class="gkName">Messages</span></a></li>
			</ul>
	      </div>
	    </div>
	  </div>
	  
	  </div>

<div id="mModa" >
	  <div class="modal-dia" style="margin: 10px auto;width: 1100px;">
	    <div class="modal-content" style="margin-left: 240px;">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">顾客聊天</h4>
	      </div>
	      <div id="divDetail" class="modal-body" style="height: 400px;overflow: auto;">
	 			<table id="Home" style="display: none;border-collapse:separate; border-spacing:10px;">
	 				<tr>
			 			<td class="thName1"></td>
			 			<td ></td>
			 			<td class="thNotice" align="center">12dadsa12</td>
			 			<td ></td>
			 			<td class="thName2"></td>
		 			</tr>
		 			<tr>
			 			<td class="thName1" valign="top">张三</td>
			 			<td class="thMessage1"><a>消息1qeeeeeeesdadas</a></td>
			 			<td class="thNotice"></td>
			 			<td ></td>
			 			<td class="thName2"></td>
		 			</tr>
		 			<tr>
			 			<td class="thName1"></td>
			 			<td></td>
			 			<td class="thNotice"></td>
			 			<td class="thMessage2">消息1s</td>
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
			 			<td></td>
			 			<td class="thNotice"></td>
			 			<td class="thMessage2">
			 			09-08 12:12 <br>
			 			消息1qweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedasdasdadsadadasdasdadasdasdasdasdasdasdasdas</td>
			 			<td class="thName2" align="right" valign="top">张三</td>
		 			</tr>

	 			</table>
	 			<table id="Profile" style="display: none;border-collapse:separate; border-spacing:10px;">
	 				<tr>
			 			<td class="thName1"></td>
			 			<td ></td>
			 			<td class="thNotice" align="center">122112</td>
			 			<td ></td>
			 			<td class="thName2"></td>
		 			</tr>
		 			<tr>
			 			<td class="thName1" valign="top">张三</td>
			 			<td class="thMessage1">消息1qeeeeeeesdadas</td>
			 			<td class="thNotice"></td>
			 			<td ></td>
			 			<td class="thName2"></td>
		 			</tr>
		 			<tr>
			 			<td class="thName1"></td>
			 			<td></td>
			 			<td class="thNotice"></td>
			 			<td class="thMessage2">消息1s</td>
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
			 			<td></td>
			 			<td class="thNotice"></td>
			 			<td class="thMessage2">
			 			09-08 12:12 <br>
			 			消息1qweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedasdasdadsadadasdasdadasdasdasdasdasdasdasdas</td>
			 			<td class="thName2" align="right" valign="top">张三</td>
		 			</tr>

	 			</table>
	      </div>
	      <div class="modal-footer">
	       <input id="messageText" type="text" value="21313123" style="width:750px;border: none;height: 35px;font-size: 17px;"  />
	        <button type="button" id="sendMessageButton" class="btn btn-primary">发送</button>
	        <hr>
	      </div>
	      
	    </div>
	  </div>
	  
	  
	</div>

</body>
</html>