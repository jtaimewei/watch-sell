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
.searchDiv{
	border: 0.5px solid gray;
	width: 95%;
	margin-left: 37px;
	border-radius: 7px;
}
.watchDiv{
	width: 95%;
	margin-left: 37px;
}
.searchLabel {
	width: 100px;
}
.watchNumber {
    background: #fafafa;
    padding-left: 10px;
}
.pirceWatch {
	padding-left: 10px;
	margin-top: 20px;
}
.brandWatch {
	padding-left: 10px;
}
.crowWatch {
	padding-left: 10px;
}
.moveWatch {
	padding-left: 10px;
}
.labelType {
	margin-left: 20px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
<%@ include file="/WEB-INF/views/modules/fore/head/foreHead2.jsp"%>	
<br>
<div class="row">
	<div class="searchDiv">
		<div class="watchNumber">已找到${page.count }件:</div>
		<div class="pirceWatch">
			<label class="searchLabel">价格</label>
			<label class="labelType"><a href="">1000以下</a></label>
			<label class="labelType"><a href="">1000-3000</a></label>
			<label class="labelType"><a href="">3000-5000</a></label>
			<label class="labelType"><a href="">5000-10000</a></label>
			<label class="labelType"><a href="">10000-50000</a></label>
			<label class="labelType"><a href="">50000-100000</a></label>
			<label class="labelType"><a href="">100000以上</a></label>
		</div>
		<!-- <hr style="margin-top: 1px; margin-bottom: 1px;"> -->
		<hr>
		<div class="brandWatch">
			<label class="searchLabel">品牌</label>
			<c:forEach items="${brands}" var="brand">
			<label class="labelType"><a href="${pageContext.request.contextPath }/b/watch/brand?id=${brand.id}">${brand.brandName}</a></label>
			</c:forEach>
		</div>
		<hr>
		<div class="crowWatch">
			<label class="searchLabel">适用人群</label>
			<c:forEach items="${crowds}" var="crowd">
			<label class="labelType"><a href="${pageContext.request.contextPath }/b/watch/brand?id=${crowd.id}">${crowd.crowdName}</a></label>
			</c:forEach>
		</div>
		<hr>
		<div class="moveWatch">
			<label class="searchLabel">机芯类型</label>
			<c:forEach items="${movements}" var="movement">
			<label class="labelType"><a href="${pageContext.request.contextPath }/b/watch/brand?id=${movement.id}">${movement.movementName}</a></label>
			</c:forEach>
		</div>
		<br>
	</div>
</div>
<br><br>
<div class="row">
	<div class="watchDiv">
	<br>
	<c:forEach items="${page.list}" var="watch">
	  <div class="col-sm-6 col-md-3">
	    <div class="thumbnail">
	    	<a href="#">
	      <img src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" alt="...">
	     </a>
	      <div class="caption">
	      	<h4 style="font-weight: bold;color:#990000;">￥${watch.watchPrePrice}</h4>
		        <h5><a style="color: #666666;" href="">${watch.watchTitle}</a></h5>
	      </div>
	    </div>
	  </div>
	</c:forEach>
 
				
	</div>		
</div>
 <div>${page}</div>
</body>
</html>