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
<script type="text/javascript">
function page(n,s){
	if (n) $("#pageNo").val(n);
	if (s) $("#pageSize").val(s);
	$("#orderForm").submit();
	return false;
	
}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/order/list">订单管理</a></li>
				</ul>
				<br>
				<form id="orderForm" action="${pageContext.request.contextPath }/a/order/list" method="post">
				<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
				<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td class="active">订单编号</td>
							<td class="success">用户</td>
							<td class="success">交易号</td>
							<td class="warning">订单创建时间</td>
							<td class="warning">订单支付时间</td>
							<td class="warning">发货时间</td>
							<td class="warning">订单完成时间</td>
							<td class="danger">订单总价</td>
							<td class="danger">订单优惠金额</td>
							<td class="danger">邮费</td>
							<!-- <td class="danger">收货人</td>
							<td class="danger">收货地址</td>
							<td class="info">收货人电话</td> -->
							<td class="info">操作</td>
						</tr>
						<c:forEach items="${page.list}" var="order">
							<tr>
								<td class="active">${order.orderNumber}</td>
								<td class="success">${order.userName}</td>
								<td class="success">${order.orderTradeNumber}</td>
								<td class="warning">${order.orderCreateTime}</td>
								<td class="warning">${order.orderPayTime}</td>
								<td class="warning">${order.orderSendTime}</td>
								<td class="warning">${order.orderCloseTime}</td>
								<td class="danger">${order.orderAllPrice}</td>
								<td class="danger">${order.orderDiscount}</td>
								<td class="danger">${order.orderSendPrice}</td>
								<td class="info">
									<a class="caozhuo-class" href="${pageContext.request.contextPath }/a/order/details?id=${order.id}">详情</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div>${page}</div>
				</div>
				</form>
			</div>

		</div>
	</div>
</body>
</html>