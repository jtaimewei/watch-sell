<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/back/header/backHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台信息</title>
<style type="text/css">
.caozhuo-class {
	margin-left: 10px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs">
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/order/list">订单管理</a></li>
					<li role="presentation" class="active"><a href="#">订单详情</a></li>
				</ul>
				<br>
				<h4><span class="label label-danger">订单情况:</span></h4>
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">订单编号</td>
							<td class="success">交易号</td>
							<td class="warning">订单创建时间</td>
							<td class="warning">订单支付时间</td>
							<td class="warning">发货时间</td>
							<td class="warning">订单完成时间</td>
							<td class="danger">订单总价</td>
							<td class="danger">订单优惠金额</td>
							<td class="danger">邮费</td>
							<td class="danger">收货人</td>
							<td class="danger">收货地址</td>
							<td class="danger">收货人电话</td>
						</tr>
						
							<tr>
								<td class="active">${order.orderNumber}</td>
								<td class="success">${order.orderTradeNumber}</td>
								<td class="warning">${order.orderCreateTime}</td>
								<td class="warning">${order.orderPayTime}</td>
								<td class="warning">${order.orderSendTime}</td>
								<td class="warning">${order.orderCloseTime}</td>
								<td class="danger">${order.orderAllPrice}</td>
								<td class="danger">${order.orderDiscount}</td>
								<td class="danger">${order.orderSendPrice}</td>
								<td class="danger">${order.orderGetName}</td>
								<td class="danger">${order.orderGetAddress}</td>
								<td class="danger">${order.orderGetPhone}</td>
							</tr>
							
					</table>
				
				</div>
			<h4><span class="label label-danger">购买商品情况:</span></h4>
			<table class="table">
  				<tr>
					<td >手表序列号</td>
					<td >商品原价</td>
					<td >优惠价格</td>
					<td >产品数量</td>
					<td >产品主图</td>
					<td >订单状态</td>
					<td >时间</td>
				</tr>
				<c:forEach items="${order.orderDetail}" var="orderDetail">
				<tr>
					<td >${orderDetail.orderWatchSerialNumber}</td>
					<td >${orderDetail.orderDetailOldPrice}</td>
					<td >${orderDetail.orderDetailDiscountPrice}</td>
					<td >${orderDetail.orderWatchNumber}</td>
					<td >${orderDetail.orderDetailPicture}</td>
					<td >${orderDetail.orderDetailState}</td>
					<td >${orderDetail.orderDetailTime}</td>
				</tr>
				</c:forEach>
			</table>
			
			
			</div>

		</div>
	</div>
</body>
</html>