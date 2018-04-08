<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表网</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
.buyButton{
	width: 130px;
    height: 40px;
    font-size: 15px;
}
.carButton{
	width: 130px;
    height: 40px;
    font-size: 15px;
    margin-left: 15px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#jButton").click(function(){
			var num = Number($("#numberInput").val());
			if (num > 1) {
				$("#numberInput").val(num-1);
			}
		});
		$("#aButton").click(function(){
			var num = Number($("#numberInput").val());
			var kc = Number($("#kcSpan").html());
			if (num < kc) {
				$("#numberInput").val(num+1);
			}
		});
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
<br>
<div class="row" style="margin-left: 20px;width: 95%;">
	<div class="col-sm-6 col-md-5">
	    <div class="thumbnail">
	      <img src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" alt="...">
	      <div class="caption">
	      	<div class="col-sm-6 col-md-2">
	      	<br>
	    		<div class="thumbnail">
	      			<img src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" alt="...">
		      		<div class="caption">
		      
			     	</div>
		    	</div>
	  		</div>
	  		
	  		<div class="col-sm-6 col-md-2">
	      	<br>
	    		<div class="thumbnail">
	      			<img src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" alt="...">
		      		<div class="caption">
		      
			     	</div>
		    	</div>
	  		</div>
	  		
	  		<div class="col-sm-6 col-md-2">
	      	<br>
	    		<div class="thumbnail">
	      			<img src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" alt="...">
		      		<div class="caption">
		      
			     	</div>
		    	</div>
	  		</div>
	  		
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-sm-6 col-md-7">
	   <div class="thumbnail">
	      <div class="caption">
	      	<h4 style="font-weight: bold;">${watch.watchTitle}</h4>
	        <h6  style="color: #666666;">${watch.watchIntroduce}</h6>
	        
	        <h6 style="color: #666666;margin-top: 20px;">
	        	<span>
	        	型号:${watch.watchModel}
	        	</span>
	        	<span style="margin-left: 30px;">
	        	编号:${watch.watchSerialNumber}
	        	</span>
	        	<span style="margin-left: 30px;">
	        	品牌:${watch.brand.brandName}
	        	</span>
	        	<span style="margin-left: 30px;">
	        	销量:12
	        	</span>
	        </h6>
	        
	      	<p style="display: inline;font-size: 16px;color: #666666;">名表价</p>
	      	<h3 style="font-weight: bold;color:#990000;display: inline;">￥${watch.watchPrePrice}</h3>
		    <s style="color:#666666;font-size: 16px;margin-left: 10px;">￥${watch.watchOrgPrice}</s> 
		    <br>
		    <p style="font-size: 16px;color: #666666;margin-top: 10px;">款式</p>
    		<div class="thumbnail" style="margin-left: 70px;width: 95px;margin-top: -20px;">
      			<img src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" width="50px" height="50px" alt="...">
	    	</div>
		    <span style="font-size: 16px;color: #666666;margin-top: 10px;margin-right: 32px;">数量</span>
		    <input id="jButton" style="width: 35px;" type="button" value="-"><input id="numberInput" style="width: 50px;text-align: center;" type="text" value="1"><input id="aButton" style="width: 35px;" type="button" value="+">
		    <span style="font-size: 16px;color: #666666;margin-top: 10px;margin-left: 32px;">库存:</span>
		    <span id="kcSpan" style="font-size: 16px;color: #666666;padding-left: 10px;">${watch.watchNumber}</span>
		    <br><br>
		    <button type="button" class="btn btn-danger buyButton">立即购买</button>
	  		<button type="button" class="btn btn-default carButton">加入购物车</button>
	      </div>
	    </div>
	  </div>
</div>

<div class="row" style="margin-left: 20px;width: 95%;">
<hr>
<table class="table table-bordered">
<tr>
<td>品牌</td>
<td>213</td>
<td>表扣</td>
<td>3123</td>
</tr>
<tr>
<td>机芯</td>
<td>213</td>
<td>表盘</td>
<td>3123</td>
</tr>
<tr>
<td>序列号</td>
<td>213</td>
<td>外壳</td>
<td>3123</td>
</tr>
<tr>
<td>型号</td>
<td>213</td>
<td>表带</td>
<td>3123</td>
</tr>
<tr>
<td>人群</td>
<td>213</td>
<td>重量</td>
<td>3123</td>
</tr>
<tr>

<td>年份</td>
<td>2213</td>
<td>防水</td>
<td>312ddef3</td>
</tr>
</table>
</div>
</body>
</html>