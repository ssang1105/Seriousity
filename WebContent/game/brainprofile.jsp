<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="css/brainprofile.css">
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
	
	
	
	window.onload = function(){
		var ability = document.getElementById("ability").getContext("2d");
		window.myLine = new Chart(ability).Radar(data, {
			responsive: false
		});		
		
		var compare=[(m_average_1/m_cnt1)-(t_average_1/t_cnt1),0,(m_average_3/m_cnt3)-(t_average_3/t_cnt3),0,0];
		var best;
		var bestPart;
		for(var i = 0 ; i<compare.length ; i++)
		{
			best=0;
			if(compare[i]>=compare[i+1])
			{
				best=i;
			}
		}
		
		switch(best){
			case 0:
				bestPart="집중력";
				break;
			case 1:
				bestPart="기억력";
				break;
			case 2:
				bestPart="집중력";
				break;
			case 3:
				bestPart="계산능력";
				break;
			default:
				break;
		}
		document.getElementById("bestCapacity").innerHTML="가장 우수한 두뇌 영역은 "+bestPart+"입니다.";
	};
</script>
	<div style="width:100%;height:100%">
	
	    <div id="main">
	        <div style="margin:3%; font-size: 25px;">Seriousity 수행 능력 지수</div>
	        <div id="capacity">
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<canvas id="ability" width="300" height="300"></canvas>            
	        </div>
	        <div style="margin:3%; font-size: 25px;">가장 우수한 두뇌 영역</div>
	        <div id="bestCapacity">
	        </div>
    	</div>  	    	    	
	</div>
	
	