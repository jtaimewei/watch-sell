<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名表网</title>
<link rel="stylesheet"
	href="${ctxStatic}/bootstrap-3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${ctxStatic}/bootstrap-3.3.5/css/bootstrap-theme.css" />
<link rel="stylesheet"
	href="${ctxStatic}/bootstrap-3.3.5/css/bootstrap-select.min.css" />
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script type="text/javascript"
	src="${ctxStatic}/bootstrap-3.3.5/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/bootstrap-3.3.5/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/resources/js/jquery.1.4.2-min.js"></script>
<style type="text/css">
.buyButton{
	width: 130px;
    height: 40px;
    font-size: 15px;
}
.carButton{
	width: 130px;
    height: 40px;
    font-size: 15px;
    margin-left: 15px;
}
.plDiv{
	padding-left: 50px;
	    font-family: 宋体;
}
.plUserDiv{
	    font-size: 15px;
    font-weight: bold;
}
.plTextDiv{
	    font-size: 15px;
}
</style>
<style type="text/css">
/* reset */
body{font:12px/18px "宋体",arial,sans-serif;color:#585858;}
body,div,p,span,form,iframe,table,td,th,input,textarea,button,label,ul,ol,li,dl,dt,dd,h1,h2,h3,h4,h5,h6{margin:0;padding:0;}
h1,h2,h3,h4,h5,h6{font-size:100%; }
ul,ol,li,dl{list-style-type:none;}
em,i,dfn,cite,strong,small{font-style:normal;} 
img{border:0;}
fieldset,button,input,select,option{vertical-align:middle;font:12px/18px "宋体",arial,sans-serif;}
table{border-collapse:collapse;border-spacing:0}
textarea{resize:none}
/* color */
a:link,a:visited{color:#575757;text-decoration:none;}
a:hover{color:#ef4165;text-decoration:none;}
a:active{color:#1d7400;}
/* clearfix */
.clearfix:after{ visibility:hidden; display:block; font-size:0; content:" "; clear:both; height:0;}
*html .clearfix{ zoom:1;}

.preview{width:400px; height:465px; margin:50px 0px 0px 150px;}
/* smallImg */
.smallImg{position:relative; height:52px; margin-top:1px; background-color:#F1F0F0; padding:6px 5px; width:390px; overflow:hidden;float:left;}
.scrollbutton{width:14px; height:50px; overflow:hidden; position:relative; float:left; cursor:pointer; }
.scrollbutton.smallImgUp , .scrollbutton.smallImgUp.disabled{background:url(/image/d_08.png) no-repeat;}
.scrollbutton.smallImgDown , .scrollbutton.smallImgDown.disabled{background:url(/image/d_09.png) no-repeat; margin-left:375px; margin-top:-50px;}

#imageMenu {height:50px; width:360px; overflow:hidden; margin-left:0; float:left;}
#imageMenu li {height:50px; width:60px; overflow:hidden; float:left; text-align:center;}
#imageMenu li img{width:50px; height:50px;cursor:pointer;}
#imageMenu li#onlickImg img, #imageMenu li:hover img{ width:44px; height:44px; border:3px solid #959595;}
/* bigImg */
.bigImg{position:relative; float:left; width:400px; height:400px; overflow:hidden;}
.bigImg #midimg{width:400px; height:400px;}
.bigImg #winSelector{width:235px; height:210px;}
#winSelector{position:absolute; cursor:crosshair; filter:alpha(opacity=15); -moz-opacity:0.15; opacity:0.15; background-color:#000; border:1px solid #fff;}
/* bigView */
#bigView{position:absolute;border: 1px solid #959595; overflow: hidden; z-index:999;}
#bigView img{position:absolute;}
</style>
<script type="text/javascript">
function page(n,s){
	if (n) $("#pageNo").val(n);
	if (s) $("#pageSize").val(s);
	$("#detailWatchForm").submit();
	return false;
}
	$(function(){
		/* - 数量 */
		$("#jButton").click(function(){
			var num = Number($("#numberInput").val());
			if (num > 1) {
				$("#numberInput").val(num-1);
			}
		});
		/* + 数量  */
		$("#aButton").click(function(){
			var num = Number($("#numberInput").val());
			var kc = Number($("#kcSpan").html());
			if (num < kc) {
				$("#numberInput").val(num+1);
			}
		});
		
		/* 加入购物车 */
		$("#addCartButton").click(function(){
			$("#messageAjaxSpan").html("");
			var watchId = $("#watchId").val();
			var buyNum = $("#numberInput").val();
			$.ajax({  
			    type: "POST",  
			    url: "${pageContext.request.contextPath}/b/watch/cart",  
			    data:JSON.stringify({
			    	"watchId":watchId,
			    	"cartProductNumber":buyNum
                }),  
			    async: false,
			    contentType:"application/json;charset=utf-8",
			    error: function() {  
			        alert("加入购物车失败");  
			    },  
			    success: function(data) {
			    	$("#messageAjaxSpan").html(data);
			    }  
			  });
			
		});
		
		/* 立即购买 */
		$("#buyNowButton").click(function(){
			$("#messageAjaxSpan").html("");
			var number = $("#numberInput").val();
			var watchId = $("#watchId").val();
			var list=watchId+"@"+number; 
			 $.ajax({  
				    type: "POST",  
				    url: "${pageContext.request.contextPath}/b/user/order",  
				    data:{"list":list},  
				    async: false,
				    error: function() {  
				        alert("购买失败");  
				    },  
				    success: function(data) {
				    	if (data == "0") {
					    	$("#messageAjaxSpan").html("您还没有登录,请先登录！");
				    	} else if (data == "1") {
				    		window.location.href="${pageContext.request.contextPath}/b/user/toOrder";
				    	}
				    }  
				  });
		});
		
		
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
	// 图片上下滚动
	var count = $("#imageMenu li").length - 5; /* 显示 6 个 li标签内容 */
	var interval = $("#imageMenu li:first").width();
	var curIndex = 0;
	
	$('.scrollbutton').click(function(){
		if( $(this).hasClass('disabled') ) return false;
		
		if ($(this).hasClass('smallImgUp')) --curIndex;
		else ++curIndex;
		
		$('.scrollbutton').removeClass('disabled');
		if (curIndex == 0) $('.smallImgUp').addClass('disabled');
		if (curIndex == count-1) $('.smallImgDown').addClass('disabled');
		
		$("#imageMenu ul").stop(false, true).animate({"marginLeft" : -curIndex*interval + "px"}, 600);
	});	
	// 解决 ie6 select框 问题
 	$.fn.decorateIframe = function(options) {
        if ($.browser.msie && $.browser.version < 7) {
            var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
            $(this).each(function() {
                var $myThis = $(this);
                //创建一个IFRAME
                var divIframe = $("<iframe />");
                divIframe.attr("id", opts.iframeId);
                divIframe.css("position", "absolute");
                divIframe.css("display", "none");
                divIframe.css("display", "block");
                divIframe.css("z-index", opts.iframeZIndex);
                divIframe.css("border");
                divIframe.css("top", "0");
                divIframe.css("left", "0");
                if (opts.width == 0) {
                    divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                if (opts.height == 0) {
                    divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                divIframe.css("filter", "mask(color=#fff)");
                $myThis.append(divIframe);
            });
        }
    } 
  	$.fn.decorateIframe.defaults = {
        iframeId: "decorateIframe1",
        iframeZIndex: -1,
        width: 0,
        height: 0
    } 
    //放大镜视窗
    $("#bigView").decorateIframe();
    //点击到中图
    var midChangeHandler = null;
	
    $("#imageMenu li img").bind("click", function(){
		if ($(this).attr("id") != "onlickImg") {
			midChange($(this).attr("src").replace("small", "mid"));
			$("#imageMenu li").removeAttr("id");
			$(this).parent().attr("id", "onlickImg");
		}
	}).bind("mouseover", function(){
		if ($(this).attr("id") != "onlickImg") {
			window.clearTimeout(midChangeHandler);
			midChange($(this).attr("src").replace("small", "mid"));
			$(this).css({ "border": "3px solid #959595" });
		}
	}).bind("mouseout", function(){
		if($(this).attr("id") != "onlickImg"){
			$(this).removeAttr("style");
			midChangeHandler = window.setTimeout(function(){
				midChange($("#onlickImg img").attr("src").replace("small", "mid"));
			}, 1000);
		}
	});
    function midChange(src) {
        $("#midimg").attr("src", src).load(function() {
            changeViewImg();
        });
    }
    //大视窗看图
    function mouseover(e) {
        if ($("#winSelector").css("display") == "none") {
            $("#winSelector,#bigView").show();
        }
        $("#winSelector").css(fixedPosition(e));
        e.stopPropagation();
    }
    function mouseOut(e) {
        if ($("#winSelector").css("display") != "none") {
            $("#winSelector,#bigView").hide();
        }
        e.stopPropagation();
    }
    $("#midimg").mouseover(mouseover); //中图事件
    $("#midimg,#winSelector").mousemove(mouseover).mouseout(mouseOut); //选择器事件

    var $divWidth = $("#winSelector").width(); //选择器宽度
    var $divHeight = $("#winSelector").height(); //选择器高度
    var $imgWidth = $("#midimg").width(); //中图宽度
    var $imgHeight = $("#midimg").height(); //中图高度
    var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度

    function changeViewImg() {
        $("#bigView img").attr("src", $("#midimg").attr("src").replace("mid", "big"));
    }
    changeViewImg();
    $("#bigView").scrollLeft(0).scrollTop(0);
    function fixedPosition(e) {
        if (e == null) {
            return;
        }
        var $imgLeft = $("#midimg").offset().left; //中图左边距
        var $imgTop = $("#midimg").offset().top; //中图上边距
        X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
        Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
        X = X < 0 ? 0 : X;
        Y = Y < 0 ? 0 : Y;
        X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
        Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

        if ($viewImgWidth == null) {
            $viewImgWidth = $("#bigView img").outerWidth();
            $viewImgHeight = $("#bigView img").height();
            if ($viewImgWidth < 200 || $viewImgHeight < 200) {
                $viewImgWidth = $viewImgHeight = 800;
            }
            $height = $divHeight * $viewImgHeight / $imgHeight;
            $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);
            $("#bigView").height($height);
        }
        var scrollX = X * $viewImgWidth / $imgWidth;
        var scrollY = Y * $viewImgHeight / $imgHeight;
        $("#bigView img").css({ "left": scrollX * -1, "top": scrollY * -1 });
        $("#bigView").css({ "top": 75, "left": $(".preview").offset().left + $(".preview").width() + 15 });

        return { left: X, top: Y };
    }
});
</script>
</head>
<body>
<%-- <%@ include file="/WEB-INF/views/modules/fore/head/foreHead1.jsp"%>	 --%>
<br>

<div class="row" style="margin-left: 20px;width: 95%;">
	<div class="col-sm-6 col-md-5">
	<div class="preview">
	<div id="vertical" class="bigImg">
		<img src="mid/05.jpg" width="400" height="400" alt="" id="midimg" />
		<div style="display:none;" id="winSelector"></div>
	</div><!--bigImg end-->	
	<div class="smallImg">
		<div class="scrollbutton smallImgUp disabled"></div>
		<div id="imageMenu">
			<ul>
				<c:forEach items="${watch.watchPicture}" var="picture">
					<c:if test="${picture.pictureType == '1'}">
						<li id="onlickImg"><img src="/image/${picture.pictureSrc}" width="68" height="68"/></li>
					</c:if>	
					<c:if test="${picture.pictureType == '2'}">
						<li><img src="/image/${picture.pictureSrc}" width="68" height="68"/></li>
					</c:if>	
	  			</c:forEach>
			</ul>
		</div>
		<div class="scrollbutton smallImgDown"></div>
	</div><!--smallImg end-->	
	<div id="bigView" style="display:none;"><img width="800" height="800" alt="" src="" /></div>
</div>
	    <%-- <div class="thumbnail">
	      <img src="${ctxStatic}/resources/watch/${watch.watchPicture[0].pictureSrc}" alt="...">
	      <div class="caption">
			<c:forEach items="${watch.watchPicture}" var="picture">
				<c:if test="${picture.pictureType == '1' || picture.pictureType == '2'}">      				
			      	<div class="col-sm-6 col-md-2">
			      	<br>
			    		<div class="thumbnail">
			      			<img src="/image/${picture.pictureSrc}" alt="...">
				      		<div class="caption">
				      
					     	</div>
				    	</div>
			  		</div>
			  	</c:if>	
	  		</c:forEach>
	      </div>
	    </div> --%>
	  </div>
	  
	  <div class="col-sm-6 col-md-7">
	   <div class="thumbnail">
	      <div class="caption">
	      	<h4 style="font-weight: bold;">${watch.watchTitle}</h4>
	        <h6  style="color: #666666;">${watch.watchIntroduce}</h6>
	        
	        <h6 style="color: #666666;margin-top: 20px;">
	        	<span>
	        	型号:${watch.watchModel}
	        	</span>
	        	<span style="margin-left: 30px;">
	        	编号:${watch.watchSerialNumber}
	        	</span>
	        	<span style="margin-left: 30px;">
	        	品牌:${watch.brand.brandName}
	        	</span>
	        	<span style="margin-left: 30px;">
	        	销量:12
	        	</span>
	        </h6>
	        
	      	<p style="display: inline;font-size: 16px;color: #666666;">名表价</p>
	      	<h3 style="font-weight: bold;color:#990000;display: inline;">￥${watch.watchPrePrice}</h3>
		    <s style="color:#666666;font-size: 16px;margin-left: 10px;">￥${watch.watchOrgPrice}</s> 
		    <br>
		    <p style="font-size: 16px;color: #666666;margin-top: 10px;">款式</p>
    		<div class="thumbnail" style="margin-left: 70px;width: 95px;margin-top: -20px;">
    			<c:forEach items="${watch.watchPicture}" var="picture">
	      		<c:if test="${picture.pictureType == '1'}">
      				<img src="/image/${picture.pictureSrc}" width="50px" height="50px" alt="...">
	    		</c:if>
	    		</c:forEach>
	    	</div>
		    <span style="font-size: 16px;color: #666666;margin-top: 10px;margin-right: 32px;">数量</span>
		    <input id="jButton" style="width: 35px;" type="button" value="-"><input id="numberInput" style="width: 50px;text-align: center;" type="text" value="1"><input id="aButton" style="width: 35px;" type="button" value="+">
		    <span style="font-size: 16px;color: #666666;margin-top: 10px;margin-left: 32px;">库存:</span>
		    <span id="kcSpan" style="font-size: 16px;color: #666666;padding-left: 10px;">${watch.watchNumber}</span>
		    <br><br>
		    <button id="buyNowButton" type="button" class="btn btn-danger buyButton">立即购买</button>
	  		<button id="addCartButton" type="button" class="btn btn-default carButton">加入购物车</button>
	      	<span id="messageAjaxSpan" style="color: red; margin-left: 20px;font-size: 19px;font-family: 宋体;"></span>
	      </div>
	    </div>
	  </div>
</div>

<div class="row" style="margin-left: 20px;width: 95%;">
<hr>
<div class="alert alert-info" role="alert">
	<strong>规格参数</strong>
</div>
		<table class="table table-bordered">
		<tr>
		<td>品牌</td>
		<td>${watch.brand.brandName}</td>
		<td>表扣</td>
		<td>${watch.watchClasp}</td>
		</tr>
		<tr>
		<td>机芯</td>
		<td>${watch.watchMovement}</td>
		<td>表盘</td>
		<td>${watch.watchDial}</td>
		</tr>
		<tr>
		<td>序列号</td>
		<td>${watch.watchSerialNumber}</td>
		<td>外壳</td>
		<td>${watch.watchShell}</td>
		</tr>
		<tr>
		<td>型号</td>
		<td>${watch.watchModel}</td>
		<td>表带</td>
		<td>${watch.watchStrap}</td>
		</tr>
		<tr>
		<td>人群</td>
		<td>${watch.crowd.crowdName}</td>
		<td>重量</td>
		<td>${watch.watchWeight}</td>
		</tr>
		<tr>
		
		<td>年份</td>
		<td>${watch.watchYear}</td>
		<td>防水</td>
		<td>${watch.watchWaterproof}</td>
		</tr>
		</table>
</div>

<div class="row" style="margin-left: 20px;width: 95%;">
<hr>
<div class="alert alert-info" role="alert">
	<strong>商品详情</strong>
</div>
<div class="thumbnail">
	<div class="caption">
	  	<c:forEach items="${watch.watchPicture}" var="picture">
	  		<c:if test="${picture.pictureType == '3'}">
	  		<div class="row" align="center">
		      	<div class="col-sm-6 col-md-12">
		      		<img src="/image/${picture.pictureSrc}" alt="...">
		  		</div>
		  	</div>
	  		</c:if>
  		</c:forEach>
</div>
</div>
</div>

<div class="row" style="margin-left: 20px;width: 95%;">
<hr>
<div class="alert alert-info" role="alert">
	<strong>评&nbsp;&nbsp;&nbsp;价</strong>
</div>
	<div class="col-sm-6 col-md-12">
	    <div class="thumbnail">
	   	<c:forEach items="${page.list}" var="comment">
			<div class="row plDiv">
				<div class="col-sm-6 col-md-2 plUserDiv">
		    		${comment.userName }
		  		</div>	     
				<div class="col-sm-6 col-md-10 plTextDiv">
		    		<span>${comment.commentContent }</span><br><br>
		    		
		    		<span>${comment.commentContentTime }</span>
		  		</div>	     
		    </div>
		    <hr>
		</c:forEach>    
		    
		    
			<!-- <div class="row plDiv">
				<div class="col-sm-6 col-md-2 plUserDiv">
		    		用户112131
		  		</div>	     
				<div class="col-sm-6 col-md-10 plTextDiv">
		    		<span>辅导老师发几份里大街网</span><br><br>
		    		
		    		<span>2017-09-08 21:09:33</span>
		  		</div>	     
		    </div>
		      <hr>
			<div class="row plDiv">
				<div class="col-sm-6 col-md-2 plUserDiv">
		    		用户112131
		  		</div>	     
				<div class="col-sm-6 col-md-10 plTextDiv">
		    		<span>辅导老师发几份里大街网</span><br><br>
		    		
		    		<span>2017-09-08 21:09:33</span>
		  		</div>	     
		    </div>
		      <hr> -->
		      
			<div class="row plDiv" >
				<div class="col-sm-6 col-md-12 plUserDiv">
					<form id="detailWatchForm" action="${pageContext.request.contextPath}/b/watch/detail" method="post" >
						<input type="hidden" id="watchId" name="watchId" value="${watch.id}">
						<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}">
						<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}">
		    			<div style="width: 95%;margin-left: 270px;">${page}</div>
					</form>
		  		</div>	     
		    </div>
		    
	    </div>
	  </div>
	
</div>
</body>
</html>