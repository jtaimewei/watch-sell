<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/modules/back/header/backHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图表</title>
<script type="text/javascript" src="${ctxStatic}/resources/js/echarts.min.js"></script>
<style type="text/css">

</style>
</head>
<body>
<div class="container-fluid">
		<div class="row">
		<div class="col-md-12">
			<div class="thumbnail rigthDiv">
			  <div class="caption">
	<div class="form-inline" style="margin-left: 8px;">
		<div class="form-group">
    		<label for="exampleInputName2">查询时间：</label>

<% 
java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
 
java.util.Date currentTime = new java.util.Date();//得到当前系统时间
java.util.Date date = df.parse(df.format(new java.util.Date()));
java.util.Calendar calendar = java.util.Calendar.getInstance();
calendar.setTime(date);
calendar.add(java.util.Calendar.MONTH,-1);
java.util.Date mdate = calendar.getTime();
%>

   			 <input type="text" id="startTime" value="<fmt:formatDate value="<%=mdate %>" pattern="yyyy-MM-dd"/>" readonly="readonly" class="form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});">
  		</div>
  		<div class="form-group">
    		<label for="exampleInputEmail2">-</label>
   			<input type="text" id="endTime" value="<fmt:formatDate value="<%=date %>" pattern="yyyy-MM-dd"/>" class="form-control" readonly="readonly"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});">
  		</div>
  		<button id="chartButton" type="button" class="btn btn-primary">查询</button>
  	</div>
  	<br>
	<div id="main" style="width: 1200px;height:400px;">
	</div>
		
</div>
</div>
</div>
</div></div>
<script type="text/javascript">

 /* var option = {
	    title: {
	        text: '折线图堆叠'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	            saveAsImage: {}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: ['周一','周二','周三','周四','周五','周六','周日']
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [
	        {
	            name:'邮件营销',
	            type:'line',
	            stack: '总量',
	            data:[120, 132, 101, 134, 90, 230, 210]
	        },
	        {
	            name:'联盟广告',
	            type:'line',
	            stack: '总量',
	            data:[220, 182, 191, 234, 290, 330, 310]
	        },
	        {
	            name:'视频广告',
	            type:'line',
	            stack: '总量',
	            data:[150, 232, 201, 154, 190, 330, 410]
	        },
	        {
	            name:'直接访问',
	            type:'line',
	            stack: '总量',
	            data:[320, 332, 301, 334, 390, 330, 320]
	        },
	        {
	            name:'搜索引擎',
	            type:'line',
	            stack: '总量',
	            data:[820, 932, 901, 934, 1290, 1330, 1320]
	        }
	    ]
	}; 
 var myChart = echarts.init(document.getElementById('main'));
	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option); */ 
//指定图表的配置项和数据
 var option = {
	    title: {
	        text: '名表销售分析图'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:[]
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	            saveAsImage: {}
	        }
	    },
	    dataZoom: [
	               {
	            	   id: 'dataZoomX',
	                   type: 'slider',
	                   xAxisIndex: [0],
	                   filterMode: 'filter', // 设定为 'filter' 从而 X 的窗口变化会影响 Y 的范围。
	                   start: 0,
	                   end: 100
	               }
	           ],
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: []
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: []
	};
	var startTime1 = $("#startTime").val();
	var endTime1 = $("#endTime").val();
	$.ajax({  
	    type: "POST",  
	    url: "${pageContext.request.contextPath}/a/get",  
	    data:JSON.stringify({
	    	"startTime":startTime1,
	    	"endTime":endTime1
	    }),  
	    async: false,
	    contentType:"application/json;charset=utf-8",
	    error: function() {  
	        alert("加载失败");  
	    },  
	    success: function(data) {
	    	//alert(typeof data)
	    	console.log('data',data);
	    	option.legend.data = [];
	    	option.xAxis.data = [];
	    	option.series = [];
	    	option.legend.data = data.title;
	    	option.xAxis.data = data.timeList;
	    	var title = data.title;
	    	for (var i= 0 ;i < title.length; i++){
	    		var d = {
    		            name:title[i],
    		            type:'line',
    		            //stack: '总量',
    		            data:data[title[i]]
    		        };
	    		option.series.push(d);
	    	}
	    	console.log('option',option);
	    	/* $.each(title, function(){
	    		var key = this;
	    		  var d = {
	    		            name:key,
	    		            type:'line',
	    		            stack: '总量',
	    		            data:data.key
	    		        }; 
	    		  option.series.push(d);
	    	 }); */
	    	// 基于准备好的dom，初始化echarts实例
	    	 var myChart = echarts.init(document.getElementById('main'));
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
	    } 
	  });
	
$("#chartButton").click(function(){
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
		console.log('startTime',startTime);
		console.log('endTime',endTime);
		
		$.ajax({  
		    type: "POST",  
		    url: "${pageContext.request.contextPath}/a/get",  
		    data:JSON.stringify({
		    	"startTime":startTime,
		    	"endTime":endTime
		    }),  
		    async: false,
		    contentType:"application/json;charset=utf-8",
		    error: function() {  
		        alert("加载失败");  
		    },  
		    success: function(data) {
		    	//alert(typeof data)
		    	console.log('data',data);
		    	option.legend.data = null;
		    	option.xAxis.data = null;
		    	option.series = [];
		    	option.legend.data = data.title;
		    	option.xAxis.data = data.timeList;
		    	var title = data.title;
		    	for (var i= 0 ;i < title.length; i++){
		    		var d = {
	    		            name:title[i],
	    		            type:'line',
	    		            //stack: '总量',
	    		            data:data[title[i]]
	    		        };
		    		option.series.push(d);
		    	}
		    	console.log('option',option);
		    	/* $.each(title, function(){
		    		var key = this;
		    		  var d = {
		    		            name:key,
		    		            type:'line',
		    		            stack: '总量',
		    		            data:data.key
		    		        }; 
		    		  option.series.push(d);
		    	 }); */
		    	// 基于准备好的dom，初始化echarts实例
		    	 var myChart = echarts.init(document.getElementById('main'));
				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option);
		    } 
		  });



});	

</script>
</body>
</html>