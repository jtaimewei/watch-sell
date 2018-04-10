<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表网</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>
<body>
	<br>
	
	<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
	<div class="container-fluid">
		<div class="row">
		<br><br><br>
			<div class="col-sm-6 col-md-10 col-md-offset-1">
			   <div class="thumbnail">
			      <div class="caption">
			      		<label style="font-size: 18px;margin-right: 20px;">订单支付:</label>
			      		<span>订单号</span><span>${orderPay.orderNumber}</span>
			      		<br>
			      		<div class="alert alert-danger" role="alert">
			      		<span style="font-size: 26px;margin-left: 80px;">即将支付&nbsp;&nbsp;${orderPay.orderAllPrice}&nbsp;&nbsp;元</span>
			      		</div>
			      		<span>选择支付方式</span>
			      		<br><br>
			      		<img alt="" width="43px;" src="${ctxStatic}/resources/img/v20180410112058.png">
			      		<label style="font-size: 16px;margin-left: 10px;">银行卡快捷支付</label>
			      		<br>
			      		<hr>
			      		<img alt="" width="43px;" src="${ctxStatic}/resources/img/v20180410112058.png">
			      		<label style="font-size: 16px;margin-left: 10px;">微信快捷支付</label>
			      		<br>
			      		<hr>
			      		<img alt="" width="43px;" src="${ctxStatic}/resources/img/v20180410112058.png">
			      		<label style="font-size: 16px;margin-left: 10px;">支付宝快捷支付</label>
			      		<br>
			      		<hr>
			      		<img alt="" width="43px;" src="${ctxStatic}/resources/img/v20180410112058.png">
			      		<label style="font-size: 16px;margin-left: 10px;">货到付款</label>
			      		<br>
			      		<hr>
			      		<form action="${pageContext.request.contextPath }/b/user/order/pay" method="post">
			      			<input type="hidden" name="id" value="${orderPay.id}">
			      			<button id="buyButton" type="submit" class="btn btn-danger" style="float: right;width: 200px;height: 50px;font-size: 16px;">支付</button>
			      		</form>
			      		<br><br><br>	
			      </div>
			    </div>
	 		 </div>
		</div>
	</div>
</body>
</html>