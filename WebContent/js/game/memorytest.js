var cards = [];
var gameStage = 2;
var score= 0; 
var clickNum = 0;
var correctNum = 0;
var gameTimerID; // 게임 타이머를 핸들링하기 위한 전역 변수
var cardTimerID; // 카드 보여주는 타이머를 핸들링하기 위한 전역 변수
var unclickCardID;
var correctTextID;
var gameTime = 10; // 문제 해결하는 타이머 시작시의 시간
var cardTime = 4; // 카드 보여주는 타이머 시작시의 시간
var isPreview = false;
var playNum =0;

var scores = new Kinetic.Text({
	x : $('#canvasOne').width()+ $('#canvasOne').width()/15,
	y : 30,
	text :  "남은 횟수 : "+ (7-playNum) + "  점수 : " + score.toFixed(2),
	fontSize : '22',
	fontFamily : 'Helvtica',
	fill : 'black',
	align : 'center'
})

var correctText = new Kinetic.Text({
	x : 30,
	y : $('#canvasOne').height()+ $('#canvasOne').height()*2.1,
	text : "",
	fontSize : '30',
	fontFamily : 'Helvtica',
	fill : 'black',
	align : 'center'
})



$(document).ready(function() {

	$('#canvasOne').hide();

	var stage = new Kinetic.Stage({
		container : 'container',
		width : $('#canvasOne').width(),
		height : $('#canvasOne').height()

	});

	var bgLayer = new Kinetic.Layer();
	var startLayer = new Kinetic.Layer();
	var descriptionLayer = new Kinetic.Layer();
	var gameLayer = new Kinetic.Layer();
	var gameEndLayer = new Kinetic.Layer();
	
	
	
	descriptionLayer.hide();
	gameLayer.hide();
	gameEndLayer.hide();
	
	
	/********* 	Back Ground		*******/
	
	var stageBg = new Kinetic.Rect({
		x : 0,
		y : 0,
		width : stage.getWidth(),
		height : stage.getHeight(),
		fill : "#F6F7F8",
		storke : 'black'
	});
	bgLayer.add(stageBg);
	
	
	/********* 	Game Start Menu		*******/
	
	var gameNameText = new Kinetic.Text({
		x : $('#canvasOne').width() / 3,
		y : 100,
		text : 'Memory Test',
		fontSize : '40',
		fontFamily : 'Helvtica',
		fill : 'black',
		align : 'center'
	});
	
	
	var startBtnimage = new Image();
	startBtnimage.src = './image/memorytest/gameStartBtn.png';
	var startBtn = new Kinetic.Image({
		x : stage.width() / 3,
	    y: stage.height() / 2,
	    image: startBtnimage,
	  });
	
	startBtnimage.onload = function(){
		startLayer.add(startBtn);
		startLayer.draw();
	}
	
	startLayer.add(gameNameText);
	
	startBtn.on('click' , function(){
		goGameDescription();
	})
	startBtn.on('mouseover',function(){
		 document.body.style.cursor = "pointer";
	})
	startBtn.on('mouseout',function(){
		 document.body.style.cursor = "default";
	})
	
	
	/********* 	Game Description Page *******/
	
	var gameDescriptionText = new Kinetic.Text({
		x : 20,
		y : 120,
		text : '본 테스트는 기억 능력을 테스트하는 것으로, \n4초간 검은색으로 보여지는 타일을 기억하였다가, \n'
			+'타일이 다시 원래 색으로 돌아오면, 검은색이었던\n타일을 찾는 게임입니다.\n',
		fontSize : '28',
		fontFamily : 'Helvtica',
		fill : 'black',
	})
	
	var skipBtnImage = new Image();
	skipBtnImage.src = './image/memorytest/descriptionSkip.png';
	
	var skipBtn = new Kinetic.Image({
		x : stage.width() - stage.width() / 2.4,
	    y: stage.height() - stage.height() /3.3,
	    image: skipBtnImage,
	  });
	
	
	skipBtnImage.onload = function(){
		descriptionLayer.add(skipBtn);
		descriptionLayer.draw();
	}
	
	descriptionLayer.add(gameDescriptionText);
	
	
	skipBtn.on('click' , function(){
		gameStart();
	})
	skipBtn.on('mouseover',function(){
		 document.body.style.cursor = "pointer";
	})
	skipBtn.on('mouseout',function(){
		 document.body.style.cursor = "default";
	})
	
	
	
	
	/******** stage에 layer 추가 및 함수 **********/
	
	
	stage.add(bgLayer).add(startLayer).add(descriptionLayer).add(gameLayer).add(gameEndLayer);

	
	function goGameDescription() {
		console.log('game Description Start!');
		startLayer.hide();
		descriptionLayer.show();
		stage.draw();
	}
	
	function gameStart() {
		console.log('game Start!!');
		descriptionLayer.hide();
		gameLayer.show();
		gameLayer.add(scores);
		gameLayer.add(correctText);
		
		
		
		
		/********* 	Game  Page *******/
		
		stage.draw();
		startStage(4);
		
		function startStage(gameStage){
			
			if(playNum  == 6){
				correctNum =0;
				clickNum=0;
				endGame();
			}
				
			cardTimerID = setInterval(decrementCardTime, 400);
			switch (gameStage){
			case 2 :
				cardSetting(2);
				break;
			case 3 :
				cardSetting(3);
				break;
			case 4 :
				cardSetting(4);
				break;
			case 5 :
				cardSetting(5);
				break;
			case 6 :
				cardSetting(6);
				break;
			case 7 :
				cardSetting(7);
				break;
			case 8 :
				cardSetting(8);
				break;
			case 9 :
				cardSetting(9);
				break;
			case 10 :
				cardSetting(10);
				break;
			case 11 :
				cardSetting(11);
				break;
		}
		}
		
		function cardSetting(gameStage){
			playNum++;
			scores.setText("남은 횟수 : "+ (7-playNum) + "  점수 : " + score.toFixed(2));
			gameLayer.draw();
			
			
			for(var i=0; i<200; i++)
				if(cards[i])
					cards[i].destroy();

			for(var i =1; i<=gameStage*gameStage; i++){
				var tempRect = new Kinetic.Rect({
					x : $('#canvasOne').width()/2 - 25 * (gameStage),
					y : $('#canvasOne').height()/2 - 20 * (gameStage),
					width: 50,
					height: 50,
					fill: '#E26533',
					stroke: '#B19691',
					strokeWidth: 2,
					id : 'x',
				});
				
				cards[i] = tempRect;
				if(i>1){
					cards[i].setAttr('x', cards[i-1].getAttr('x')+50)
					cards[i].setAttr('y',cards[i-1].getAttr('y'))
					for(j=1; j<gameStage; j++){
						if(i==(gameStage*j)+1){
							cards[i].setAttr('x', cards[i-1].getAttr('x')-50*(gameStage-1))
							cards[i].setAttr('y',cards[i-1].getAttr('y')+50)
						}
					} 
				}
			
				cards[i].on('mouseover',function(){
					 document.body.style.cursor = "pointer";
				})
				cards[i].on('mouseout',function(){
					 document.body.style.cursor = "default";
				})
				gameLayer.add(cards[i]);
			}
			
			// 현재 게임 스테이지 숫자 만큼 숨기는 랜덤카드 생성  
			var randNum = shuffleRandom(gameStage*gameStage);
			for (var i=0; i<gameStage;i++){
				cards[randNum[i]].setId('o');
			}
			
			
			for (var m=1; m<=gameStage*gameStage;m++){
				
				if(cards[m].getId() == 'o'){
					cards[m].setAttr('fill','black');
					isPreview = true;
				}
				cards[m].on('click',function(e){
					if(!isPreview){
					clickNum++;
					console.log(e.target.getId())
					if (e.target.getId() == 'R'){
						correctText.setAttr('text','이미 선택한 카드입니다.');
						clickNum--;
						gameLayer.draw();
					}
					else if(e.target.getId() == 'x'){
						 correctText.setAttr('text','틀렸습니다.');
						 e.target.setAttr('fill','red');
						 gameLayer	.draw();
					}
					else if(e.target.getId() == 'o'){
						correctNum ++;
						correctText.setAttr('text','정답입니다.');
						
						e.target.setAttr('fill','black')
						gameLayer.draw();

						e.target.setId('R');
						score+=20*(1.0+gameStage*0.5)/40;
						scores.setAttr('text',"남은 횟수 : "+ (7-playNum) + "  점수 : " + score.toFixed(2));
						gameLayer.draw();
						if(correctNum== gameStage){
							correctNum =0;
							clickNum=0;
							startStage(gameStage+1);
						}
						setInterval(correctTestInit, 800);
					}
					
					if(clickNum == gameStage){
						clickNum=0;
						correctNum =0;
						for (var q=1; q<=gameStage*gameStage;q++){
							if(cards[q].getId() == 'o'){
								cards[q].setAttr('fill','black');
								isPreview = true;
							}
						}
						
						unclickCardID = setInterval(goPrevStage, 1000);
						
						function goPrevStage(){
							console.log('gamestage' + gameStage)
							if(gameStage == 2)
						 		startStage(2);
					 			
						 	else if(gameStage>2)
								startStage(gameStage-1);
							
							isPreview=false;
							clearInterval(unclickCardID);
					}
					}
				}
				})
			}			
			
			stage.draw();
		}
		
		function endGame(){
			console.log('game end');
			startLayer.hide();
			gameLayer.hide();
			gameEndLayer.show();
			
			
			var endBtnImage = new Image();
			endBtnImage.src = './image/concentrationtest/save.png';
			
			var endBtn = new Kinetic.Image({
				x : $('#canvasOne').width() / 4 + 90,
			    y: 300,
			    image: endBtnImage,
			  });
			
			var endText = new Kinetic.Text({
				x : $('#canvasOne').width() / 4 +30,
				y : 190,
				text : '게임이 끝났습니다. 당신의 점수는 ',
				fontSize : '20',
				fontFamily : 'Helvtica',
				fill : 'black',
				align : 'center'
			})
			
			var endScore= new Kinetic.Text({
				x : $('#canvasOne').width() / 4 + 160,
				y : 240,
				text :  score.toFixed(2),
				fontSize : '40',
				fontFamily : 'Helvtica',
				fill : 'black',
				align : 'center'
			})
			
			gameEndLayer.add(endScore);
			gameEndLayer.add(endBtn);
			gameEndLayer.add(endText);
			gameEndLayer.draw();
			
			stage.draw();
			
			/****** MKMK - DB 저장 부분 *******/
			endBtn.on('click' , function(){
				console.log('heello' + score.toFixed(2))
				location.href = "insertgamedb.do?gameNum=2&score="+score.toFixed(2);
			})
		}
		
		
	}
	
	function shuffleRandom(n){
        var ar = new Array();
        var temp;
        var rnum;

        for(var i=1; i<=n; i++){
            ar.push(i);
        }

        for(var i=0; i< ar.length ; i++)
        {
            rnum = Math.floor(Math.random() *n);
            temp = ar[i];
            ar[i] = ar[rnum];
            ar[rnum] = temp;
        }

        return ar;
}

	/* 남은 시간을 감소시키는 함수 */
	function decrementCardTime() {
		
		if(cardTime > 0) cardTime--;
		else { 
			for(var i=0; i<200; i++)
				if(cards[i])
					if(cards[i].getAttr('id')=='o'){
						cards[i].setAttr('fill', '#E26533');
						gameLayer.draw();
						isPreview = false;
					}
			clearInterval(cardTimerID);
			cardTime =5;

			// 시간이 만료되고 나서 할 작업을 여기에 작성
			
		}
	}
	
	function correctTestInit(){
		correctText.setAttr('text', "");
		stage.draw();
	}
	


})
