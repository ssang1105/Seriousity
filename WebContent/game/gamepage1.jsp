<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="css/game.css">

<!DOCTYPE html>

 
 <script>
 
  var speed = 300;
 
  var animation_state = 0;
 
  var animation_tick = 0;
 
  var destinedLines = new Array();
 
  var blockQueue = new Array();
 
  var canvas, context;
 
  var thePlayer, theBoard;
 
  var BOARD_WIDTH = 60;  var BOARD_HEIGHT = 480;
 
  var SCREEN_WIDTH = 480;  var SCREEN_HEIGHT = 640;
 
  var BOARD_LEFT = (SCREEN_WIDTH-BOARD_WIDTH)/2;
 
  var BOARD_TOP = (SCREEN_HEIGHT-BOARD_HEIGHT)/2;
 
  var BLOCK_COLORS = new Array("gray","red","green","blue","yellow","purple","cyan","white", "cornflowerblue");
 
  var BLOCK = new Array(
 
   0x222200F0,0x222200F0,0x06600660,0x06600660,0x2640C600,0x2640C600,0x46203600,
 
   0x46203600,0x04700644,0x0E202260,0x44600740,0x062202E0,0x04E00464,0x00E404C4
 
  );
 
  window.onload = eOnLoad; 
 
  function eOnLoad() {
 
   canvas = document.createElement("canvas");
 
   canvas.setAttribute('width', SCREEN_WIDTH);
 
   canvas.setAttribute('height', SCREEN_HEIGHT);
 
   document.body.appendChild(canvas);
 
   context = canvas.getContext("2d");
 
   context.fillStyle="Black";
 
   context.fillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
 
   thePlayer = new Player();
 
   theBoard = new Board();
 
   thePlayer.reset();
 
   refresh();
 
   setInterval(gameLoop, 10);
 
  }
 
  window.onkeydown = eOnKeyDown;
 
  function eOnKeyDown() {
 
   if (animation_state) return;
 
   var key = event.keyCode;
 
   if (key == 37 || key == 39 || key == 40)
 
   {
 
    thePlayer.move(key-37, 1);
 
    if (!theBoard.checkBlock(thePlayer))
 
    {
 
     thePlayer.move(key-37, -1);
 
     return;
 
    }
 
   }
 
   else if (key == 32)
 
   {
 
    do {
 
     thePlayer.move(3, 1);
 
    }
 
    while (theBoard.checkBlock(thePlayer));
 
 
 
    thePlayer.move(3, -1);
 
    alarmTimer();
 
    return;
 
   }
 
   else if (key == 38)
 
   {
 
    thePlayer.rotate(1);
 
    if (!theBoard.checkBlock(thePlayer))
 
    {
 
     thePlayer.rotate(-1);
 
     return;
 
    }
 
   }
 
   
 
   else return;
 
   refresh();
 
 
 
  }
 
 </script>
 
 <!--클래스 선언-->
 
 <script>
 
  function Player() {
 
   this.x = 0; this.y = 0;
 
   this.blockIdx = 0;
 
   this.rotateIdx = 0;
 
   this.draw = function() {
 
    context.fillStyle = "red";
 
    context.fillRect(
 
     BOARD_LEFT+this.x*10,
 
     BOARD_TOP+BOARD_HEIGHT-this.y*10,
 
     10,
 
     10
 
    );
 
   };
 
   this.move = function(d,delta) {
 
    if (d == 0) this.x-=delta;
 
    if (d == 1) this.y+=delta;
 
    if (d == 2) this.x+=delta;
 
    if (d == 3) this.y-=delta;
 
   };
 
   this.rotate = function(r) {
 
    this.rotateIdx += r+4;
 
    this.rotateIdx %= 4;
 
   };
 
   this.reset = function() {
 
    this.x = parseInt(BOARD_WIDTH/10/2)-2;
 
    this.y = BOARD_HEIGHT/10-3;
 
    this.blockIdx = parseInt(Math.random()*7+1);
 
    this.rotateIdx = 0;
 
   }
 
  }
 
  function Block(offsetX, offsetY) {
 
   this.offsetX = offsetX;
 
   this.offsetY = offsetY;
 
   this.blockIdx = 0;
 
   this.isChanged = 1;
 
   this.draw = function() {
 
    if (this.isChanged) {
 
     context.fillStyle=BLOCK_COLORS[this.blockIdx];
 
     context.fillRect(
 
      BOARD_LEFT+this.offsetX*10,
 
      BOARD_TOP+BOARD_HEIGHT-this.offsetY*10,
 
      10,
 
      10
 
     );
 
     this.isChanged = 0;
 
    }
 
   }
 
   this.change = function(index) {
 
     this.isChanged = 1;
 
    this.blockIdx = index;
 
   }
 
  }
 
  function Board() {
 
   this.blocks = new Array();
 
   for (row = 0; row < BOARD_HEIGHT/10; row++)
 
   {
 
    this.blocks[row] = new Array();
 
    for (col = 0; col < BOARD_WIDTH/10; col++)
 
     this.blocks[row][col] = new Block(col, row);
 
   }
 
   
 
   this.draw = function() {
 
    for (row = 0; row < BOARD_HEIGHT/10; row++)
 
     for (col = 0; col < BOARD_WIDTH/10; col++)
 
      this.blocks[row][col].draw();
 
   }
 
   this.checkBlock = function(player) {
 
    for (r = 0; r < 4; r++)
 
    for (c = 0; c < 4; c++)
 
    {
 
     var x = r+player.x;
 
     var y = c+player.y;
 
     if (!getBlock(player.blockIdx,player.rotateIdx,r,c)) continue;
 
     if (x >= BOARD_WIDTH/10 || x < 0 || y < 0) return 0;
 
     if (this.blocks[y][x].blockIdx == 8) return 0;
 
 
 
    }
 
    return 1;
 
   }
 
   this.putBlock = function(player) {
 
    for (r = 0; r < 4; r++)
 
    for (c = 0; c < 4; c++)
 
    {
 
     var x = r+player.x;
 
     var y = c+player.y;
 
     if (!getBlock(player.blockIdx,player.rotateIdx,r,c)) continue;
 
     if (x >= BOARD_WIDTH/10 || x < 0 || y >= BOARD_HEIGHT/10 || y < 0) continue;
 
     this.blocks[y][x].isChanged = 1;
 
     this.blocks[y][x].blockIdx = player.blockIdx;
 
    }
 
   }
 
   this.settleBlock = function(player) {
 
    for (r = 0; r < 4; r++)
 
    for (c = 0; c < 4; c++)
 
    {
 
     var x = r+player.x;
 
     var y = c+player.y;
 
     if (!getBlock(player.blockIdx,player.rotateIdx,r,c)) continue;
 
     if (x >= BOARD_WIDTH/10 || x < 0 || y >= BOARD_HEIGHT/10 || y < 0) continue;
 
     this.blocks[y][x].isChanged = 1;
 
     this.blocks[y][x].blockIdx = 8;
 
    }
 
   }
 
   this.checkLine = function() {
 
    destinedLines = new Array();
 
    count = 0;
 
    for (row = 0; row < BOARD_HEIGHT/10; row++)
 
    {
 
     for (col = 0; col < BOARD_WIDTH/10; col++)
 
      if (this.blocks[row][col].blockIdx != 8) break;
 
     if (col == parseInt(BOARD_WIDTH/10))
 
      destinedLines[count++] = row;
 
    }
 
    if (count) animation_state = 1;
 
   }
 
   this.clearLine = function() {
 
    var offset = 0;
 
    for (i = 0; i < destinedLines.length; i++)
 
    {
 
     for (row = destinedLines[i]-offset; row < BOARD_HEIGHT/10-1; row++)
 
      for (col = 0; col < BOARD_WIDTH/10; col++)
 
       this.blocks[row][col].change(this.blocks[row+1][col].blockIdx);
 
     offset++;
 
    }
 
    destinedLines = new Array();
 
 
 
   }
 
   this.clear = function() {
 
    for (row = 0; row < BOARD_HEIGHT/10; row++)
 
     for (col = 0; col < BOARD_WIDTH/10; col++)
 
      if (this.blocks[row][col].blockIdx != 0
 
       && this.blocks[row][col].blockIdx != 8)
 
      {
 
       this.blocks[row][col].isChanged = 1;
 
       this.blocks[row][col].blockIdx = 0;
 
      }
 
   }
 
  }
 
 </script>
 
 <!--게임루프 선언-->
 
 <script>
 
  var then = new Date().getTime(), now;
 
  function alarmTimer()
 
  {
 
   then = new Date().getTime()-speed;
 
  }
 
  function gameLoop() {
 
   if (animation_state)
 
   {
 
    context.save();
 
    context.fillStyle = randomColor();
 
    for (i = 0; i < destinedLines.length; i++)
 
    {
 
     context.fillRect(
 
      BOARD_LEFT,
 
      BOARD_TOP+BOARD_HEIGHT-destinedLines[i]*10,
 
      BOARD_WIDTH,
 
      10
 
     );
 
    }
 
    context.restore();
 
    animation_tick++;
 
    if (animation_tick>30) animation_tick = animation_state = 0;
 
    return;
 
   }
 
 
 
   now = new Date().getTime();
 
   if ((now-then) < speed) return;
 
   then = new Date().getTime();
 
 
 
   theBoard.clearLine();
 
 
 
   thePlayer.move(3,1);
 
   if (!theBoard.checkBlock(thePlayer))
 
   {
 
    thePlayer.move(3,-1);
 
    theBoard.settleBlock(thePlayer);
 
    theBoard.checkLine();
 
    thePlayer.reset(); 
 
   }
 
   refresh();
 
  }
 
  function refresh() {
 
   context.save();
 
   theBoard.clear();
 
   theBoard.putBlock(thePlayer);
 
   theBoard.draw();
 
   context.restore();
 
  }
 
 </script>
 
 <!--보조함수 선언-->
 
 <script>
 
  function randomColor() {
 
   return "rgb(" +
 
    Math.round(Math.random()*255) + "," +
 
    Math.round(Math.random()*255) + "," +
 
    Math.round(Math.random()*255) + ")";
 
  }
 
  function getBlock(bi, ri, row, col)
 
  {
 
   return !!((BLOCK[bi*2+parseInt(ri/2)-2]>>(16*((1+ri)%2)))&(1<<(15-row*4-col)))*1;
 
  }
 
  function pos(idxX, idxY)
 
  {
 
   return function () {
 
    this.x = BOARD_LEFT + idxX * 10;
 
    this.y = BOARD_TOP - idxY * 10;
 
   };
 
  }
 
 
 
  function printInfo(obj)
 
  {
 
   tmpstr = '';
 
   for (i in obj)
 
   {
 
    tmpstr += i + " : " + obj[i] + "<br>\n";
 
   }
 
   hello.innerText = tmpstr; 
 
  }
 
 </script>


 <table>
 	<td id=hello></td>
 	<td><input type="button" onclick="convertScore()" value="점수환산"/></td>
 </table>

<script>
	var convertScore = function(){
		var gameNum = 1;
		var score = 10000;
		
		location.href = "insertgamedb.do?score="+score+"&gameNum="+gameNum;
	};
</script>

	


