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
    padding-top: 5px;
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
.labelTypeP{
	margin-left: 20px;
}
.labelTypeB{
	margin-left: 20px;
}
.labelTypeC{
	margin-left: 20px;
}
.labelTypeM{
	margin-left: 20px;
}
.searchName{
 color: #990000;
}
.closeSpan{
 color: #990000;
 margin-left: 5px;
 margin-right: 5px;
 cursor:pointer;/* 小手状态 */
}
.searchSpan{
	border: 0.5px solid;
	padding-top: 3px;
    padding-bottom: 3px; 
    font-weight: bold;
}
</style>
<script type="text/javascript">
	function page(n,s){
		if (n) $("#pageNo").val(n);
		if (s) $("#pageSize").val(s);
		$("#searchWatchForm").submit();
		return false;
	}
$(function(){
	/* 点击选择 */
	$(".labelTypeP").click(function(){
		//alert($(this).attr("name"));
		var price = $(this).attr("name");
		$("#gPrice").val(price.split("-")[0]);
		$("#lPrice").val(price.split("-")[1]);
		$("#priceSpan").html(price);
		$("#priceSpan").parent().show();
		$("#searchWatchForm").submit();
	});
	$(".labelTypeB").click(function(){
		//alert($(this).html());
		$("#brandName").val($(this).html());
		$("#brandNameSpan").html($(this).html());
		$("#brandNameSpan").parent().show();
		$("#searchWatchForm").submit();
	});
	$(".labelTypeC").click(function(){
		//alert($(this).html());
		$("#crowdName").val($(this).html());
		$("#crowdNameSpan").html($(this).html());
		$("#crowdNameSpan").parent().show();
		$("#searchWatchForm").submit();
	});
	$(".labelTypeM").click(function(){
		//alert($(this).html());
		$("#movementName").val($(this).html());
		$("#movementNameSpan").html($(this).html());
		$("#movementNameSpan").parent().show();
		$("#searchWatchForm").submit();
	});
	/* 关闭选择 */
	$("#closePrice").click(function(){
		$(this).parent().hide();
		$("#gPrice").val(0);
		$("#lPrice").val(0);
		$("#searchWatchForm").submit();
	});
	$("#closeBrandName").click(function(){
		$(this).parent().hide();
		$("#brandName").val('');
		$("#searchWatchForm").submit();
	});
	$("#closeCrowdName").click(function(){
		$(this).parent().hide();
		$("#crowdName").val('');
		$("#searchWatchForm").submit();
	});
	$("#closeMovementName").click(function(){
		$(this).parent().hide();
		$("#movementName").val('');
		$("#searchWatchForm").submit();
	});
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	
<%@ include file="/WEB-INF/views/modules/fore/head/foreHead2.jsp"%>	
<br>
<div class="row">

<%-- <form id="searchWatchForm" action="${pageContext.request.contextPath}/b/watch/search" method="post">
	<input type="text" id="brandName" value="${brandName}" name="brandName">
	<input type="text" id="crowdName" value="${crowdName}" name="crowdName">
	<input type="text" id="movementName" value="${movementName}" name="movementName">
	<input type="text" id="gPrice" value="${gPrice}" name="gPrice">
	<input type="text" id="lPrice" value="${lPrice}" name="lPrice">
</form> --%>
	<div class="searchDiv">
		<div id="watchNumber" class="watchNumber">已找到${page.count }件:&nbsp;&nbsp;
			
			<span class="searchSpan" style="${empty gPrice ?'display: none;':'' }">价格：<span id="priceSpan" class="searchName">${gPrice}-${lPrice}</span><span id="closePrice" class="closeSpan">X</span></span>
			
			<span class="searchSpan" style="${empty brandName ?'display: none;':'' }">品牌：<span id="brandNameSpan" class="searchName">${brandName}</span><span id="closeBrandName" class="closeSpan">X</span></span>
			
			<span class="searchSpan" style="${empty crowdName ?'display: none;':'' }">人群：<span id="crowdNameSpan" class="searchName">${crowdName}</span><span id="closeCrowdName" class="closeSpan">X</span></span>
			
			<span class="searchSpan" style="${empty movementName ?'display: none;':'' }">机芯：<span id="movementNameSpan" class="searchName">${movementName}</span><span id="closeMovementName" class="closeSpan">X</span></span>
		</div>
		<div class="pirceWatch">
			<label class="searchLabel">价格</label>
			<button class="btn btn-default labelTypeP" name="100-1000">100-1000</button>
			<button class="btn btn-default labelTypeP" name="1000-3000">1000-3000</button>
			<button class="btn btn-default labelTypeP" name="3000-5000">3000-5000</button>
			<button class="btn btn-default labelTypeP" name="5000-10000">5000-10000</button>
			<button class="btn btn-default labelTypeP" name="10000-50000">10000-50000</button>
			<button class="btn btn-default labelTypeP" name="50000-100000">50000-100000</button>
			<button class="btn btn-default labelTypeP" name="100000-10000000">100000-10000000</button>
		</div>
		<!-- <hr style="margin-top: 1px; margin-bottom: 1px;"> -->
		<hr>
		<div class="brandWatch">
			<label class="searchLabel">品牌</label>
			<c:forEach items="${brands}" var="brand">
			<button type="button" class="btn btn-default labelTypeB">${brand.brandName}</button>
			</c:forEach>
		</div>
		<hr>
		<div class="crowWatch">
			<label class="searchLabel">适用人群</label>
			<c:forEach items="${crowds}" var="crowd">
			<button type="button" class="btn btn-default labelTypeC">${crowd.crowdName}</button>
			</c:forEach>
		</div>
		<hr>
		<div class="moveWatch">
			<label class="searchLabel">机芯类型</label>
			<c:forEach items="${movements}" var="movement">
			<button type="button" class="btn btn-default labelTypeM">${movement.movementName}</button>
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
	    	<a href="${pageContext.request.contextPath}/b/watch/detail?watchId=${watch.id}">
	      <%-- <img src="${ctxStatic}/resources/img/b510774f43a844d98fb51111cf2e2ff7.jpg" alt="..."> --%>
	     <c:forEach items="${watch.watchPicture}" var="picture">
	      <c:if test="${picture.pictureType == '1'}">
	      <img src="/image/${picture.pictureSrc}" alt="...">
	      </c:if>
	      </c:forEach>
	     </a>
	      <div class="caption">
	      	<h4 style="font-weight: bold;color:#990000;">￥${watch.watchPrePrice}</h4>
		        <h5><a style="color: #666666;" href="${pageContext.request.contextPath}/b/watch/detail?watchId=${watch.id}">${watch.watchTitle}</a></h5>
	      </div>
	    </div>
	  </div>
	</c:forEach>
 
				
	</div>		
</div>
<form id="searchWatchForm" action="${pageContext.request.contextPath}/b/watch/search" method="post" >
	<input type="hidden" id="brandName" value="${empty brandName?'':brandName}" name="brandName">
	<input type="hidden" id="crowdName" value="${empty crowdName?'':crowdName}" name="crowdName">
	<input type="hidden" id="movementName" value="${empty movementName?'':movementName}" name="movementName">
	<input type="hidden" id="gPrice" value="${empty gPrice?'0':gPrice}" name="gPrice">
	<input type="hidden" id="lPrice" value="${empty lPrice?'0':lPrice}" name="lPrice">
	<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
	<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
 	<div style="width: 95%;margin-left: 37px;">${page}</div>
</form>
</body>
</html>