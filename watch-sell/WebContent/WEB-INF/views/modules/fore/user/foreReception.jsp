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
.header-user-notice {
	white-space: nowrap;
	margin-top: 8px;
	color: red;
}
.header-notice {
	margin-left: 120px;
	color: red;
}

.form-group {
	margin-top: 20px;
}
#notice-div{
	position: fixed;
	z-index: 999;
	left: 560px;
    top: 100px;
}
#addBu{
	    margin-left: 135px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#notice-div").hide();
		$(".header-notice").hide();
		$(".header-user-notice").hide();
		//添加地址
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
		//修改地址
		$(".editButton").click(function(){
			var th = $(this).parent().parent().parent();
			th.find(".header-user-notice").hide();
			var key1 = true;
			
			var id = th.find(".id").val();
			var recName = th.find(".recName").val();
			var recPhone = th.find(".recPhone").val();
			var recAddress = th.find(".recAddress").val();
			if (recName == '') {
				th.find(".rec-recName").show();
				key1 = false;
			}
			if (recPhone == '') {
				th.find(".rec-recPhone").show();
				key1 = false;
			}
			if (recAddress == '') {
				th.find(".rec-recAddress").show();
				key1 = false;
			}
			if (key1 == true) {
				
				$.ajax({  
				    type: "POST",  
				    url: "${pageContext.request.contextPath}/b/user/reception/edit",  
				    data:JSON.stringify({
				    	"id":id,
				    	"recName":recName,
				    	"recPhone":recPhone,
				    	"recAddress":recAddress
	                }),  
				    async: false,
				    contentType:"application/json;charset=utf-8",
				    error: function() {  
				        alert("修改失败");  
				    },  
				    success: function(data) {
				    	$("#notice-div").html("修改成功！");
				    	$("#notice-div").show();
				    	setTimeout(function(){$("#notice-div").hide();},2000);//2秒后执行该方法
				    }  
				  });
			}
			
		});
		//删除地址
		$(".deleteButton").click(function(){
			var th = $(this).parent().parent().parent();
			var id = th.find(".id").val();
			$.ajax({  
			    type: "POST",  
			    url: "${pageContext.request.contextPath}/b/user/reception/delete",  
			    data:{"id":id},  
			    async: false,
			    error: function() {  
			        alert("删除失败");  
			    },  
			    success: function(data) {
			    	th.remove(); 
			    	$("#notice-div").html("删除成功！");
			    	$("#notice-div").show();
			    	setTimeout(function(){$("#notice-div").hide();},2000);//2秒后执行该方法
			    	}
			    	
			    });
		})
	})
	
</script>
</head>
<body>
<div id="notice-div" class="alert alert-danger" style="padding: 5px;" role="alert"></div>
	<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
	<div class="container-fluid">
		<div class="row">
		<%@ include file="/WEB-INF/views/modules/fore/user/leftUser.jsp"%>
			<div class="col-md-10">
				<div class="thumbnail myDiv">
			      	<div class="caption">
					<br>
					<button id="addBu" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
						 添加收货地址
					</button>
						
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">添加收货地址</h4>
						      </div>
						      <div class="modal-body">
						  <form id="recForm" class="form-horizontal" action="${pageContext.request.contextPath }/b/user/reception/add" method="post">
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
					<c:forEach items="${recs}" var="rec">
						<div class="form-horizontal">
							<div class="form-group">
							<input type="hidden" class="id" value="${rec.id}">
								<label for="inputPassword3" class="col-sm-2 control-label">收货人</label>
								<div class="col-sm-4">
									<input type="text" class="form-control recName"
										 value="${rec.recName }"  placeholder="收货人">
								</div>
								<p class="header-user-notice rec-recName">*请输入收货人</p>
							</div>
							
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">联系方式</label>
								<div class="col-sm-4">
									<input type="text" class="form-control recPhone" 
										value="${rec.recPhone }" placeholder="联系方式">
								</div>
								<p class="header-user-notice rec-recPhone">*请输入联系方式</p>
							</div>
							
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">收货地址</label>
								<div class="col-sm-4">
									<input type="text" class="form-control recAddress"
									value="${rec.recAddress }" placeholder="收货地址">
								</div>
								<p  class="header-user-notice rec-recAddress">*请输入收货地址</p>
							</div>
				
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-default editButton">修改</button>
									<button type="button" class="btn btn-default deleteButton">删除</button>
								</div>
							</div>
						</div>
					</c:forEach>
						
						
						
				</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>