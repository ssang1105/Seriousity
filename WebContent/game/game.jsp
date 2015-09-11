<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="css/game.css">
<script>
	var goGame = function(gamename){

		location.href="gamedetail.do?gamename="+gamename;	
		
	};

	var warning = function(){
		alert('로그인 먼저 해주세요');
	};	
</script>

<div style="width:100%;height:100%">
    <div id="sideMenu">
        <div id="all">모든 게임</div>
        <div class="subMenu" id="speed">속도</div>
        <div class="subMenu" id="memory">기억력</div>
        <div class="subMenu" id="attention">집중력</div>
        <div class="subMenu" id="flexibility">계산능력</div>
    </div>

    <div id="main">
<% 

if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
{	System.out.println("??" + session.getAttribute("loginYn"));

%>  
		<div class="sampleApp" onclick="goGame('cardmatch');"><img style="width:100%" src="./image/previewimage/cardmatch.png" style="cursor:pointer"/></div>
        <div class="sampleApp" onclick="goGame('memorytest');"><img style="width:100%" src="./image/previewimage/memorytest.png" style="cursor:pointer"/></div>
        <div class="sampleApp" onclick="goGame('concentrationtest');"><img style="width:100%" src="./image/previewimage/concentration.png" style="cursor:pointer"/></div>
        <div class="sampleApp" onclick="goGame('mathtest');"><img style="width:100%" src="./image/previewimage/mathtest.png" style="cursor:pointer"/></div>
        <!-- <div class="sampleApp"></div> -->
<% 
	}
	else
	{
%>  
        <div class="sampleApp" onclick="warning();"><img src="./image/previewimage/cardmatch.png" style="cursor:pointer"/></div>
        <div class="sampleApp" onclick="warning();"><img src="./image/previewimage/memorytest.png" style="cursor:pointer"/></div>
        <div class="sampleApp" onclick="warning();"><img src="./image/previewimage/concentration.png" style="cursor:pointer"/></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
        <div class="sampleApp"></div>
       
<% 
	}	
%>        
    </div>
</div>