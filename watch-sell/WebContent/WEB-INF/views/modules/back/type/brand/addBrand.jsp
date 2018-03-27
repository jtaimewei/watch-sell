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
		$(".role-add-notice").hide();
		$("#addBrandButton").click(function(){
			$(".role-add-notice").hide();
			key = true;
			if ($("#brandName").val() == null ||$("#brandName").val() == '') {
				key = false;
				$("#role-name-add-notice").show();
			}
			
			if(key == true){
				$("#addBrandForm").submit();
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
				<ul class="nav nav-tabs">
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/type/brand/list">品牌列表</a></li>
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/type/brand/save">添加品牌</a></li>
				</ul>
				<br><br>
				<div class="col-md-6 col-md-offset-1">
				<form id="addBrandForm" action="${pageContext.request.contextPath }/a/type/brand/save" method="post">
				 		<div class="input-group input-group-lg">
  							<span class="input-group-addon" id="sizing-addon1">品牌名*</span>
  							<input type="text" id="brandName" name="brandName" class="form-control" aria-describedby="sizing-addon1">
							<p id="role-name-add-notice" class="role-add-notice">*请输入品牌名</p>
						</div>
						<br><br>
							<button type="button" id="addBrandButton" class="btn btn-primary btn-lg btn-block">添加</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>