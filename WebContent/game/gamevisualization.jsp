<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	민첩성 : <canvas id="canvas_game1" height="270" width="600" style="border:1px solid black; "></canvas>
	기억력 : <canvas id="canvas_game2" height="270" width="600" style="border:1px solid black; "></canvas>
	집중력 : <canvas id="canvas_game3" height="270" width="600" style="border:1px solid black; "></canvas>	
	해결력 : <canvas id="canvas_game4" height="270" width="600" style="border:1px solid black; "></canvas>	
	ㅌㅌ력 : <canvas id="canvas_game5" height="270" width="600" style="border:1px solid black; "></canvas>	
</body>
<script src="./js/Chart.js"></script>
<script>

var labels=[];
var data=[];

<% 
	ArrayList data = (ArrayList)request.getAttribute("scoreList");
	System.out.println(data);
	
	for(int i = 0 ; i<data.size(); i++)
	{
%>		
		labels.push("");
		data.push(<%=data.get(i)%>);
<%
	}
%>

var lineChartData = {
		
	labels : labels,
	datasets : [
		{
			label: "My First dataset",
			fillColor : "rgba(220,220,220,0.2)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(220,220,220,1)",
			data : data
		}
	]
};

var lineChartData2 = {
		labels : ["","","","average","","",""],
		datasets : [
			{
				label: "My First dataset",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [10,20,30,40,50,20,10]
			}
		]
	};
	
var lineChartData3 = {
		labels : ["","","","average","","",""],
		datasets : [
			{
				label: "My First dataset",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [10,20,30,40,50,20,10]
			}
		]
	};

var lineChartData4 = {
		labels : ["","","","average","","",""],
		datasets : [
			{
				label: "My First dataset",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [10,20,30,40,50,20,10]
			}
		]
	};
	
var lineChartData5 = {
		labels : ["","","","average","","",""],
		datasets : [
			{
				label: "My First dataset",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [10,20,30,40,50,20,10]
			}
		]
	};

	window.onload = function(){
		var ctx_game1 = document.getElementById("canvas_game1").getContext("2d");
		window.myLine = new Chart(ctx_game1).Line(lineChartData, {
			responsive: false
		});
		
		var ctx_game2 = document.getElementById("canvas_game2").getContext("2d");
		window.myLine = new Chart(ctx_game2).Line(lineChartData2, {
			responsive: false
		});
		
		var ctx_game3 = document.getElementById("canvas_game3").getContext("2d");
		window.myLine = new Chart(ctx_game3).Line(lineChartData3, {
			responsive: false
		});
		
		var ctx_game4 = document.getElementById("canvas_game4").getContext("2d");
		window.myLine = new Chart(ctx_game4).Line(lineChartData4, {
			responsive: false
		});
		
		var ctx_game5 = document.getElementById("canvas_game5").getContext("2d");
		window.myLine = new Chart(ctx_game5).Line(lineChartData5, {
			responsive: false
		});
	};

	</script>