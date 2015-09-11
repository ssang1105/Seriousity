<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%
	int cnt_game[]={0,0,0,0};
	
 	ArrayList dayList = (ArrayList)request.getAttribute("dayList");	
	for(int i = 0 ; i<dayList.size() ; i++){
		if(dayList.get(i).equals("1")){
			cnt_game[0]++;
		}else if(dayList.get(i).equals("2")){
			cnt_game[1]++;
		}else if(dayList.get(i).equals("3")){
			cnt_game[2]++;
		}else if(dayList.get(i).equals("4")){
			cnt_game[3]++;
		}	
	}
	
	int max = cnt_game[0];
	int min = cnt_game[3];
    int max_state=0;
    int min_state=0;
    String max_game="";
    String min_game="";
    
    for(int i=1 ; i<cnt_game.length ; i++){
        if(cnt_game[i] >= max){
            max = cnt_game[i];
            max_state=i;
        }
     }
    for(int i=1 ;i<cnt_game.length;i++){
    	if(cnt_game[i] <= min)
        {
        	min = cnt_game[i];
        	min_state=i;
        }
    }    	
    System.out.println("max_state ? : " +max_state);
    System.out.println("min_state ? : " +min_state);
    
    switch(max_state)
    {
    	case 0:
    		max_game="Card Match Game";
    		break;
    	case 1:
    		max_game="Memory Game";
    		break;
    	case 2:
    		max_game="Concentration Game";
    		break;
    	case 3:
    		max_game="Calculation Game";
    		break;
    	default:
    		break;    		
    }
    
    switch(min_state)
    {
    	case 0:
    		min_game="Card Match Game";
    		break;
    	case 1:
    		min_game="Memory Game";
    		break;
    	case 2:
    		min_game="Concentration Game";
    		break;
    	case 3:
    		min_game="Calculation Game";
    		break;
       	default:
    		break;    		
    }
    
 %>
<html>
	<body>		
<% 
	if(session.getAttribute("email")!=null)
	{	
%>	
		가장 많이 플레이 한 게임은 <font>' <%=max_game%> '<font>입니다.<br>
		 <font>' <%=min_game%> '<font> 을 더 플레이할 것을 권장합니다.
<% 
	}else{		
%>		
		로그인 후 이용가능합니다.
<% 
	}
%>	
	</body>	
</html>	