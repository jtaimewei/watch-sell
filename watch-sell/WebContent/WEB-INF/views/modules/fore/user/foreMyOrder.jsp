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
.backButton{
	float: right;
    width: 120px;
}
</style>
<script type="text/javascript">
function page(n,s){
	if (n) $("#pageNo").val(n);
	if (s) $("#pageSize").val(s);
	$("#myOrderForm").submit();
	return false;
	
}
$(function(){
	var ts;
	//点击退货
	$(".backButton").click(function(){
		$("#messageSpan").html("");
		ts = $(this);
		/* var key = false;
		$(this).parent().find("input[name='id']").each(function(){
			//alert($(this).val());
			if ($(this).is(':checked')) {
				key = true;
			}
		});
		if (key == true) {
			alert(1);
			//$(this).parent().submit();
		} else {
			return;
		} */
		
		
	});
	//提示退货信息，然后提交退货form
	$("#backModelButton").click(function(){
		$("#messageSpan").html("");
		var key = false;
		ts.parent().find("input[name='id']").each(function(){
			//alert($(this).val());
			if ($(this).is(':checked')) {
				key = true;
			}
		});
		if (key == true) {
			//alert(1);
			ts.parent().submit();
		} else {
			$("#messageSpan").html("[请选择要退货的商品]");
		}
	});
	
	/* 全选 */
	$(".allCheck").click(function(){
		var xz = $(this).prop("checked");//判断全选按钮的选中状态
        var ck =$(this).parent().parent().parent().find(".chCheck").prop("checked",xz);  //让class名为qx的选项的选中状态和全选按钮的选中状态一致。 
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
				<div class="thumbnail myDiv">
			      	<div class="caption">
			      	<h4><label>我的订单:</label></h4>	
			      		<c:forEach items="${page.list}" var="order">
			      		<div class="thumbnail" style="overflow-x: auto;">
			      	<div class="caption">
			      	 <form  action="${pageContext.request.contextPath }/b/user/order/back" method="post">
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
									<span style="color: red;">待评价</span>
									</c:if>
									<c:if test="${order.orderState == '7'}">
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
					<c:if test="${order.orderState == '2'}">
					<td >
					 退货<input type="checkbox" class="allCheck">
					</td>
					</c:if>
				</tr>
				<c:forEach items="${order.orderDetail}" var="orderDetail">
				<tr>
					<%-- <td >${orderDetail.orderDetailPicture}</td> --%>
					<td ><img alt="" src="/image/${orderDetail.orderDetailPicture}" width="100px;" height="100px;"></td>
					<td >${orderDetail.orderWatchSerialNumber}</td>
					<td ><span >${orderDetail.orderWatchTitle}</span></td>
					<td >￥${orderDetail.orderDetailOldPrice}</td>
					<td >${orderDetail.orderDetailDiscountPrice}</td>
					<td >${orderDetail.orderWatchNumber}</td>
					<td >
						<c:if test="${orderDetail.orderDetailState == '0'}">
							交易成功
						</c:if>
						<c:if test="${orderDetail.orderDetailState == '1'}">
							退货
						</c:if>
					</td>
					<td >${orderDetail.orderDetailTime}</td>
					<c:if test="${order.orderState == '2'}">
						<td >
						<input class="chCheck" type="checkbox" name="id" value="${orderDetail.id}">
					</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			<c:if test="${order.orderState == '2'}">
			<input type="hidden" name="orderId" value="${order.id}">
			 <button type="button" class="btn btn-default btn-sm backButton" data-toggle="modal" data-target="#myModal">退货</button>
			 </c:if>
			</form>
			<br>
			<div class="row">
			<div class="col-md-1">
			<c:if test="${order.orderState == '0'}">
				<form action="${pageContext.request.contextPath }/b/user/order/toPay" method="post">
	      			<input type="hidden" name="id" value="${order.id}">
	      			<input type="hidden" name="orderNumber" value="${order.orderNumber}">
	      			<input type="hidden" name="orderAllPrice" value="${order.orderAllPrice}">
	      			<button  type="submit" class="btn btn-danger" style="margin-left: 26px;">支付订单</button>
      			</form>			
			</c:if>
			<c:if test="${order.orderState == '2'}">
				<form action="${pageContext.request.contextPath }/b/user/order/okOrder" method="post">
	      			<input type="hidden" name="id" value="${order.id}">
	      			<button  type="submit" class="btn btn-success" style="margin-left: 26px;">确认收货</button>
      			</form>			
			</c:if>
			<c:if test="${order.orderState == '6'}">
				<form action="${pageContext.request.contextPath }/b/user/order/toComment" method="post">
	      			<input type="hidden" name="id" value="${order.id}">
	      			<button  type="submit" class="btn btn-success" style="margin-left: 26px;">评论</button>
      			</form>			
			</c:if>
			<c:if test="${order.orderState == '7'}">
				<form action="${pageContext.request.contextPath }/b/user/order/detail" method="post">
	      			<input type="hidden" name="id" value="${order.id}">
	      			<button  type="submit" class="btn btn-success" style="margin-left: 26px;">详情</button>
      			</form>			
			</c:if>
			</div>
			<div class="col-md-1">
			<form action="${pageContext.request.contextPath }/b/user/order/deleteOrder" method="post">
	      			<input type="hidden" name="id" value="${order.id}">
					<button type="submit" class="btn btn-success" style="margin-left: 26px;">删除订单</button>
      			</form>	
      			</div>
      			</div>
					</div></div>
			      		</c:forEach>
				  	</div>
				  	<form id="myOrderForm" action="${pageContext.request.contextPath}/b/user/order/myOrder" method="post">
						<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
						<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
						<input type="hidden" name="userId" value="${gUser.id}">
				  	<div style="margin-left: 10px;">${page}</div>
				  	</form>
				</div>
			</div>
		</div>

	</div>
	
	<!-- 模态框 退货-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">确认退货<span id="messageSpan" style="color: red;margin-left: 120px;"></span></h4>
						      </div>
						      <div class="modal-body">
							<input type="hidden" id="backId" name="id">
							<input type="hidden" id="backOrderId" name="orderId">
							<label>退货须知:</label>
							<p>1.若手表已摘吊牌或人为损坏，将不提供退换货。</p>
							<p>2.退货请在物流显示签收日期的7日内退回，超过时间不能退货。</p>
							<p>3.请记录好返件的物流单号，如果不能确定是否收到货，将以提供的物流单号为准。</p>
							<p>2.退货请寄地址深圳市南山区迈科龙A1301，70550143，名表网售后收，不接收到付运费的包裹和平邮件。</p>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" id="backModelButton" class="btn btn-primary">确认退货</button>
						      </div>
						    </div>
						  </div>
						</div>
</body>
</html>