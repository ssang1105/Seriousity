//load
createjs.Ticker.addEventListener("tick", load);

var stage = new createjs.Stage("canvasOne");	

var rect = new createjs.Shape();
	rect.graphics.beginFill("black").drawRect(0, 0, 1000, 1000); 

var stopWatch = new createjs.Text();
var rightImg = new createjs.Bitmap("./image/concentrationtest/o.png");
var wrongImg = new createjs.Bitmap("./image/concentrationtest/x.png");
var save = new createjs.Bitmap("./image/concentrationtest/save.png");
var description1 = new createjs.Text();
var descriptionimg = new createjs.Bitmap("./image/cardmatch/descriptionSkip.png");
	descriptionimg.x=490;
	descriptionimg.y=370;

var redRect = new createjs.Shape();
	redRect.graphics.beginFill("red").drawRect(500, 140, 40, 40); 
var blueRect = new createjs.Shape();
	blueRect.graphics.beginFill("blue").drawRect(500, 210, 40, 40); 
var yellowRect = new createjs.Shape();
	yellowRect.graphics.beginFill("yellow").drawRect(500, 280, 40, 40); 
var greenRect = new createjs.Shape();
	greenRect.graphics.beginFill("green").drawRect(500, 350, 40, 40); 
var whiteRect = new createjs.Shape();
	whiteRect.graphics.beginFill("white").drawRect(500, 420, 40, 40); 	
	
var cnt=0;	
var finalTime = 0;

	redRect.addEventListener("click", function(event){
		
			if(textNum[cnt]== 0)
			{
				drawRightImg();
				cnt++;							
				question();
			}else 
			{
				drawWrongImg();
			}
		
	});
	blueRect.addEventListener("click", function(event){
		

			if(textNum[cnt]== 1)
			{
				drawRightImg();
				cnt++;
				question();
			}else 
			{
				drawWrongImg();
			}	
		
	});
	yellowRect.addEventListener("click", function(event){
		
			if(textNum[cnt]== 2)
			{
				drawRightImg();
				cnt++;
				question();
			}else 
			{
				drawWrongImg();
			}
		
	});
	greenRect.addEventListener("click", function(event){
			
			if(textNum[cnt]== 3)
			{
				drawRightImg();
				cnt++;
				question();
			}else 
			{
				drawWrongImg();
			}	
		
	});
	whiteRect.addEventListener("click", function(event){
	
			if(textNum[cnt]== 4)
			{
				drawRightImg();
				cnt++;
				question();
			}else 
			{
				drawWrongImg();
			}	
		
	});
	
var text = new createjs.Text();	
var colorText = new createjs.Text();

	colorText.text = "color ?";
	colorText.font = "bold 30px Arial";
	colorText.color = "#ffffff";
	colorText.x = 470; 
	colorText.y = 100;
	colorText.textBaseline = "alphabetic";	

var colorNum = new Array(); 
var textNum = new Array();
var color = 0;
	
var startimg = new createjs.Bitmap("./image/concentrationtest/gameStartBtn.png");
	startimg.scaleX=0.8;
	startimg.scaleY=0.8;
	startimg.x= 275;
	startimg.y= 220;

	
	startimg.addEventListener("click", function(event){
		stage.removeChild(startimg);
		description1.text = "Choose a color that matches the text";
		description1.font = "bold 33px Arial";
		description1.color = "#ffffff";
		description1.x = 95; 
		description1.y = 200;
		description1.textBaseline = "alphabetic";
		
		stage.addChild(description1);
		stage.addChild(descriptionimg);
		stage.update();
	});
	
	descriptionimg.addEventListener("click",function(event){
		stage.removeChild(description1);		
		stage.removeChild(descriptionimg);
		createjs.Ticker.on("tick", timerStart);
		switch(textNum[0])
		{
			case 0:
				text.text = "RED";
				break;
			case 1:
				text.text = "BLUE";
				break;
			case 2:
				text.text = "YELLOW";
				break;
			case 3:
				text.text = "GREEN";
				break;
			case 4:
				text.text = "WHITE";
				break;
			default:
				text.text = "etc...";			
		}
					
		switch(colorNum[0])
		{
			case 0:
				text.color = "red";
				break;
			case 1:
				text.color = "blue";
				break;
			case 2:
				text.color = "yellow";
				break;
			case 3:
				text.color = "green";
				break;
			case 4:
				text.color = "white";
				break;
			default:
				text.color = "pink";			
		}
		
		text.font = "bold 50px Arial";
		text.x = 180; 
		text.y = 250;
		text.textBaseline = "alphabetic";	
		
		
		stage.addChild(text);		
		stage.addChild(colorText);
		
		stage.addChild(redRect);
		stage.addChild(blueRect);
		stage.addChild(yellowRect);
		stage.addChild(greenRect);
		stage.addChild(whiteRect);
		
		stage.removeChild(startimg);
		stage.update();	
	});
	
for( var i = 0 ; i <= 20 ; i++ )
{
	colorNum[i] = parseInt(Math.random()*5);
	textNum[i] = parseInt(Math.random()*5);	
}

stage.addChild(rect);
stage.addChild(startimg);

function question(){
	
		stage.removeChild(text);
		switch(textNum[cnt])
		{
			case 0:
				text.text = "RED";
				break;
			case 1:
				text.text = "BLUE";
				break;
			case 2:
				text.text = "YELLOW";
				break;
			case 3:
				text.text = "GREEN";
				break;
			case 4:
				text.text = "WHITE";
				break;
			default:
				text.text = "etc...";			
		}		
		switch(colorNum[cnt])
		{
			case 0:
				text.color = "red";
				break;
			case 1:
				text.color = "blue";
				break;
			case 2:
				text.color = "yellow";
				break;
			case 3:
				text.color = "green";
				break;
			case 4:
				text.color = "white";
				break;
			default:
				text.color = "pink";			
		}
		text.font = "bold 50px Arial";
		text.x = 180; 
		text.y = 250;
		text.textBaseline = "alphabetic";	
		stage.addChild(text);
};

function timerStart(){			
	
	finalTime = createjs.Ticker.getTime(true);
	stopWatch.text = "time : "+finalTime;
	stopWatch.font = "bold 20px Arial";
	stopWatch.color = "#ffffff";
	stopWatch.x = 10; 
	stopWatch.y = 15;
	stopWatch.textBaseline = "alphabetic";
	stage.addChild(stopWatch);
};

function timerStop(){
	var paused = !createjs.Ticker.getPaused();
	createjs.Ticker.setPaused(paused);
};

function drawRightImg(){
	
	rightImg.x= 150;
	rightImg.y= 120;
	
	stage.addChild(rightImg);
	
	setTimeout(function() {
		stage.removeChild(rightImg);
	    }, 100);
};

function drawWrongImg(){
	
	wrongImg.x= 150;
	wrongImg.y= 120;
	
	stage.addChild(wrongImg);
	
	setTimeout(function() {
		stage.removeChild(wrongImg);
	    }, 100);
};

function load(){
	
	if(cnt == 20)
	{
		stage.removeChild(text);		
		stage.removeChild(colorText);
		
		stage.removeChild(redRect);
		stage.removeChild(blueRect);
		stage.removeChild(yellowRect);
		stage.removeChild(greenRect);
		stage.removeChild(whiteRect);
				
		timerStop();
		
		save.x= 270;
		save.y= 240;
		stage.addChild(save);
	}
	stage.update();
};

save.addEventListener("click", function(event){	
	
	var convertFinalTime = finalTime / 1000; 
	var score;
	
	if(convertFinalTime < 22)
	{
		score = 100;
	}else if(convertFinalTime < 28)
	{
		score = 90;
	}else if(convertFinalTime < 30)
	{
		score = 80;
	}else if(convertFinalTime < 33)
	{
		score = 70;
	}else if(convertFinalTime < 37)
	{
		score = 60;
	}else if(convertFinalTime < 42)
	{
		score = 50;
	}else if(convertFinalTime < 48)
	{
		score = 40;
	}else if(convertFinalTime < 55)
	{
		score = 30;
	}else if(convertFinalTime < 63)
	{
		score = 20;
	}else if(convertFinalTime < 75)
	{
		score = 10;
	}else if(convertFinalTime < 100)
	{
		score = 0;
	}
	
	location.href = "insertgamedb.do?gameNum=3&score="+score;
});