<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	$("#crowd-div").hide();
	$("#movement-div").hide();
	$("#watch-div").hide();
	/* 1-2-3 模糊匹配 */
	$("#search-brand").keyup(function(){
    	//alert(1);
	     $("#brand-div button")
		     .hide()
		     .filter(":contains('"+( $(this).val() )+"')")
		     .show();
	    });
	$("#search-crowd").keyup(function(){
    	//alert(1);
	     $("#crowd-div button")
		     .hide()
		     .filter(":contains('"+( $(this).val() )+"')")
		     .show();
	    });
	$("#search-movement").keyup(function(){
    	//alert(1);
	     $("#movement-div button")
		     .hide()
		     .filter(":contains('"+( $(this).val() )+"')")
		     .show();
	    });
	/* 右侧 选择 1-2-3-4 */
	$("#step-brand").click(function(){
		$("#brand-div").show();
		$("#crowd-div").hide();
		$("#movement-div").hide();
		$("#watch-div").hide();
	});
	$("#step-crowd").click(function(){
		$("#brand-div").hide();
		$("#crowd-div").show();
		$("#movement-div").hide();
		$("#watch-div").hide();
	});
	$("#step-movement").click(function(){
		$("#brand-div").hide();
		$("#crowd-div").hide();
		$("#movement-div").show();
		$("#watch-div").hide();
	});
	$("#step-watch").click(function(){
		$("#brand-div").hide();
		$("#crowd-div").hide();
		$("#movement-div").hide();
		$("#watch-div").show();
	});
	/* 1-2-3步 选择的数据映射到左侧 */
	$(".brand-class").click(function(){
		$("#brand-label").html($(this).html());
		$("#brand-label").next().val($(this).attr("name"));
	});
	$(".crowd-class").click(function(){
		$("#crowd-label").html($(this).html());
		$("#crowd-label").next().val($(this).attr("name"));
	});
	$(".movement-class").click(function(){
		$("#movement-label").html($(this).html());
		$("#movement-label").next().val($(this).attr("name"));
	});
	/* 增加文件 */
	$("#addFile").click(function(){
		$("#fileDiv").append('<br><label>附图</label><input type="file" id="exampleInputFile">');
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
				<form:form action="${pageContext.request.contextPath }/a/watch/add"
  modelAttribute="multiFileUploadForm" method="post"
  enctype="multipart/form-data">
				<div class="col-md-2">
					<h4><span class="label label-danger">选择的品牌</span></h4>
					<label id="brand-label"></label>
					<input type="hidden" name="brandId">
					<br>
					<h4><span class="label label-danger">选择的人群</span></h4>
					<label id="crowd-label"></label>
					<input type="hidden" name="crowdId">
					<br>
					<h4><span class="label label-danger">选择的机芯</span></h4>
					<label id="movement-label"></label>
					<input type="hidden" name="movementId">
					<br>
					<h4><span class="label label-danger">选择的名表</span></h4>
					<br>
					<input type="submit" class="btn btn-danger btn-block" value="提 交">
				</div>
				<div class="col-md-10">
				<div class="btn-group btn-group-justified" role="group" aria-label="123">
				  <div class="btn-group" role="group">
				    <button type="button" id="step-brand" class="btn btn-default">1.选择品牌:</button>
				  </div>
				  <div class="btn-group" role="group">
				    <button type="button" id="step-crowd" class="btn btn-default">2.选择人群:</button>
				  </div>
				  <div class="btn-group" role="group">
				    <button type="button" id="step-movement" class="btn btn-default">3.选择机芯:</button>
				  </div>
				  <div class="btn-group" role="group">
				    <button type="button" id="step-watch" class="btn btn-default">4.填写产品:</button>
				  </div>
				</div>
				<br>
				<!-- 	<h3><span class="label label-primary">1.选择品牌:</span>&nbsp;
					<span class="label label-primary">2.选择人群:</span>&nbsp;
					<span class="label label-primary">3.选择机芯:</span>&nbsp;
					<span class="label label-primary">3.填写产品:</span>&nbsp;
					</h3> -->
				<div id="brand-div">
					<div class="input-group col-md-2">
  						<span class="input-group-addon">品牌</span>
  						<input type="text" id="search-brand" class="form-control" placeholder="" aria-describedby="basic-addon1">
					</div>
					<br>
					<div >
						<c:forEach items="${brands}" var="brand">
							<button type="button" name="${brand.id}" class="btn btn-info brand-class">${brand.brandName}</button>
						</c:forEach>
					</div>
				</div>
				
				
				<div id="crowd-div">
					<div class="input-group col-md-2">
  						<span class="input-group-addon">人群</span>
  						<input type="text" id="search-crowd" class="form-control" placeholder="" aria-describedby="basic-addon1">
					</div>
					<br>
					<div id="">
						<c:forEach items="${crowds}" var="crowd">
							<button type="button" name="${crowd.id}" class="btn btn-info crowd-class">${crowd.crowdName}</button>
						</c:forEach>
					</div>
				</div>
				
				
				<div id="movement-div">
					<div class="input-group col-md-2">
  						<span class="input-group-addon">机芯</span>
  						<input type="text" id="search-movement" class="form-control" placeholder="" aria-describedby="basic-addon1">
					</div>
					<br>
					<div id="">
						<c:forEach items="${movements}" var="movement">
							<button type="button" name="${movement.id}" class="btn btn-info movement-class">${movement.movementName}</button>
						</c:forEach>
					</div>
				</div>
				
				
					<div id="watch-div">
						<div class="input-group">
	  						<span class="input-group-addon">标&nbsp;&nbsp;&nbsp;题</span>
	 						<input type="text" name="watchTitle" class="form-control" placeholder="" aria-describedby="basic-addon1">
							<label>*必填*</label>
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">简&nbsp;&nbsp;&nbsp;介</span>
	 						<input type="text" name="watchIntroduce" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">型&nbsp;&nbsp;&nbsp;号</span>
	 						<input type="text" name="watchModel" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">编&nbsp;&nbsp;&nbsp;号</span>
	 						<input type="text" name="watchSerialNumber" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">原价格</span>
	 						<input type="text" name="watchOrgPrice" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">现价格</span>
	 						<input type="text" name="watchPrePrice" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">数&nbsp;&nbsp;&nbsp;量</span>
	 						<input type="text" name="watchNumber" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">机&nbsp;&nbsp;&nbsp;芯</span>
	 						<input type="text" name="watchMovement" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">外&nbsp;&nbsp;&nbsp;壳</span>
	 						<input type="text" name="watchShell" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">表&nbsp;&nbsp;&nbsp;盘</span>
	 						<input type="text" name="watchDial" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">表&nbsp;&nbsp;&nbsp;带</span>
	 						<input type="text" name="watchStrap" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">表&nbsp;&nbsp;&nbsp;扣</span>
	 						<input type="text" name="watchClasp" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">年&nbsp;&nbsp;&nbsp;份</span>
	 						<input type="text" name="watchYear" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">重&nbsp;&nbsp;&nbsp;量</span>
	 						<input type="text" name="watchWeight" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div class="input-group">
	  						<span class="input-group-addon">防&nbsp;&nbsp;&nbsp;水</span>
	 						<input type="text" name="watchWaterproof" class="form-control" placeholder="" aria-describedby="basic-addon1">
						</div>
						<br>
						<div id ="fileDiv" class="form-group">
    						<label for="exampleInputFile">上传产品图片</label><button id="addFile" type="button" class="btn btn-warning">增加文件</button>
    						<br><label>主图</label><input name="uploadFiles[0]" type="file" id="exampleInputFile">
    						<br><label>附图</label><input name="uploadFiles[1]" type="file" id="exampleInputFile">
    						<br><label>附图</label><input name="uploadFiles[2]" type="file" id="exampleInputFile">
  						</div>
						
					</div>
					
				</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>