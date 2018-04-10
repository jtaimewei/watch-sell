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
td{
	white-space:nowrap;
}
</style>
<script type="text/javascript">
function page(n,s){
	if (n) $("#pageNo").val(n);
	if (s) $("#pageSize").val(s);
	$("#myOrderForm").submit();
	return false;
	
}
</script>
</head>
<body>
	<br>
	
	<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="thumbnail myDiv">
			      	<div class="caption">
			      		<c:forEach items="${page.list}" var="order">
			      		<div class="thumbnail" style="overflow-x: auto;">
			      	<div class="caption">
			      			<table class="table">
							<tr>
							<td class="active">订单编号</td>
							<td class="success">交易号</td>
							<td class="success">订单状态</td>
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
								<td class="success">
									<c:if test="${order.orderState == '0'}">
									<span style="color: red;">待支付</span>
									</c:if>
									<c:if test="${order.orderState == '2'}">
									<span style="color: red;">待收货</span>
									</c:if>
									<c:if test="${order.orderState == '3'}">
									<span style="color: red;">已收货</span>
									</c:if>
									<c:if test="${order.orderState == '4'}">
									<span style="color: red;">退货中</span>
									</c:if>
									<c:if test="${order.orderState == '5'}">
									<span style="color: red;">退货成功</span>
									</c:if>
									<c:if test="${order.orderState == '6'}">
									<span style="color: red;">交易完成</span>
									</c:if>
								</td>
								<td class="warning">${order.orderCreateTime}</td>
								<td class="warning">
								<c:if test="${order.orderState == '0'}">
								<span style="color: red;">待支付</span>
								</c:if>
								<c:if test="${order.orderState != '0'}">
								${order.orderPayTime}
								</c:if>
								</td>
								<td class="warning">${order.orderSendTime}</td>
								<td class="warning">${order.orderCloseTime}</td>
								<td class="danger">￥${order.orderAllPrice}</td>
								<td class="danger">${order.orderDiscount}</td>
								<td class="danger">${order.orderSendPrice}</td>
								<td class="danger">${order.orderGetName}</td>
								<td class="danger">${order.orderGetAddress}</td>
								<td class="danger">${order.orderGetPhone}</td>
							</tr>
							
					</table>
					<table class="table">
  				<tr>
					<td >产品主图</td>
					<td >手表序列号</td>
					<td >商品信息</td>
					<td >商品原价</td>
					<td >优惠价格</td>
					<td >产品数量</td>
					<td >订单状态</td>
					<td >时间</td>
				</tr>
				<c:forEach items="${order.orderDetail}" var="orderDetail">
				<tr>
					<%-- <td >${orderDetail.orderDetailPicture}</td> --%>
					<td ><img alt="" src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" width="100px;" height="100px;"></td>
					<td >${orderDetail.orderWatchSerialNumber}</td>
					<td ><span >${orderDetail.orderWatchTitle}</span></td>
					<td >￥${orderDetail.orderDetailOldPrice}</td>
					<td >${orderDetail.orderDetailDiscountPrice}</td>
					<td >${orderDetail.orderWatchNumber}</td>
					<td >${orderDetail.orderDetailState}</td>
					<td >${orderDetail.orderDetailTime}</td>
				</tr>
				</c:forEach>
			</table>
			<c:if test="${order.orderState == '0'}">
				<form action="${pageContext.request.contextPath }/b/user/order/toPay" method="post">
	      			<input type="hidden" name="id" value="${order.id}">
	      			<input type="hidden" name="orderNumber" value="${order.orderNumber}">
	      			<input type="hidden" name="orderAllPrice" value="${order.orderAllPrice}">
	      			<button  type="submit" class="btn btn-danger" style="margin-left: 26px;">支付订单</button>
      			</form>			
			</c:if>
			<c:if test="${order.orderState == '2'}">
				<form action="${pageContext.request.contextPath }/b/user/order/toPay" method="post">
	      			<input type="hidden" name="id" value="${order.id}">
	      			<input type="hidden" name="orderNumber" value="${order.orderNumber}">
	      			<input type="hidden" name="orderAllPrice" value="${order.orderAllPrice}">
	      			<button  type="submit" class="btn btn-success" style="margin-left: 26px;">确认收货</button>
      			</form>			
			</c:if>
			<button type="submit" class="btn btn-success" style="margin-left: 26px;">删除订单</button>
					</div></div>
			      		</c:forEach>
				  	</div>
				  	<form id="myOrderForm" action="${pageContext.request.contextPath}/b/user/order/myOrder" method="post">
						<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
						<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
						<input type="hidden" name="userId" value="${gUser.id}">
				  	<div>${page}</div>
				  	</form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>