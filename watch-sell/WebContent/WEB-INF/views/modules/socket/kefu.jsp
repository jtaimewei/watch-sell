<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/back/header/backHeader.jsp"%>
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
    background-color: beige;  
}
.thMessage2{
	width: 250px;
    word-break: break-all;
    background-color: beige;	
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
					$("#divDetail").find("#"+message.fromwho+"").append(
							'<tr>'+
				 			'<td class="thName1" valign="top">'+message.fromWho+'</td>'+
				 			'<td class="thMessage1">'+message.messageText+'</td>'+
				 			'<td class="thNotice"></td>'+
				 			'<td ></td>'+
				 			'<td class="thName2"></td>'+
			 				'</tr>'
					);
					$("#divDetail").scrollTop($("#divDetail").find("#"+message.fromwho+"").height()) ;
					return;
				}
			}
			//alert("消息进来了-创建一个新的");
			table.push(message.fromwho);
			//在会话窗口创建这个好友的会话
			$("#gukeUl").append(
					'<li role="presentation" class="gukeLi">'+
					'<a>'+
						'<span class="gkName">'+message.fromwho+'</span><span class="badge">42</span>'+
					'</a>'+
					'</li>'
			);
			//创建好友聊天框
			$("#divDetail").append(
						'<table id="'+message.fromwho+'">'+
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
			$("#divDetail").find("#"+message.fromwho+"").hide();
		} 

	//点击发送按钮给用户发送消息
	$("#sendMessageButton").click(function(){
		var messageText=$("#messageText").val();
		var toWho=$("#myModalLabel").html();
		if(messageText != ""){
			$("#divDetail").find("#"+towho+"").append(
					'<tr>'+
			 			'<td class="thName1"></td>'+
			 			'<td></td>'+
			 			'<td class="thNotice"></td>'+
			 			'<td class="thMessage2">'+messageText+'</td>'+
			 			'<td class="thName2" align="right" valign="top">ME</td>'+
	 				'</tr>'
					);
			$("#divDetail").scrollTop($("#divDetail").find("#"+towho+"").height()) ;
			
			
			var data = {};//新建data对象，并规定属性名与相应的值
		    data['fromWho'] = "ooo";
		    data['toWho'] = toWho;
		    data['messageText'] = messageText;
		   	webSocket.send(JSON.stringify(data));
		   	$("#messageText").val("");
		}
	});	
	/* 点击一个顾客，进入聊天界面 */
	$("#gukeUl").on("click",".gukeLi",function(){
		var s = $(this).find(".gkName").html();
		alert(s);
	});
	  
});

</script>		
</head>
<body>
<div id="myModal" >
<div class="modal-dialog" style="margin: 0px auto;width: 200px; float: left;margin-left: 80px;" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">顾客信息</h4>
	      </div>
	      
	      <div id="" class="modal-body" style="height: 400px;overflow: auto;">
	      
 			<ul id="gukeUl" class="nav nav-pills nav-stacked">
 					<li role="presentation" class="gukeLi"><a href="#">1<span class="gkName">Home</span><span class="badge">42</span></a></li>
 					<li role="presentation"><a class="gukeLi">Profile<span class="badge">42</span></a></li>
 					<li role="presentation"  class="active"><a class="gukeLi">Messages<span class="badge">42</span></a></li>
 					<li role="presentation"><a href="#" class="gukeLi">Messages</a></li>
			</ul>
	      </div>
	      <div class="modal-footer">
		      <button type="button" id="sendMessageButton" class="btn btn-primary">发送</button>
	      </div>
	    </div>
	  </div>
	  
	  </div>

<div id="mModal" >
	  <div class="modal-dialog" style="margin: 10px auto;width: 1100px;" role="document">
	    <div class="modal-content" style="margin-left: 240px;">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">顾客聊天</h4>
	      </div>
	      <div id="divDetail" class="modal-body" style="height: 400px;overflow: auto;">
	 			
	 			<table id="tableDetail">
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
	       <input id="messageText" type="text" value="21313123" />
	        <button type="button" id="sendMessageButton" class="btn btn-primary">发送</button>
	      </div>
	      
	    </div>
	  </div>
	  
	  
	</div>

</body>
</html>