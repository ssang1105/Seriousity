	var stage = new createjs.Stage("canvasOne");	
	var rect = new createjs.Shape();	
	var text = new createjs.Text();
	var stopWatch = new createjs.Text();
	var description1 = new createjs.Text();
	var description2 = new createjs.Text();
	
	var startimg = new createjs.Bitmap("./image/cardmatch/gameStartBtn.png");
	var descriptionimg = new createjs.Bitmap("./image/cardmatch/descriptionSkip.png");
	var rightBtn = new createjs.Bitmap("./image/cardmatch/yes.png");
	var wrongBtn = new createjs.Bitmap("./image/cardmatch/no.png");
	var gonext = new createjs.Bitmap("./image/cardmatch/gonext.png");
	var save = new createjs.Bitmap("./image/cardmatch/save.png");
	
	rightBtn.x=220;
	rightBtn.y=420;
	wrongBtn.x=420;
	wrongBtn.y=420;
	gonext.x= 300;
	gonext.y= 420;
	
	var rightImg = new createjs.Bitmap("./image/cardmatch/o.png");
	var wrongImg = new createjs.Bitmap("./image/cardmatch/x.png");
	var cardimg = new Array();
	var num = new Array();
	
	for(var i =0 ;i<20;i++)
	{
		num[i] = parseInt(Math.random()*5);
		cardimg[i] = new createjs.Bitmap("./image/cardmatch/card"+num[i]+".png");
		cardimg[i].scaleX=1.5;
		cardimg[i].scaleY=1.5;
		cardimg[i].x= 250;
		cardimg[i].y= 100;
	}
	
	var tick;
	
	var click=0;
	var cardCount=0;
	var currentNum=0;
	var pastNum=0;
	
	var rightNum=0;
	var wrongNum=0;
	
	var tagRight=0;
	var tagWrong=0;
	
	var enterTag = 0;	
	var finish = 0;
	var finalTime = 0;
	
	startimg.scaleX=0.8;
	startimg.scaleY=0.8;
	startimg.x= 275;
	startimg.y= 220;
	
	descriptionimg.x=490;
	descriptionimg.y=370;
	
	rect.graphics.beginFill("black").drawRect(0, 0, 1000, 1000); 
	
	stage.addChild(rect);	
	stage.addChild(startimg);	
		
	startimg.addEventListener("click", function(event){
		stage.removeChild(startimg);
		description1.text = "Click 'Right' if card matched";
		description2.text = "else , Click 'Left'";
		description1.font = "bold 40px Arial";
		description2.font = "bold 40px Arial";
		description1.color = "#ffffff";
		description2.color = "#ffffff";
		description1.x = 125; 
		description1.y = 180;
		description2.x = 220; 
		description2.y = 240;
		description1.textBaseline = "alphabetic";
		description2.textBaseline = "alphabetic";
		
		stage.addChild(description1);
		stage.addChild(description2);
		stage.addChild(descriptionimg);
		stage.update();
	});
	
	descriptionimg.addEventListener("click",function(event){
		click = 1;
		stage.removeChild(description1);
		stage.removeChild(description2);
		stage.removeChild(descriptionimg);
		stage.addChild(cardimg[0]);
		stage.addChild(gonext);			
		stage.update();		
	});
	gonext.addEventListener("click", function(event){
		
		createjs.Ticker.on("tick", timerStart);
		
		stage.removeChild(cardimg[0]);
		stage.addChild(cardimg[1]);
		stage.removeChild(gonext);
		stage.addChild(rightBtn);
		stage.addChild(wrongBtn);
		stage.update();			
	});	
	
	createjs.Ticker.addEventListener("tick", clickCheck);
	
	function clickCheck(){
		if(click == 0)
		{
			stage.update();
		}
		else if(click == 1)
		{
			stage.update();	
		}
	};	
	

		rightBtn.addEventListener("click", function(event) {
			tagRight++;			
			enterTag=0;			

			console.log("past : " +num[cardCount]);
			console.log("current : " +num[cardCount+1]);
			
			if(cardCount == 1)
			{
				//exception
				rightImg.scaleX=1.2;
				rightImg.scaleY=1.2;
				rightImg.x= 250;
				rightImg.y= 110;
				
				cardCount++;	
				nextCard();

				stage.addChild(rightImg);
				setTimeout(function() {
					stage.removeChild(rightImg);
				    }, 130);
				rightNum++;
				stage.update();
				
			}
			else if(num[cardCount] == num[cardCount+1])
			{
				rightImg.scaleX=1.2;
				rightImg.scaleY=1.2;
				rightImg.x= 250;
				rightImg.y= 110;
				
				cardCount++;	
				nextCard();

				stage.addChild(rightImg);
				setTimeout(function() {
					stage.removeChild(rightImg);
				    }, 130);
				rightNum++;
				stage.update();
				
			}
			else if(num[cardCount] != num[cardCount+1])
			{
				wrongImg.scaleX=1.2;
				wrongImg.scaleY=1.2;
				wrongImg.x= 250;
				wrongImg.y= 110;
				
				cardCount++;	
				nextCard();

				stage.addChild(wrongImg);
				setTimeout(function() {
					stage.removeChild(wrongImg);
				    }, 130);
				stage.update();
				wrongNum++;
			}			
			gameFinish();			
			
			
		});
		
		wrongBtn.addEventListener("click", function(event) {

			tagWrong++;
			enterTag=0;			
			
			console.log("past : " +num[cardCount]);
			console.log("current : " +num[cardCount+1]);
			if(num[cardCount] != num[cardCount+1])
			{
				rightImg.scaleX=1.2;
				rightImg.scaleY=1.2;
				rightImg.x= 250;
				rightImg.y= 110;
				
				cardCount++;	
				nextCard();	
				stage.addChild(rightImg);
				
				setTimeout(function() {
					stage.removeChild(rightImg);
				    }, 130);
				
				stage.update();
				rightNum++;
			}
			else if(num[cardCount] == num[cardCount+1])
			{
				wrongImg.scaleX=1.2;
				wrongImg.scaleY=1.2;
				wrongImg.x= 250;
				wrongImg.y= 110;
				
				cardCount++;	
				nextCard();				
				stage.addChild(wrongImg);
				
				setTimeout(function() {
					stage.removeChild(wrongImg);
				    }, 130);
				
				stage.update();
				wrongNum++;
			}
			
			gameFinish();				
		});
		
		function nextCard(){
			stage.removeChild(cardimg[cardCount]);					
			stage.addChild(cardimg[cardCount+1]);
		};
		
		function gameFinish(){
			if(cardCount == 18)
			{
				for(var i = 0 ; i<20 ;i++)
				{
					stage.removeChild(cardimg[i]);
				}
				
				stage.removeChild(rightBtn);
				stage.removeChild(wrongBtn);
				stage.removeChild(wrongImg);
				stage.removeChild(rightImg);					
				
				afterGame();
				timerStop();
			}
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
		
		function afterGame(){
			text.text = " Right Number : " + rightNum + " \n\n Wrong Number : " +wrongNum;
			text.font = "bold 30px Arial";
			text.color = "#ffffff";
			text.x = 250; 
			text.y = 220;
			text.textBaseline = "alphabetic";
			
			save.x = 280;
			save.y = 400;
			
			stage.addChild(text);
			stage.addChild(save);
		};
		
		save.addEventListener("click", function(event) {			
			
			var score = (rightNum - wrongNum );
			var timescore = finalTime / 1000;
			var multiple;
			
			if(timescore <1.5)
			{
				multiple = 8;
			}else if(timescore <1.7)
			{
				multiple = 7;
			}else if(timescore <1.9)
			{
				multiple = 6;
			}else
			{
				multiple = 5;
			}				
			
			location.href = "insertgamedb.do?gameNum=1&score="+score*parseInt(multiple);
		});	var stage = new createjs.Stage("canvasOne");	
		var rect = new createjs.Shape();	
		var text = new createjs.Text();
		var stopWatch = new createjs.Text();
		var description1 = new createjs.Text();
		var description2 = new createjs.Text();
		
		var startimg = new createjs.Bitmap("./image/cardmatch/gameStartBtn.png");
		var descriptionimg = new createjs.Bitmap("./image/cardmatch/descriptionSkip.png");
		var rightBtn = new createjs.Bitmap("./image/cardmatch/yes.png");
		var wrongBtn = new createjs.Bitmap("./image/cardmatch/no.png");
		var gonext = new createjs.Bitmap("./image/cardmatch/gonext.png");
		var save = new createjs.Bitmap("./image/cardmatch/save.png");
		
		rightBtn.x=220;
		rightBtn.y=420;
		wrongBtn.x=420;
		wrongBtn.y=420;
		gonext.x= 300;
		gonext.y= 420;
		
		var rightImg = new createjs.Bitmap("./image/cardmatch/o.png");
		var wrongImg = new createjs.Bitmap("./image/cardmatch/x.png");
		var cardimg = new Array();
		var num = new Array();
		
		for(var i =0 ;i<20;i++)
		{
			num[i] = parseInt(Math.random()*5);
			cardimg[i] = new createjs.Bitmap("./image/cardmatch/card"+num[i]+".png");
			cardimg[i].scaleX=1.5;
			cardimg[i].scaleY=1.5;
			cardimg[i].x= 250;
			cardimg[i].y= 100;
		}
		
		var tick;
		
		var click=0;
		var cardCount=0;
		var currentNum=0;
		var pastNum=0;
		
		var rightNum=0;
		var wrongNum=0;
		
		var tagRight=0;
		var tagWrong=0;
		
		var enterTag = 0;	
		var finish = 0;
		var finalTime = 0;
		
		startimg.scaleX=0.8;
		startimg.scaleY=0.8;
		startimg.x= 275;
		startimg.y= 220;
		
		descriptionimg.x=490;
		descriptionimg.y=370;
		
		rect.graphics.beginFill("black").drawRect(0, 0, 1000, 1000); 
		
		stage.addChild(rect);	
		stage.addChild(startimg);	
			
		startimg.addEventListener("click", function(event){
			stage.removeChild(startimg);
			description1.text = "Click 'Right' if card matched";
			description2.text = "else , Click 'Left'";
			description1.font = "bold 40px Arial";
			description2.font = "bold 40px Arial";
			description1.color = "#ffffff";
			description2.color = "#ffffff";
			description1.x = 125; 
			description1.y = 180;
			description2.x = 220; 
			description2.y = 240;
			description1.textBaseline = "alphabetic";
			description2.textBaseline = "alphabetic";
			
			stage.addChild(description1);
			stage.addChild(description2);
			stage.addChild(descriptionimg);
			stage.update();
		});
		
		descriptionimg.addEventListener("click",function(event){
			click = 1;
			stage.removeChild(description1);
			stage.removeChild(description2);
			stage.removeChild(descriptionimg);
			stage.addChild(cardimg[0]);
			stage.addChild(gonext);			
			stage.update();		
		});
		gonext.addEventListener("click", function(event){
			
			createjs.Ticker.on("tick", timerStart);
			
			stage.removeChild(cardimg[0]);
			stage.addChild(cardimg[1]);
			stage.removeChild(gonext);
			stage.addChild(rightBtn);
			stage.addChild(wrongBtn);
			stage.update();			
		});	
		
		createjs.Ticker.addEventListener("tick", clickCheck);
		
		function clickCheck(){
			if(click == 0)
			{
				stage.update();
			}
			else if(click == 1)
			{
				stage.update();	
			}
		};	
		

			rightBtn.addEventListener("click", function(event) {
				tagRight++;			
				enterTag=0;			

				console.log("past : " +num[cardCount]);
				console.log("current : " +num[cardCount+1]);
				
				if(cardCount == 1)
				{
					//exception
					rightImg.scaleX=1.2;
					rightImg.scaleY=1.2;
					rightImg.x= 250;
					rightImg.y= 110;
					
					cardCount++;	
					nextCard();

					stage.addChild(rightImg);
					setTimeout(function() {
						stage.removeChild(rightImg);
					    }, 130);
					rightNum++;
					stage.update();
					
				}
				else if(num[cardCount] == num[cardCount+1])
				{
					rightImg.scaleX=1.2;
					rightImg.scaleY=1.2;
					rightImg.x= 250;
					rightImg.y= 110;
					
					cardCount++;	
					nextCard();

					stage.addChild(rightImg);
					setTimeout(function() {
						stage.removeChild(rightImg);
					    }, 130);
					rightNum++;
					stage.update();
					
				}
				else if(num[cardCount] != num[cardCount+1])
				{
					wrongImg.scaleX=1.2;
					wrongImg.scaleY=1.2;
					wrongImg.x= 250;
					wrongImg.y= 110;
					
					cardCount++;	
					nextCard();

					stage.addChild(wrongImg);
					setTimeout(function() {
						stage.removeChild(wrongImg);
					    }, 130);
					stage.update();
					wrongNum++;
				}			
				gameFinish();			
				
				
			});
			
			wrongBtn.addEventListener("click", function(event) {

				tagWrong++;
				enterTag=0;			
				
				console.log("past : " +num[cardCount]);
				console.log("current : " +num[cardCount+1]);
				if(num[cardCount] != num[cardCount+1])
				{
					rightImg.scaleX=1.2;
					rightImg.scaleY=1.2;
					rightImg.x= 250;
					rightImg.y= 110;
					
					cardCount++;	
					nextCard();	
					stage.addChild(rightImg);
					
					setTimeout(function() {
						stage.removeChild(rightImg);
					    }, 130);
					
					stage.update();
					rightNum++;
				}
				else if(num[cardCount] == num[cardCount+1])
				{
					wrongImg.scaleX=1.2;
					wrongImg.scaleY=1.2;
					wrongImg.x= 250;
					wrongImg.y= 110;
					
					cardCount++;	
					nextCard();				
					stage.addChild(wrongImg);
					
					setTimeout(function() {
						stage.removeChild(wrongImg);
					    }, 130);
					
					stage.update();
					wrongNum++;
				}
				
				gameFinish();				
			});
			
			function nextCard(){
				stage.removeChild(cardimg[cardCount]);					
				stage.addChild(cardimg[cardCount+1]);
			};
			
			function gameFinish(){
				if(cardCount == 18)
				{
					for(var i = 0 ; i<20 ;i++)
					{
						stage.removeChild(cardimg[i]);
					}
					
					stage.removeChild(rightBtn);
					stage.removeChild(wrongBtn);
					stage.removeChild(wrongImg);
					stage.removeChild(rightImg);					
					
					afterGame();
					timerStop();
				}
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
			
			function afterGame(){
				text.text = " Right Number : " + rightNum + " \n\n Wrong Number : " +wrongNum;
				text.font = "bold 30px Arial";
				text.color = "#ffffff";
				text.x = 250; 
				text.y = 220;
				text.textBaseline = "alphabetic";
				
				save.x = 280;
				save.y = 400;
				
				stage.addChild(text);
				stage.addChild(save);
			};
			
			save.addEventListener("click", function(event) {			
				
				var score = (rightNum - wrongNum );
				var timescore = finalTime / 1000;
				var multiple;
				
				if(timescore <1.5)
				{
					multiple = 8;
				}else if(timescore <1.7)
				{
					multiple = 7;
				}else if(timescore <1.9)
				{
					multiple = 6;
				}else
				{
					multiple = 5;
				}				
				
				location.href = "insertgamedb.do?gameNum=1&score="+score*parseInt(multiple);
			});