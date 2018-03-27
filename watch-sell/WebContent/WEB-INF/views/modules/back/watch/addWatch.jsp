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
$(function(){
	$("#search-input").keyup(function(){
    	//alert(1);
	     $("#brand-div span")
		     .hide()
		     .filter(":contains('"+( $(this).val() )+"')")
		     .show();
	    });
})
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs">
					<li role="presentation" ><a href="${pageContext.request.contextPath }/a/watch/list">名表列表</a></li>
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/a/watch/save">添加名表</a></li>
				</ul>
				<br>
				<div class="btn-group btn-group-justified" role="group" aria-label="...">
				  <div class="btn-group" role="group">
				    <button type="button" class="btn btn-default">1.选择品牌:</button>
				  </div>
				  <div class="btn-group" role="group">
				    <button type="button" class="btn btn-default">2.选择人群:</button>
				  </div>
				  <div class="btn-group" role="group">
				    <button type="button" class="btn btn-default">3.选择机芯:</button>
				  </div>
				  <div class="btn-group" role="group">
				    <button type="button" class="btn btn-default">4.填写产品:</button>
				  </div>
				</div>
				<h3><span class="label label-primary">1.选择品牌:</span>&nbsp;
				<span class="label label-primary">2.选择人群:</span>&nbsp;
				<span class="label label-primary">3.选择机芯:</span>&nbsp;
				<span class="label label-primary">3.填写产品:</span>&nbsp;
				</h3>
				<div id="brand-div">
					<input id="search-input" type="text">
					<div id="brand-div">
						<c:forEach items="${brands}" var="brand">
							<span>${brand.brandName}</span>
						</c:forEach>
					</div>
				</div>
				<div id="crowd-div">
					<input id="search-input" type="text">
					<div id="">
						<c:forEach items="${crowds}" var="crowd">
							<span>${crowd.crowdName}</span>
						</c:forEach>
					</div>
				</div>
				<div id="movement-div">
					<input id="search-input" type="text">
					<div id="">
						<c:forEach items="${movements}" var="movement">
							<span>${movement.movementName}</span>
						</c:forEach>
					</div>
				</div>
				<div id="watch-div">
					产品
				</div>
			</div>
		</div>
	</div>
</body>
</html>