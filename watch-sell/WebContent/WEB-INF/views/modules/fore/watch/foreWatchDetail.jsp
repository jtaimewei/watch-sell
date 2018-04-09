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
.plDiv{
	padding-left: 50px;
	    font-family: 宋体;
}
.plUserDiv{
	    font-size: 15px;
    font-weight: bold;
}
.plTextDiv{
	    font-size: 15px;
}
</style>
<script type="text/javascript">
function page(n,s){
	if (n) $("#pageNo").val(n);
	if (s) $("#pageSize").val(s);
	$("#detailWatchForm").submit();
	return false;
}
	$(function(){
		/* - 数量 */
		$("#jButton").click(function(){
			var num = Number($("#numberInput").val());
			if (num > 1) {
				$("#numberInput").val(num-1);
			}
		});
		/* + 数量  */
		$("#aButton").click(function(){
			var num = Number($("#numberInput").val());
			var kc = Number($("#kcSpan").html());
			if (num < kc) {
				$("#numberInput").val(num+1);
			}
		});
		
		/* 加入购物车 */
		$("#addCartButton").click(function(){
			var watchId = $("#watchId").val();
			var buyNum = $("#numberInput").val();
			$.ajax({  
			    type: "POST",  
			    url: "${pageContext.request.contextPath}/b/watch/cart",  
			    data:JSON.stringify({
			    	"watchId":watchId,
			    	"cartProductNumber":buyNum
                }),  
			    async: false,
			    contentType:"application/json;charset=utf-8",
			    error: function() {  
			        alert("加入购物车失败");  
			    },  
			    success: function(data) {
			    	$("#messageAjaxSpan").html(data);
			    }  
			  });
			
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
	      <img src="${ctxStatic}/resources/watch/${watch.watchPicture[0].pictureSrc}" alt="...">
	      <div class="caption">
	      <c:forEach items="${watch.watchPicture}" var="picture">
	      	<div class="col-sm-6 col-md-2">
	      	<br>
	    		<div class="thumbnail">
	      			<img src="${ctxStatic}/resources/watch/${picture.pictureSrc}" alt="...">
		      		<div class="caption">
		      
			     	</div>
		    	</div>
	  		</div>
	  	</c:forEach>
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
	  		<button id="addCartButton" type="button" class="btn btn-default carButton">加入购物车</button>
	      	<span id="messageAjaxSpan" style="color: red; margin-left: 20px;font-size: 19px;font-family: 宋体;"></span>
	      </div>
	    </div>
	  </div>
</div>

<div class="row" style="margin-left: 20px;width: 95%;">
<hr>
<div class="alert alert-info" role="alert">
	<strong>规格参数</strong>
</div>
		<table class="table table-bordered">
		<tr>
		<td>品牌</td>
		<td>${watch.brand.brandName}</td>
		<td>表扣</td>
		<td>${watch.watchClasp}</td>
		</tr>
		<tr>
		<td>机芯</td>
		<td>${watch.watchMovement}</td>
		<td>表盘</td>
		<td>${watch.watchDial}</td>
		</tr>
		<tr>
		<td>序列号</td>
		<td>${watch.watchSerialNumber}</td>
		<td>外壳</td>
		<td>${watch.watchShell}</td>
		</tr>
		<tr>
		<td>型号</td>
		<td>${watch.watchModel}</td>
		<td>表带</td>
		<td>${watch.watchStrap}</td>
		</tr>
		<tr>
		<td>人群</td>
		<td>${watch.crowd.crowdName}</td>
		<td>重量</td>
		<td>${watch.watchWeight}</td>
		</tr>
		<tr>
		
		<td>年份</td>
		<td>${watch.watchYear}</td>
		<td>防水</td>
		<td>${watch.watchWaterproof}</td>
		</tr>
		</table>
</div>

<div class="row" style="margin-left: 20px;width: 95%;">
<hr>
<div class="alert alert-info" role="alert">
	<strong>商品详情</strong>
</div>
	<div class="col-sm-6 col-md-12">
	    <div class="thumbnail">
	      <img src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" alt="...">
	     
	    </div>
	  </div>
	  <c:forEach items="${watch.watchPicture}" var="picture">
	      	<div class="col-sm-6 col-md-12">
	      	<br>
	    		<div class="thumbnail">
	      			<img src="${ctxStatic}/resources/watch/${picture.pictureSrc}" alt="...">
		      		<div class="caption">
		      
			     	</div>
		    	</div>
	  		</div>
	  	</c:forEach>
</div>

<div class="row" style="margin-left: 20px;width: 95%;">
<hr>
<div class="alert alert-info" role="alert">
	<strong>评&nbsp;&nbsp;&nbsp;价</strong>
</div>
	<div class="col-sm-6 col-md-12">
	    <div class="thumbnail">
	   	<c:forEach items="${page.list}" var="comment">
			<div class="row plDiv">
				<div class="col-sm-6 col-md-2 plUserDiv">
		    		${comment.userName }
		  		</div>	     
				<div class="col-sm-6 col-md-10 plTextDiv">
		    		<span>${comment.commentContent }</span><br><br>
		    		
		    		<span>${comment.commentContentTime }</span>
		  		</div>	     
		    </div>
		    <hr>
		</c:forEach>    
		    
		    
			<!-- <div class="row plDiv">
				<div class="col-sm-6 col-md-2 plUserDiv">
		    		用户112131
		  		</div>	     
				<div class="col-sm-6 col-md-10 plTextDiv">
		    		<span>辅导老师发几份里大街网</span><br><br>
		    		
		    		<span>2017-09-08 21:09:33</span>
		  		</div>	     
		    </div>
		      <hr>
			<div class="row plDiv">
				<div class="col-sm-6 col-md-2 plUserDiv">
		    		用户112131
		  		</div>	     
				<div class="col-sm-6 col-md-10 plTextDiv">
		    		<span>辅导老师发几份里大街网</span><br><br>
		    		
		    		<span>2017-09-08 21:09:33</span>
		  		</div>	     
		    </div>
		      <hr> -->
		      
			<div class="row plDiv" >
				<div class="col-sm-6 col-md-12 plUserDiv">
					<form id="detailWatchForm" action="${pageContext.request.contextPath}/b/watch/detail" method="post" >
						<input type="hidden" id="watchId" name="watchId" value="${watch.id}">
						<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
						<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
		    			<div style="width: 95%;margin-left: 270px;">${page}</div>
					</form>
		  		</div>	     
		    </div>
		    
	    </div>
	  </div>
	
</div>
</body>
</html>