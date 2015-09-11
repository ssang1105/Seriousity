var level = 1;
var level_speed = 6;
var level_makeStar = 1000;
var level_num = 11;
var score = 0;
var starGroup = [];
var correctNum = 0;
var life = 3;
var lifes = [];
var makeRandomID;

window.onkeydown = function(e) { 
    return !(e.keyCode == 32);
};

$(document).on("keydown", function (e) {
    if (e.which === 8 && !$(e.target).is("input, textarea")) {
        e.preventDefault();
    }
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 110, 190]) !== -1 ||
         // Allow: Ctrl+A
        (e.keyCode == 65 && e.ctrlKey === true) || 
         // Allow: home, end, left, right
        (e.keyCode >= 35 && e.keyCode <= 39)) {
             // let it happen, don't do anything
             return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
    
});

$(document).ready(function(){
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
		fill : "#232325",
		storke : 'black'
	});
	bgLayer.add(stageBg);
	
	
	/********* 	Game Start Menu		*******/
	
	var gameNameText = new Kinetic.Text({
		x : $('#canvasOne').width() / 3.3,
		y : 100,
		text : 'Calculation Test',
		fontSize : '40',
		fontFamily : 'Helvtica',
		fill : '#FBFB3D',
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
		text : '본 테스트는 계산 능력을 테스트하는 것으로, \n왼쪽에서 오른쪽으로 지나가는 별 속의 연산\n'
			+'절대값으로 계산하여 입력하면 됩니다.\n'
			+'(% 연산의 경우 연산값의 나머지를 구하여야 합니다.)',
		fontSize : '28',
		fontFamily : 'Helvtica',
		fill : '#FBFB3D',
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
		startLayer.hide();
		descriptionLayer.show();
		stage.draw();
	}
	
	function gameStart(){	
		makeRandomID = setInterval(makeRandomStar, level_makeStar);
		descriptionLayer.hide();
		gameLayer.show();
		
		 var typedText="";
		 var answerText = new Kinetic.Text({
			 	strokeWidth: 1,
			 	padding: 5,
				 x:20,
				 y:30,
				 fontSize:30,
				 text: "답 입력 : ",
		        fontFamily: 'Calibri',
		        fill: '#FBFB3D'
		 })
		 
		 var answer = new Kinetic.Text({
			   stroke: "#F56C05",
			   strokeWidth: 1,
			   padding: 5,
			 	drawBorder: true,
		        x: 160,
		        y: 30,
		        fontSize: 30,
		        text: "Enter your answer",
		        fontFamily: 'Calibri',
		        fill: '#F47700'
		    });
		 
		  var star = new Kinetic.Star({
	 			scaleX:0.6,
	 			scaleY:0.6,
		        x: stage.width()/2,
		        y: stage.height()/2,
		        numPoints: 5,
		        innerRadius: 50,
		        outerRadius: 70,
		        fill: '#F47700',
		        stroke: '#F56C05',
		        strokeWidth: 4,
		      });
		  
		  var scoreNum= new Kinetic.Text({
			 	strokeWidth: 1,
			 	padding: 5,
				 x:20,
				 y:stage.height()-40,
				 fontSize:30,
				 text: "점수 : " + score.toFixed(2),
		        fontFamily: 'Calibri',
		        fill: '#FBFB3D'
		 })
		  
		  var lifeImage = new Image();
		  lifeImage.src = './image/mathtest/life.png';
		  for (var i =0; i<life; i++){
				var lifeBtn = new Kinetic.Image({
					scaleX : 0.3,
					scaleY : 0.3,
					x : stage.width() -80 - (i*40),
				    y: stage.height() -50 ,
				    image: lifeImage,
				  });
				
					gameLayer.add(lifeBtn);
					gameLayer.draw();
			  
				
				lifes.push(lifeBtn);
		  }
		  
		 gameLayer.add(answer).add(answerText).add(scoreNum);
		 
		 function makeRandomStar(){
			 if (life == 0)
				 clearInterval(makeRandomID);
			 var x = makeRandom(1,level_num);
			 var y = makeRandom(1,level_num);
			 var sign = randomSign();
			 
			 
			   var group = new Kinetic.Group({
				   		correctAnswer : 0
			      });
			   
			  var star = new Kinetic.Star({
		 			scaleX:0.6,
		 			scaleY:0.6,
			        x: 0,
			        y: makeRandom(stage.height()/4,stage.height()/1.2), 
			        numPoints: 5,
			        innerRadius: 50,
			        outerRadius: 70,
			        fill: '#F47700',
			        stroke: '#F56C05',
			        strokeWidth: 10,
			      });
			  
			  var problem = new Kinetic.Text({
				  x:star.getAttr('x')-30,
				  y:star.getAttr('y')-star.getOuterRadius()/2+20,
				  text : x + "\n" + sign + "  " + y,
				  fontSize : '20',
					fontFamily : 'Helvtica',
					fill : 'white',
					align : 'right'
			  })
			  group.add(star).add(problem);
			  group.setAttr('correctAnswer', calculate(x,sign,y).toString());
			  starGroup.push(group);
			  gameLayer.add(group);
			  var tween = new Kinetic.Tween({
		          node: group, 
		          x: stage.width()+star.getInnerRadius(),
		          easing: Kinetic.Easings.Linear,
		          duration: level_speed,  
		          onFinish: function() {
		        	  console.log('fin')
	        		  var position = starGroup.indexOf(group);
	        		  starGroup.splice(position,1);
	        		  console.log(starGroup[position])
	        		  if(group.getAttr('myFlag')!='removed'){
		        		  lifes[life-1].remove();
		        		  life--;
	        		  }
	        		  gameLayer.draw();
	        		  if(life == 0){
	        			  tween.pause();
	        			  endGame();
	        		  }
		            }
		        });
			  
			  
			  
			 tween.play();
		 }
		 
		 $(document).on('keydown',(function(e){
		    	
		        var key=e.which;
		        
		        if(key == 13){
		        		for(var i=0; i<starGroup.length; i++){
		        			if(typedText == starGroup[i].getAttr('correctAnswer')){
		        				starGroup[i].remove();
		        				starGroup[i].setAttr('myFlag',"removed");
		        				score += level*0.4
		        				scoreNum.setText("점수 : " + score.toFixed(2));
		        				correctNum++;
		        				if (correctNum == 10){
		        					levelUp();
		        					correctNum=0;
		        				}
//		        				starGroup.splice(i,1);
		        				
		        			}
		        		}
		        	typedText="";
		        	answer.setText(typedText);
		        	gameLayer.drawScene();
		        	
		        	
		        	function levelUp(){
		        		console.log('levelup!!!' )
		        		level ++;
		        		switch(level){
		        			case 2 :{
		        				level_speed = 6;
		        				level_makeStar = 1000;
		        				level_num = 12;
		        				break;
		        			}
		        			case 3 :{
		        				level_speed = 6;
		        				level_makeStar = 900;
		        				level_num = 13;
		        				break;
		        			}
		        			case 4 :{
		        				level_speed = 5;
		        				level_makeStar = 800;
		        				level_num = 14;
		        				break;
		        			} 
		        			case 5 :{
		        				level_speed = 4;
		        				level_makeStar = 800;
		        				level_num = 15;
		        				break;
		        			}
		        			case 6 :{
		        				level_speed = 4;
		        				level_makeStar = 700;
		        				level_num = 16;
		        				break;
		        			}
		        			case 7 :{
		        				level_speed = 3;
		        				level_makeStar = 600;
		        				level_num = 16;
		        				break;
		        			}
		        			case 8 :{
		        				level_speed = 2;
		        				level_makeStar = 600;
		        				level_num = 17;
		        				break;
		        			}
		        			case 9 :{
		        				level_speed = 1;
		        				level_makeStar = 500;
		        				level_num = 18;
		        				break;
		        			}
		        			case 10 :{
		        				level_speed = 5;
		        				level_makeStar = 800;
		        				level_num = 19;
		        				break;
		        			}
		        				
		        		}
		        	}
		        		
		        }
		  }));
		 
		 
		 
		 gameLayer.draw();
		 
		 $(document).on('keypress',(function(e){

		        // get the key
		        key=e.which;
		        
		        // let keydown handle control keys
		        if(key<32){return;}

		        // add the typed character
		        typedText+=String.fromCharCode(e.charCode);
		        answer.setText(typedText);;
		        gameLayer.drawScene();
		    }));


		    // handle control keys like backspace
		    $(document).on('keydown',(function(e){
		    	
		        // get the key
		        var key=event.which;
		        
		        
		        // Let keypress handle displayable characters
		        if(key>46){ return; }


		        // handle the backspace 
		        // (and any other control keys you want to program)
		        switch(key){
		              case 8: //backspace:
		                if(typedText.length>0){
		                    typedText=typedText.slice(0,-1);
		                    answer.setText(typedText);;
		                    gameLayer.drawScene();
		                }
		                break;
		            default:
		                break;
		        }

		    }));
		
	}
	
	function makeRandom(min, max){
	    var RandVal = Math.random() * (max- min) + min;
	    return Math.floor(RandVal);
	}
	function randomSign(){
		var signNum = makeRandom(1,5)
		
		if(signNum == 1)
			return "+";
		else if(signNum == 2)
			return "-";
		else if(signNum == 3)
			return "X";
		else if(signNum == 4)
			return "%";
	}
	
	function calculate(x,sign,y){
		if(sign =="+")
			return Math.abs(x+y);
		else if(sign == "-")
			return Math.abs(x-y);
		else if(sign == "X")
			return Math.abs(x*y);
		else if(sign == "%")
			return Math.abs(x%y);
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
			fill : '#FBFB3D',
			align : 'center'
		})
		
		var endScore= new Kinetic.Text({
			x : $('#canvasOne').width() / 4 + 160,
			y : 240,
			text : score.toFixed(2),
			fontSize : '40',
			fontFamily : 'Helvtica',
			fill : '#FBFB3D',
			align : 'center'
		})
		
		gameEndLayer.add(endScore);
		gameEndLayer.add(endBtn);
		gameEndLayer.add(endText);
		gameEndLayer.draw();
		
		stage.draw();
		
		/****** MKMK - DB 저장 부분 *******/
		endBtn.on('click' , function(){
			location.href = "insertgamedb.do?gameNum=4&score="+score.toFixed(2);
		})
	}
	
	
});