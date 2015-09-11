<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="css/hello.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./js/Chart.js"></script>
<script>
var m_average_1=0;
var m_average_2=0;
var m_average_3=0;
var m_average_4=0;
var m_average_5=0;

var m_cnt1=0;
var m_cnt2=0;
var m_cnt3=0;
var m_cnt4=0;
var m_cnt5=0;

var t_average_1=0;
var t_average_2=0;
var t_average_3=0;
var t_average_4=0;
var t_average_5=0;

var t_cnt1=0;
var t_cnt2=0;
var t_cnt3=0;
var t_cnt4=0;
var t_cnt5=0;

var week=[0,0,0,0,0,0,0];
<%
 	ArrayList m_gameList1 = (ArrayList)request.getAttribute("m_gameList1");
	ArrayList m_gameList2 = (ArrayList)request.getAttribute("m_gameList2");	
	ArrayList m_gameList3 = (ArrayList)request.getAttribute("m_gameList3");	
	ArrayList m_gameList4 = (ArrayList)request.getAttribute("m_gameList4");	
	ArrayList m_gameList5 = (ArrayList)request.getAttribute("m_gameList5");	
	
	ArrayList t_gameList1 = (ArrayList)request.getAttribute("t_gameList1");
	ArrayList t_gameList2 = (ArrayList)request.getAttribute("t_gameList2");	
	ArrayList t_gameList3 = (ArrayList)request.getAttribute("t_gameList3");	
	ArrayList t_gameList4 = (ArrayList)request.getAttribute("t_gameList4");	
	ArrayList t_gameList5 = (ArrayList)request.getAttribute("t_gameList5");	
	
	ArrayList trainList = (ArrayList)request.getAttribute("trainList");
	
	if(trainList!=null)
	{
		String week;
		for(int i = 0 ; i<trainList.size() ;i++)
		{
			week = (String)trainList.get(i);
			//System.out.println("####"+(String)trainList.get(i));
			if(week.equals("sun"))
			{
				%>
					week[0]++;
				<%
			}else if(week.equals("mon")){
				%>
					week[1]++;
				<%
			}else if(week.equals("tus")){
				%>
					week[2]++;
				<%
			}else if(week.equals("wed")){
				%>
					week[3]++;
				<%				
			}else if(week.equals("thr")){
				%>
					week[4]++;
				<%
			}else if(week.equals("fri")){
				%>
					week[5]++;
				<%
			}else if(week.equals("sat")){
				%>
					week[6]++;
				<%
			}
			
		}
	}	
	 	
	System.out.println(">>>>>>" +t_gameList3);
	for(int i = 0 ; i<m_gameList1.size(); i++)
	{
%>		
		m_average_1 = m_average_1+<%=m_gameList1.get(i)%>;
		m_cnt1++;
<%
	}
	for(int i = 0 ; i<m_gameList2.size(); i++)
	{
%>		
		m_average_2 = m_average_2+<%=m_gameList2.get(i)%>;
		m_cnt2++;
<%
	}
	for(int i = 0 ; i<m_gameList3.size(); i++)
	{
%>		
		m_average_3 = m_average_3+<%=m_gameList3.get(i)%>;
		m_cnt3++;
<%
	}
	for(int i = 0 ; i<m_gameList4.size(); i++)
	{
%>		
		m_average_4 = m_average_4+<%=m_gameList4.get(i)%>;
		m_cnt4++;
<%
	}
	for(int i = 0 ; i<m_gameList5.size(); i++)
	{
%>		
		m_average_5 = m_average_5+<%=m_gameList5.get(i)%>;
		m_cnt5++;
<%
	}
	for(int i = 0 ; i<t_gameList1.size(); i++)
	{
%>		
		t_average_1 = t_average_1+<%=t_gameList1.get(i)%>;
		t_cnt1++;
<%
	}
	for(int i = 0 ; i<t_gameList2.size(); i++)
	{
%>		
		t_average_2 = t_average_2+<%=t_gameList2.get(i)%>;
		t_cnt2++;
<%
	}
	for(int i = 0 ; i<t_gameList3.size(); i++)
	{
%>		
		t_average_3 = t_average_3+<%=t_gameList3.get(i)%>;
		t_cnt3++;
<%
	}
	for(int i = 0 ; i<t_gameList4.size(); i++)
	{
%>		
		t_average_4 = t_average_4+<%=t_gameList4.get(i)%>;
		t_cnt4++;
<%
	}
	for(int i = 0 ; i<t_gameList5.size(); i++)
	{
%>		
		t_average_5 = t_average_5+<%=t_gameList5.get(i)%>;
		t_cnt5++;
<%
	}	
%>

var data = {
		labels: ["속도", "기억력", "집중력", "계산능력"],
	    datasets: [
	        {
	            label: "My First dataset",
	            fillColor: "rgba(220,220,220,0.2)",
	            strokeColor: "rgba(220,220,220,1)",
	            pointColor: "rgba(220,220,220,1)",
	            pointStrokeColor: "#fff",
	            pointHighlightFill: "#fff",
	            pointHighlightStroke: "rgba(220,220,220,1)",
	            data: [t_average_1/t_cnt1,t_average_2/t_cnt2,t_average_3/t_cnt3,t_average_4/t_cnt4]
	        },
	        {
	            label: "My Second dataset",
	            fillColor: "rgba(151,187,205,0.2)",
	            strokeColor: "rgba(151,187,205,1)",
	            pointColor: "rgba(151,187,205,1)",
	            pointStrokeColor: "#fff",
	            pointHighlightFill: "#fff",
	            pointHighlightStroke: "rgba(151,187,205,1)",
	            data: [m_average_1/m_cnt1,m_average_2/m_cnt2,m_average_3/m_cnt3,m_average_4/m_cnt4]
	        }
	    ]
	};
	
var lineChartData = {
		
		labels : ["일","월","화","수","목","금","토"],
		datasets : [
			{
				label: "My First dataset",
				fillColor : "#fff",
				strokeColor : "rgba(255,167,13,2)",
				pointColor : "rgba(226,61,13,1)",
				pointStrokeColor : "rgba(255,167,13,2)",
				pointHighlightFill : "rgba(255,167,13,2)",
				pointHighlightStroke : "rgba(255,167,13,2)",
				data : [week[0],week[1],week[2],week[3],week[4],week[5],week[6]]
			}
		]
	};
	
window.onload = function(){
	
	var ctx = document.getElementById("training_record").getContext("2d");
	window.myLine = new Chart(ctx).Line(lineChartData, {responsive: true});	

	var ability = document.getElementById("ability").getContext("2d");
	window.myLine = new Chart(ability).Radar(data, {
		responsive: true
	});	
}; 

</script>
<script>
$(function(){	
	
	var board = $("#record");
	$('.weekday').bind("click",function(){	
		var day = $(this).attr("data-value");
		
		$.ajax({
			url:"loadbyday.do",
			dataType:'html',
			data:{
				day:day
			},
			success:function(s_data){
				board.html(s_data);
			}, error:function(){
				alert('정보를 읽는도중 에러가 발생하였습니다 !');
			}
		}); 	 	
	});
});

var goGame = function(gamename){

	location.href="gamedetail.do?gamename="+gamename;	
	
};

var warning = function(){
	alert('로그인 먼저 해주세요');
};	

</script>
<div style="width:100%;height:100%">
        <div id="mainContainer">
            <div id="weeklyRecords">
                <div id="weekdays">
	                <div class="weekday" data-value="sun">일요일</div>
                    <div class="weekday" data-value="mon">월요일</div>
                    <div class="weekday" data-value="tus">화요일</div>
                    <div class="weekday" data-value="wed">수요일</div>
                    <div class="weekday" data-value="thr">목요일</div>
                    <div class="weekday" data-value="fri">금요일</div>
                    <div class="weekday" data-value="sat">토요일</div>
                    <div id = "record">요일을 선택하여 요일별 정보를 확인하세요</div>                 
                </div>
                
            </div>

            <div id="todayTraining">
                <p style="font-size: 35px;">오늘의 추천 트레이닝</p>
<% 
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{  
%>	
        <div class="sampleApp" onclick="goGame('cardmatch');"><img style="width:100%" src="./image/previewimage/cardmatch.png" style="cursor:pointer"/></div>
        <div class="sampleApp" onclick="goGame('memorytest');"><img style="width:100%" src="./image/previewimage/memorytest.png" style="cursor:pointer"/></div>
        <div class="sampleApp" onclick="goGame('concentrationtest');"><img style="width:100%" src="./image/previewimage/concentration.png" style="cursor:pointer"/></div>
<% 
	}else{
%>
		<div class="sampleApp" onclick="warning();"><img style="width:100%" src="./image/previewimage/cardmatch.png" style="cursor:pointer"/></div>
        <div class="sampleApp" onclick="warning();"><img style="width:100%" src="./image/previewimage/memorytest.png" style="cursor:pointer"/></div>
        <div class="sampleApp" onclick="warning();"><img style="width:100%" src="./image/previewimage/concentration.png" style="cursor:pointer"/></div>
<% 		
	}
%>		        
            </div>
        </div>

        <div id="personalData">
            <div style="margin:5%; font-size: 25px;">Seriousity 수행 능력 지수</div>
<% 
			if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y")){
%>            
            <canvas id="ability"></canvas>            
<% 
			}else{
%> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img id="sample" src="./image/sample.png"/>
<% 
			}
%>			<div id="record">
			<div style="margin:5%; font-size: 25px;">트레이닝 기록</div>
            
<% 
			if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y")){
%>            
				<canvas id="training_record"></canvas>
<% 
			}else{
%>
				로그인후 트레이닝 기록을 확인하세요
<% 
			}
%>

            </div>
        </div>
</div>        
