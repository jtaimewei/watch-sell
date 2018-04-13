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
		var xz = $(this).prop("checked");//判断全选按钮的选中状态
        var ck = $(".chCheck").prop("checked",xz);  //让class名为qx的选项的选中状态和全选按钮的选中状态一致。 
		/* var state = $('#allCheck').is(':checked');
		//alert(state);
		if (state == true) {
			$(".chCheck").each(function(){
				$(this).attr('checked', true);
			});
		} else {
			$(".chCheck").each(function(){
				$(this).attr('checked', false);
			});
		} */
	});
	/* 清除购物车 */
	$("#clearCartButton").click(function(){
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
		$("#clearCartForm").submit();
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
	<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
	<div class="container-fluid">
		<div class="row">
		<br>
			<div class="col-md-12">
				<div class="col-md-10 col-md-offset-1">
				
				<div class="thumbnail">
			      <div class="caption">
			      <div align="center"><h3><label>购物车</label></h3></div>
				<span id="messageSpan" style="margin-left: 420px;font-size: 15px;color: red;"></span><br>
				<c:if test="${empty carts}">
					<p style="font-size: 22px;font-family: 宋体;text-align: center;color: #66667B;">[购物车为空,快去选购商品吧!]</p>
				</c:if>	
				<c:if test="${!empty carts}">
					<label>全部商品&nbsp;&nbsp;&nbsp;(${fn:length(carts)})</label>
					
				<form id="clearCartForm" action="${pageContext.request.contextPath}/b/watch/cart/clear" method="post" >	
					<table class="table table-striped">
						<tr>
							<th><input id="allCheck" type="checkbox" onclick="selectedAll()">&nbsp;&nbsp;全选</th>
							<th></th>
							<th>商品信息</th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
						<c:forEach items="${carts}" var="cart">
							<tr>
								<th>
									<input class="watchId" type="hidden" value="${cart.watch.id}">
									<input class="chCheck" type="checkbox" name="checkbox">
									<input name="id" type="hidden" value="${cart.id}">
								</th>
								<th>
									<c:forEach items="${cart.watch.watchPicture}" var="picture">
		      							<c:if test="${picture.pictureType == '1'}">
											<img src="/image/${picture.pictureSrc}" width="100" height="100" />
										</c:if>
									</c:forEach>
								</th>
								<th>
									${cart.watch.watchTitle}
								</th>
								<th>￥${cart.watch.watchPrePrice}</th>
								<th>
									<input class="jButton" style="width: 35px;" type="button" value="-"><input class="numberInput" style="width: 50px;text-align: center;" type="text" value="${cart.cartProductNumber}"><input class="aButton" style="width: 35px;" type="button" value="+">
									<input  type="hidden" value="${cart.watch.watchNumber}">
									<input class="watchPrePrice" type="hidden" value="${cart.watch.watchPrePrice}">
								</th>
								<th>￥${cart.watch.watchPrePrice * cart.cartProductNumber}</th>
							</tr>
						</c:forEach>
					</table>
				</form>
					<button id="buyButton" type="button" class="btn btn-danger" style="float: right;width: 200px;height: 50px;font-size: 16px;">结&nbsp;&nbsp;算</button>
					<button id="clearCartButton" type="button" class="btn btn-default" style="margin-right: 30px;float: right;width: 200px;height: 50px;font-size: 16px;">清&nbsp;&nbsp;除</button>
				</c:if>	
				<br><br><br>
				</div>
			</div>
		</div>
			</div>
		</div>

	</div>
</body>
</html>