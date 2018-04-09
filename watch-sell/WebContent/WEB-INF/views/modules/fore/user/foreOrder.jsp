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
.recSpan{
	margin-left: 10px;
}
.header-notice {
	margin-left: 120px;
	color: red;
}
</style>
<script type="text/javascript">
$(function(){
	//添加地址
	$(".header-notice").hide();
	$("#addRecButton").click(function(){
		$(".header-notice").hide();
		var key = true;
		$("#recForm").find(".form-control").each(function(){
			//alert($(this).val());
			if ($(this).val() == '') {
				key = false;
				$(this).parent().next().show();
			}
		});
		
		if (key == true) {
			$("#recForm").submit();
		}
	});
	/* 提交订单 */
	$("#buyButton").click(function(){
		$("#addOrderForm").submit();
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
					<label>送货清单&nbsp;&nbsp;&nbsp;(${fn:length(orderDetailList)})</label>
					<table class="table table-striped">
						<tr>
							<th>商品图</th>
							<th>商品信息</th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
						<c:forEach items="${orderDetailList}" var="orderDetail">
							<tr>
								<th>
									<%-- <img alt="" src="${ctxStatic}/resources/watch/${orderDetail.orderDetailPicture}"> --%>
									<img alt="" src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" width="100px;" height="100px;">
								</th>
								<th>${orderDetail.orderWatchTitle}</th>
								<th>￥${orderDetail.orderDetailOldPrice}</th>
								<th>${orderDetail.orderWatchNumber}</th>
								<th>￥${orderDetail.orderDetailOldPrice * orderDetail.orderWatchNumber}</th>
							</tr>
						</c:forEach>
					</table>
					<label style="font-size: 18px;">选择收货地址:</label>&nbsp;&nbsp;&nbsp;
					<button id="addBu" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
						 添加收货地址
					</button>
					<br><br>
					<form id="addOrderForm" action="${pageContext.request.contextPath }/b/user/addOrder" method="post">
						<div style="font-size: 17px;">
							<c:forEach items="${recs}" var="rec">
								<div><input name="id" type="radio" value="${rec.id}"><span class="recSpan">收货人姓名:</span><span class="recSpan">${rec.recName}</span><span class="recSpan">收货人电话:</span><span class="recSpan">${rec.recPhone}</span><span class="recSpan">收货人地址:</span><span class="recSpan">${rec.recAddress}</span></div>
							</c:forEach>
						</div>
						<br><br>
						<label style="font-size: 18px;">留言:</label><br><textarea name="remarks" rows="3" cols="3" style="width: 300px;"></textarea>
						<br><br>
						<button id="buyButton" type="button" class="btn btn-danger buyButton" style="float: right;width: 200px;height: 50px;font-size: 16px;">提交订单</button>
						<label style="float: right;margin-top: 20px;margin-right: 20px;">应付款:<span style="color: #990000;font-size: 20px;">￥${total}</span></label>
					</form>	
				</div>
			</div>
		</div>

	</div>
	
	<!-- 模态框 添加收货地址 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">添加收货地址</h4>
						      </div>
						      <div class="modal-body">
						  <form id="recForm" class="form-horizontal" action="${pageContext.request.contextPath }/b/user/addOrder/reception/add" method="post">
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">收货人</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										  name="recName" placeholder="收货人">
								</div>
								<p class="header-notice">*请输入收货人</p>
							</div>
							
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">联系方式</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" 
										 name="recPhone" placeholder="联系方式">
								</div>
								<p class="header-notice">*请输入联系方式</p>
							</div>
							
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">收货地址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
									 name="recAddress" placeholder="收货地址">
								</div>
								<p class="header-notice">*请输入收货地址</p>
							</div>
				
						</form>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" id="addRecButton" class="btn btn-primary">保存</button>
						      </div>
						    </div>
						  </div>
						</div>
</body>
</html>