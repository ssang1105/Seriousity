<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="css/gamedetail.css">
<script src="./js/Chart.js"></script>
<script>
var labels=[];
	labels[0] = "";
var data=[];
var doughnut_data=[0,0,0,0,0,0,0,0,0,0];

<% 
	String gamename = (String)request.getParameter("gamename");	
	System.out.println("gamename : "+gamename);

	//visualization
	
	ArrayList data = (ArrayList)request.getAttribute("scoreList");	
	for(int i = 0 ; i<data.size(); i++)
	{
%>		
		labels.push("");
		data.push(<%=data.get(i)%>);
<%
	}	
	
	ArrayList averageList = (ArrayList)request.getAttribute("averageList");
	for(int i = 0 ; i<averageList.size(); i++)
	{
%>		
		if(<%=averageList.get(i)%> >= 90 ){
			doughnut_data[0]++;
		}else if(<%=averageList.get(i)%> >= 80 ){
			doughnut_data[1]++;
		}else if(<%=averageList.get(i)%> >= 70 ){
			doughnut_data[2]++;
		}else if(<%=averageList.get(i)%> >= 60 ){
			doughnut_data[3]++;
		}else if(<%=averageList.get(i)%> >= 50 ){
			doughnut_data[4]++;
		}else if(<%=averageList.get(i)%> >= 40 ){
			doughnut_data[5]++;
		}else if(<%=averageList.get(i)%> >= 30 ){
			doughnut_data[6]++;
		}else if(<%=averageList.get(i)%> >= 20 ){
			doughnut_data[7]++;
		}else if(<%=averageList.get(i)%> >= 10 ){
			doughnut_data[8]++;
		}else{
			doughnut_data[9]++;
		}
<%
	}		
%>



var lineChartData = {
		
	labels : labels,
	datasets : [
		{
			label: "My First dataset",
			fillColor : "#fff",
			strokeColor : "rgba(255,167,13,2)",
			pointColor : "rgba(226,61,13,1)",
			pointStrokeColor : "#000000",
			pointHighlightFill : "#000000",
			pointHighlightStroke : "rgba(220,220,220,1)",
			data : data
		}
	]
};

var doughnutData = [
    				{
    					value: doughnut_data[0],
    					color:"#F7464A",
    					highlight: "#FF5A5E",
    					label: "90 ~ 100"
    				},
    				{
    					value: doughnut_data[1],
    					color: "#46BFBD",
    					highlight: "#5AD3D1",
    					label: "80 ~ 90"
    				},
    				{
    					value: doughnut_data[2],
    					color: "#FDB45C",
    					highlight: "#FFC870",
    					label: "70 ~ 80"
    				},
    				{
    					value: doughnut_data[3],
    					color: "#949FB1",
    					highlight: "#A8B3C5",
    					label: "60 ~ 70"
    				},
    				{
    					value: doughnut_data[4],
    					color: "#4D5360",
    					highlight: "#616774",
    					label: "50 ~ 60"
    				},
    				{
    					value: doughnut_data[5],
    					color: "#4D5360",
    					highlight: "#616774",
    					label: "40 ~ 50"
    				},
    				{
    					value: doughnut_data[6],
    					color: "#4D5360",
    					highlight: "#616774",
    					label: "30 ~ 40"
    				},
    				{
    					value: doughnut_data[7],
    					color: "#4D5360",
    					highlight: "#616774",
    					label: "20 ~ 30"
    				},
    				{
    					value: doughnut_data[8],
    					color: "#4D5360",
    					highlight: "#616774",
    					label: "10 ~ 20"
    				},
    				{
    					value: doughnut_data[9],
    					color: "#4D5360",
    					highlight: "#616774",
    					label: "0 ~ 10"
    				}

    			];

	window.onload = function(){
	
		var ctx_game1 = document.getElementById("canvas_game1").getContext("2d");
		window.myLine = new Chart(ctx_game1).Line(lineChartData, {responsive: true});	
	
		var ctx_doughnut = document.getElementById("chart-area").getContext("2d");
		window.myDoughnut = new Chart(ctx_doughnut).Doughnut(doughnutData, {responsive : true});
	};
</script>

<div style="width:100%;height:100%">
    <div id="sideMenu">
        <div style="margin:3%; font-size: 25px;">Seriousity 수행 능력 지수</div>
			<br>' <%=gamename%> ' 발달 과정<br>
	        <canvas id="canvas_game1" height="240" width="380"></canvas>
	        <br><br>' <%=gamename%> ' 의 평균
	        <canvas id="chart-area" />
        <div id="capacity">
        </div>        
    </div>
	
    <div id="main" style="text-align:center;">
    	<div id="container" style="margin:5%"></div>
    	<canvas id="canvasOne" style="margin:5%; border:1px solid black; "></canvas>
    </div>
      
</div>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./js/easeljs-0.7.1.min.js"></script>
<script src="http://d3lp1msu2r81bx.cloudfront.net/kjs/js/lib/kinetic-v5.1.0.min.js"></script>
<script type="text/javascript">
	var setcanvas = document.getElementById('canvasOne');
	$(document).ready(function(){
		setcanvas.width  = $('#main').width()*0.8;
		setcanvas.height = $('#main').height()*0.8;
		$('#canvasOne').show();
	});
	/* $(window).resize(function() {
		setcanvas.width  = $('#main').width()*0.8;
		setcanvas.height = $('#main').height()*0.8;
		console.log('a')
	}); */
</script>

<script src="js/game/<%=gamename%>.js"></script>
