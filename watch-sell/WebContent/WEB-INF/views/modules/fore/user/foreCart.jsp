<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表网</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
$(function(){
	/* - 数量 */
	$(".jButton").click(function(){
		var num = Number($(this).next().val());
		if (num > 1) {
			$(this).next().val(num-1);
			var total = $(this).next().next().next().next().val() * (num-1);
			//alert(total);
			$(this).parent().next().html("￥"+total);
		}
	});
	/* + 数量  */
	$(".aButton").click(function(){
		var num = Number($(this).prev().val());
		var kc = Number($(this).next().val());
		if (num < kc) {
			$(this).prev().val(num+1);
			var total = $(this).next().next().val() * (num+1);
			$(this).parent().next().html("￥"+total);
		}
	});
	
	/* 全选 */
	$("#allCheck").click(function(){
		var state = $('#allCheck').is(':checked');
		//alert(state);
		if (state == true) {
			$(".chCheck").each(function(){
				$(this).attr('checked', true);
			});
		} else {
			$(".chCheck").each(function(){
				$(this).attr('checked', false);
			});
		}
	});
	
	/* 购买 */
	$("#buyButton").click(function(){
		$("#messageSpan").html("");
		var key = false;
		$(".chCheck").each(function(){
			if ($(this).is(':checked')) {
				key = true;
			}
		});
		if (key == false) {
			$("#messageSpan").html("[&nbsp;&nbsp;至少选择一个商品！]");
			return;
		}
		 var list=""; 
		$(".chCheck").each(function(){
			if ($(this).is(':checked')) {
				var number = $(this).parent().parent().find(".numberInput").val();
				var watchId = $(this).parent().parent().find(".watchId").val();
				//alert(price);
				
				list=list+watchId+"@"+number+",";
			}
		});
		console.log("list",list);
		 $.ajax({  
		    type: "POST",  
		    url: "${pageContext.request.contextPath}/b/user/order",  
		    data:{"list":list},  
		    async: false,
		    error: function() {  
		        alert("加入订单失败");  
		    },  
		    success: function(data) {
		    	if (data == "0") {
			    	$("#messageSpan").html("请先登录！");
		    	} else if (data == "1") {
		    		window.location.href="${pageContext.request.contextPath}/b/user/toOrder";
		    	}
		    }  
		  });
		
	});
});

</script>
</head>
<body>
	<br>
	
	<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-10 col-md-offset-1">
				<br><span id="messageSpan" style="margin-left: 350px;font-size: 15px;color: red;"></span><br>
					<label>全部商品&nbsp;&nbsp;&nbsp;(${fn:length(carts)})</label>
					<table class="table table-striped">
						<tr>
							<th><input id="allCheck" type="checkbox">&nbsp;&nbsp;全选</th>
							<th>商品信息</th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${carts}" var="cart">
							<tr>
								<th>
									<input class="watchId" type="hidden" value="${cart.watch.id}">
									<input class="chCheck" type="checkbox" name="checkbox">
									<img alt="" src="${ctxStatic}/resources/watch/${cart.watch.watchPicture[0].pictureSrc}">
								</th>
								<th>${cart.watch.watchTitle}</th>
								<th>￥${cart.watch.watchPrePrice}</th>
								<th>
									<input class="jButton" style="width: 35px;" type="button" value="-"><input class="numberInput" style="width: 50px;text-align: center;" type="text" value="${cart.cartProductNumber}"><input class="aButton" style="width: 35px;" type="button" value="+">
									<input  type="hidden" value="${cart.watch.watchNumber}">
									<input class="watchPrePrice" type="hidden" value="${cart.watch.watchPrePrice}">
								</th>
								<th>￥${cart.watch.watchPrePrice * cart.cartProductNumber}</th>
								<th>操作</th>
							</tr>
						</c:forEach>
					</table>
					<button id="buyButton" type="button" class="btn btn-danger buyButton" style="float: right;width: 200px;height: 50px;font-size: 16px;">结&nbsp;&nbsp;算</button>
				</div>
			</div>
		</div>

	</div>
</body>
</html>