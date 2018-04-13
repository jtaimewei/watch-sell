<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台菜单管理</title>
<script type="text/javascript" src="${ctxStatic}/resources/js/jquery-1.11.3.js"></script>
<style type="text/css">
.role-add-notice{
	white-space: nowrap;
	margin-top: 8px;
	color: red;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".rigthDiv").height($(window).height());
		$(".role-add-notice").hide();
		$("#addCrowdButton").click(function(){
			$(".role-add-notice").hide();
			key = true;
			if ($("#crowdName").val() == null ||$("#crowdName").val() == '') {
				key = false;
				$("#role-name-add-notice").show();
			}
			
			if(key == true){
				$("#addCrowdForm").submit();
			}
		});
	});

</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/modules/back/type/headerType.jsp"%>
			<div class="col-md-10">
			<div class="thumbnail rigthDiv">
			  <div class="caption">
				<ul class="nav nav-tabs">
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/type/crowd/list">人群列表</a></li>
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/type/crowd/save">添加人群</a></li>
				</ul>
				<br><br>
				<div class="row">
				<div class="col-md-6 col-md-offset-1">
				<form id="addCrowdForm" action="${pageContext.request.contextPath }/a/type/crowd/save" method="post">
				 		<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">人群*</span>
  							<input type="text" id="crowdName" name="crowdName" class="form-control" aria-describedby="sizing-addon1">
							<p id="role-name-add-notice" class="role-add-notice">*请输入人群名</p>
						</div>
						<br><br>
							<button type="button" id="addCrowdButton" class="btn btn-primary btn-lg btn-block">添加</button>
					</form>
				</div>
				</div>
			</div>
			</div>
			</div>

		</div>
	</div>
</body>
</html>