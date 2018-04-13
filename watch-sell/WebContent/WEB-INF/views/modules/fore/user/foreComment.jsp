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

.noticeSpan{
    color: #990000;
    font-size: 16px;
    margin-left: 20px;
    display: none;
}
</style>
<script type="text/javascript">

$(function(){
	$("#commentButton").click(function(){
		$(".noticeSpan").hide();
		var key = true;
		$(".watchRemarks").each(function(){
			if ($(this).val() == '') {
				$(this).next().show();
				key = false;
			}
		});
		if (key == true) {
			$("#commentForm").submit();
		}
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
			      	<h4><label>商品评价</label></h4>	
			      		<div class="thumbnail" style="overflow-x: auto;">
			      	<div class="caption">
			      	
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
						</tr>
						
							<tr>
								<td class="active">${order.orderNumber}</td>
								<td class="success">${order.orderTradeNumber}</td>
								<td class="warning">${order.orderCreateTime}</td>
								<td class="warning">${order.orderPayTime}</td>
								<td class="warning">${order.orderSendTime}</td>
								<td class="warning">${order.orderCloseTime}</td>
								<td class="danger">￥${order.orderAllPrice}</td>
								<td class="danger">${order.orderDiscount}</td>
							</tr>
							
					</table>
					</div></div>
		<form id="commentForm" action="${pageContext.request.contextPath}/b/user/order/comment" method="post">			
	     	<input type="hidden" name="id" value="${order.id}">	
			
			<c:forEach items="${order.orderDetail}" var="orderDetail" varStatus="status">		
				<div class="thumbnail" style="overflow-x: auto;">
			      	<div class="caption">
			      	<input type="hidden" name="orderDetail[${ status.index}].id" value="${orderDetail.id}">	
			      	<input type="hidden" name="orderDetail[${ status.index}].watchId" value="${orderDetail.watchId}">	
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
					
				</tr>
				
			</table>
			<br>
			<label>评价（请做出客观评价）</label>
			<br>
			<textarea class="watchRemarks" name="orderDetail[${ status.index}].remarks" rows="3" cols="3" style="width: 400px;"></textarea>
			<span class="noticeSpan">*请填写评价内容!</span>
			<br>
			
		</div></div>
		</c:forEach>
	</form>
		<button id="commentButton" type="button" class="btn btn-danger buyButton" style="margin-left: 445px;width: 200px;height: 50px;font-size: 16px;">提交</button>
			      		
				  	</div>
				  	
				</div>
			</div>
		</div>

	</div>
	
	
</body>
</html>