<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="css/game.css">
<!-- speed test -->
<!DOCTYPE html>

 
 <script>

 function init() {
	 
	var SCREEN_WIDTH=640;
	var SCREEN_HEIGHT=480;
	
	var theCanvas = document.getElementById('canvasOne');
	var context = theCanvas.getContext("2d");
	 
	context.fillStyle="#000fff";
	context.fillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

	var img = document.getElementById("image");
	
	  
	function cardChange(){
		var num = parseInt(Math.random()*5);
		img.src = "image/card"+num+".png";
		img.value = num;
		context.drawImage(img,100,100);		
	};
	
	 function eOnLoad() {
	 

	 
	  //img.src = "image/card"+(Math.random()*5)+1+".png";
	  
	 


	 // setInterval(gameLoop, 3000);

	 };
	 
	 function gameLoop(){
		drawScreen();
	 };
	  
	 function drawScreen(){
		 context.drawImage(img,50,50);
	 };
	 
	}

	document.addEventListener("DOMContentLoaded", init, false);
 </script>
 
<table> 
	<td><canvas id="canvasOne" width="640" height="480"></canvas></td>
	<td><input type="button" onclick="convertScore()" value="점수환산"/></td>
</table>
<img id="image" src="" value="" />
<input type="button" style="z-index:2; position:absolute; top:x; left:y" value="test" onclick="cardChange()"/>

<script>
	var convertScore = function(){
		var gameNum = 1;
		var score = 10000;
		
		location.href = "insertgamedb.do?score="+score+"&gameNum="+gameNum;
	};
</script>

	


