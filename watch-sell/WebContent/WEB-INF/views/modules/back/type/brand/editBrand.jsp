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
.role-edit-notice{
	white-space: nowrap;
	margin-top: 8px;
	color: red;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".rigthDiv").height($(window).height());
		$(".role-edit-notice").hide();
		$("#editBrandButton").click(function(){
			$(".role-edit-notice").hide();
			key = true;
			if ($("#brandName").val() == null ||$("#brandName").val() == '') {
				key = false;
				$("#role-name-edit-notice").show();
			}
			
			if(key == true){
				$("#editBrandForm").submit();
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
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/type/brand/list">品牌列表</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/a/type/brand/save">添加品牌</a></li>
					<li role="presentation" class="active"><a href="#">修改</a></li>
				</ul>
				<br><br>
				<div class="row">
				<div class="col-md-6 col-md-offset-1">
				<form id="editBrandForm" action="${pageContext.request.contextPath }/a/type/brand/edit" method="post">
				 		<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">品牌ID</span>
  							<input type="hidden" name="id" value="${brand.id}">
  							<input type="text" value="${brand.id}" class="form-control" disabled="disabled" aria-describedby="sizing-addon1">
						</div>
						<br><br>
				 		<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">品牌名*</span>
  							<input type="text" id="brandName" name="brandName" value="${brand.brandName }" class="form-control" aria-describedby="sizing-addon1">
							<p id="role-name-edit-notice" class="role-edit-notice">*请输入品牌名</p>
						</div>
						<br><br>
							<button type="button" id="editBrandButton" class="btn btn-primary btn-lg btn-block">修改</button>
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