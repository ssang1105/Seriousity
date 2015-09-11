package controller;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoException;

@Controller
public class DatabaseController {
	
	@RequestMapping("/hello.do")
	public ModelAndView hello(HttpServletRequest request, HttpServletResponse response) throws Exception{

		System.out.println("hello.jsp (controller)");
		ModelAndView mav = new ModelAndView("start");
		
		HttpSession session = request.getSession(true);
		
		String email = (String)session.getAttribute("email");
		
		ArrayList scoreList = new ArrayList();
		ArrayList m_gameList1 = new ArrayList();
		ArrayList m_gameList2 = new ArrayList();
		ArrayList m_gameList3 = new ArrayList();
		ArrayList m_gameList4 = new ArrayList();
		ArrayList m_gameList5 = new ArrayList();
		
		ArrayList t_gameList1 = new ArrayList();
		ArrayList t_gameList2 = new ArrayList();
		ArrayList t_gameList3 = new ArrayList();
		ArrayList t_gameList4 = new ArrayList();
		ArrayList t_gameList5 = new ArrayList();
		
		ArrayList trainList= new ArrayList();
		
		try {			    		
	    		Mongo mongo = new Mongo("localhost",27017);
	    		
	    		DB db = mongo.getDB("test");
	    		
	    		DBCollection collection = db.getCollection("score");
	    		
	    		BasicDBObject query = new BasicDBObject();
	    		BasicDBObject query1 = new BasicDBObject();	
	    		BasicDBObject query2 = new BasicDBObject();	
	    		BasicDBObject query3 = new BasicDBObject();	
	    		BasicDBObject query4 = new BasicDBObject();	
	    		BasicDBObject query5 = new BasicDBObject();	
	    		
	    		BasicDBObject query6 = new BasicDBObject();	
	    		BasicDBObject query7 = new BasicDBObject();	
	    		BasicDBObject query8 = new BasicDBObject();	
	    		BasicDBObject query9 = new BasicDBObject();	
	    		BasicDBObject query0 = new BasicDBObject();
	    		
	    		query.put("email",email);
	    		
	    		query1.put("gameNum","1");
	    		query1.put("email",email);
	    		query2.put("gameNum","2");
	    		query2.put("email",email);
	    		query3.put("gameNum","3");
	    		query3.put("email",email);
	    		query4.put("gameNum","4");
	    		query4.put("email",email);
	    		query5.put("gameNum","5");
	    		query5.put("email",email);
	    		
	    		query6.put("gameNum","1");	    	
	    		query7.put("gameNum","2");
	    		query8.put("gameNum","3");
	    		query9.put("gameNum","4");
	    		query0.put("gameNum","5");
	    		
	    		
	    		DBCursor cur = collection.find(query);
	    		DBCursor cur1 = collection.find(query1);
	    		DBCursor cur2 = collection.find(query2);
	    		DBCursor cur3 = collection.find(query3);
	    		DBCursor cur4 = collection.find(query4);
	    		DBCursor cur5 = collection.find(query5);
	    		
	    		DBCursor cur6 = collection.find(query6);
	    		DBCursor cur7 = collection.find(query7);
	    		DBCursor cur8 = collection.find(query8);
	    		DBCursor cur9 = collection.find(query9);
	    		DBCursor cur0 = collection.find(query0);
	    		
	    		BasicDBObject query_train = new BasicDBObject();
				
				query_train.put("email",email);
				
				DBCursor cur_train = collection.find(query_train);
				
	    		while(cur_train.hasNext()){
	    			Object yn = cur_train.next().get("day");
	    			trainList.add(yn);
	    			System.out.println("##########"+yn);
	    		}
	    		
	    		while(cur.hasNext()){
	    			Object yn = cur.next().get("score");
	    			scoreList.add(yn);
	    			System.out.println(yn);
	    		}
	    		while(cur1.hasNext()){
	    			Object yn = cur1.next().get("score");
	    			m_gameList1.add(yn);
	    			System.out.println(yn);
	    		}while(cur2.hasNext()){
	    			Object yn = cur2.next().get("score");
	    			m_gameList2.add(yn);
	    			System.out.println(yn);
	    		}while(cur3.hasNext()){
	    			Object yn = cur3.next().get("score");
	    			m_gameList3.add(yn);
	    			System.out.println(yn);
	    		}while(cur4.hasNext()){
	    			Object yn = cur4.next().get("score");
	    			m_gameList4.add(yn);
	    			System.out.println(yn);
	    		}while(cur5.hasNext()){
	    			Object yn = cur5.next().get("score");
	    			m_gameList5.add(yn);
	    			System.out.println(yn);
	    		}
	    		
	    		while(cur6.hasNext()){
	    			Object yn = cur6.next().get("score");
	    			t_gameList1.add(yn);
	    			System.out.println(yn);
	    		}while(cur7.hasNext()){
	    			Object yn = cur7.next().get("score");
	    			t_gameList2.add(yn);
	    			System.out.println(yn);
	    		}while(cur8.hasNext()){
	    			Object yn = cur8.next().get("score");
	    			t_gameList3.add(yn);
	    			System.out.println(yn);
	    		}while(cur9.hasNext()){
	    			Object yn = cur9.next().get("score");
	    			t_gameList4.add(yn);
	    			System.out.println(yn);
	    		}while(cur0.hasNext()){
	    			Object yn = cur0.next().get("score");
	    			t_gameList5.add(yn);
	    			System.out.println(yn);
	    		}
	    		mav.addObject("scoreList",scoreList);
	    		mav.addObject("m_gameList1",m_gameList1);
	    		mav.addObject("m_gameList2",m_gameList2);
	    		mav.addObject("m_gameList3",m_gameList3);
	    		mav.addObject("m_gameList4",m_gameList4);
	    		mav.addObject("m_gameList5",m_gameList5);
	    		
	    		mav.addObject("t_gameList1",t_gameList1);
	    		mav.addObject("t_gameList2",t_gameList2);
	    		mav.addObject("t_gameList3",t_gameList3);
	    		mav.addObject("t_gameList4",t_gameList4);
	    		mav.addObject("t_gameList5",t_gameList5);
	    		
	    		mav.addObject("trainList",trainList);
	    		
	    		mav.addObject("mainUrl","game/hello.jsp");
	    		
	        	return mav;
		    		
	    	} catch (UnknownHostException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    		
	    	} catch (MongoException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    	
	    	}
	}

	@RequestMapping("/joinfinish.do")
	public ModelAndView gojoinfinish(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView("start");
		System.out.println("joinfinished.jsp(controller)");
		
		String fname = (String)request.getParameter("fname");
		String email = (String)request.getParameter("email");
		String gender = (String)request.getParameter("gender");
		String passwd = (String)request.getParameter("passwd");	
		
		
		System.out.println(gender);
		
		try {
		    		
		    		// connect to mongoDB, ip and port number
		    		Mongo mongo = new Mongo("localhost",27017);
		    		
		    		// get database from MongoDB,
		    		// if database doesn't exists, mongoDb will create  it automatically
		    		DB db = mongo.getDB("test");
		    		
		    		// Get collection from MongoDB, database named "test"
		    		// if collection doesn't exists, mongoDB will create it automatically
		    		DBCollection collection = db.getCollection("member");
		    		
		    		// create a document to store key and value
		    		BasicDBObject document = new BasicDBObject();
		    		document.put("fname",fname);
		    		document.put("email", email);
		    		document.put("gender", gender);
		    		document.put("passwd", passwd);
		    		
		    		
		    		// save it into collection named "jeongukCollection"
		    		collection.insert(document);
		    		
		      		mav.addObject("mainUrl","member/joinfinish.jsp");
		        	return mav;
		    		
	    	} catch (UnknownHostException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    		
	    	} catch (MongoException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    	
	    	}
	}
	
	@RequestMapping("/gologin.do")
	public ModelAndView gologin(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		
			System.out.println("gologin.jsp(controller)");		
	
			ModelAndView mav = new ModelAndView("start");
			
			HttpSession session = request.getSession(true);
			
			ArrayList scoreList = new ArrayList();
			ArrayList m_gameList1 = new ArrayList();
			ArrayList m_gameList2 = new ArrayList();
			ArrayList m_gameList3 = new ArrayList();
			ArrayList m_gameList4 = new ArrayList();
			ArrayList m_gameList5 = new ArrayList();
			
			ArrayList t_gameList1 = new ArrayList();
			ArrayList t_gameList2 = new ArrayList();
			ArrayList t_gameList3 = new ArrayList();
			ArrayList t_gameList4 = new ArrayList();
			ArrayList t_gameList5 = new ArrayList();
			
			ArrayList trainList = new ArrayList();
			
		try {	
			
				String email = (String)request.getParameter("email");
				String passwd = (String)request.getParameter("passwd");
			
				System.out.println("email : " +email);
				System.out.println("passwd : " +passwd);
				
				Mongo mongo = new Mongo("localhost",27017);
				
				DB db = mongo.getDB("test");
				
				DBCollection collection1 = db.getCollection("member");
				DBCollection collection = db.getCollection("score");
						
				BasicDBObject queryl = new BasicDBObject();
				
				queryl.put("email",email);
				queryl.put("passwd", passwd);
	
				DBCursor curl = collection1.find(queryl);
				
				int Yn = 0;
				
				while(curl.hasNext()){
					DBObject yn = curl.next();
	
					if(yn != null)
					{
						Yn = 1;
					}
				}
			
		
				if( Yn == 0)
				{
					mav.addObject("mainUrl","member/logindenied.jsp");
					session.setAttribute("loginYn","N");
				}
				else if( Yn == 1)
				{
					mav.addObject("mainUrl","game/hello.jsp");
					session.setAttribute("loginYn","Y");
					session.setAttribute("email", email);
				}
			    		
	    		
	    		BasicDBObject query = new BasicDBObject();
	    		BasicDBObject query1 = new BasicDBObject();	
	    		BasicDBObject query2 = new BasicDBObject();	
	    		BasicDBObject query3 = new BasicDBObject();	
	    		BasicDBObject query4 = new BasicDBObject();	
	    		BasicDBObject query5 = new BasicDBObject();	
	    		
	    		BasicDBObject query6 = new BasicDBObject();	
	    		BasicDBObject query7 = new BasicDBObject();	
	    		BasicDBObject query8 = new BasicDBObject();	
	    		BasicDBObject query9 = new BasicDBObject();	
	    		BasicDBObject query0 = new BasicDBObject();
	    		
	    		query.put("email",email);
	    		
	    		query1.put("gameNum","1");
	    		query1.put("email",email);
	    		query2.put("gameNum","2");
	    		query2.put("email",email);
	    		query3.put("gameNum","3");
	    		query3.put("email",email);
	    		query4.put("gameNum","4");
	    		query4.put("email",email);
	    		query5.put("gameNum","5");
	    		query5.put("email",email);
	    		
	    		query6.put("gameNum","1");	    	
	    		query7.put("gameNum","2");
	    		query8.put("gameNum","3");
	    		query9.put("gameNum","4");
	    		query0.put("gameNum","5");
	    		
	    		
	    		DBCursor cur = collection.find(query);
	    		DBCursor cur1 = collection.find(query1);
	    		DBCursor cur2 = collection.find(query2);
	    		DBCursor cur3 = collection.find(query3);
	    		DBCursor cur4 = collection.find(query4);
	    		DBCursor cur5 = collection.find(query5);
	    		
	    		DBCursor cur6 = collection.find(query6);
	    		DBCursor cur7 = collection.find(query7);
	    		DBCursor cur8 = collection.find(query8);
	    		DBCursor cur9 = collection.find(query9);
	    		DBCursor cur0 = collection.find(query0);				
						
				BasicDBObject query_train = new BasicDBObject();
				
				query_train.put("email",email);
				
				DBCursor cur_train = collection.find(query_train);
				
	    		while(cur_train.hasNext()){
	    			Object yn = cur_train.next().get("day");
	    			trainList.add(yn);
	    			System.out.println("##########"+yn);
	    		}	    
	    		
	    		while(cur.hasNext()){
	    			Object yn = cur.next().get("score");
	    			scoreList.add(yn);
	    			System.out.println(yn);
	    		}
	    		while(cur1.hasNext()){
	    			Object yn = cur1.next().get("score");
	    			m_gameList1.add(yn);
	    			System.out.println(yn);
	    		}while(cur2.hasNext()){
	    			Object yn = cur2.next().get("score");
	    			m_gameList2.add(yn);
	    			System.out.println(yn);
	    		}while(cur3.hasNext()){
	    			Object yn = cur3.next().get("score");
	    			m_gameList3.add(yn);
	    			System.out.println(yn);
	    		}while(cur4.hasNext()){
	    			Object yn = cur4.next().get("score");
	    			m_gameList4.add(yn);
	    			System.out.println(yn);
	    		}while(cur5.hasNext()){
	    			Object yn = cur5.next().get("score");
	    			m_gameList5.add(yn);
	    			System.out.println(yn);
	    		}
	    		
	    		while(cur6.hasNext()){
	    			Object yn = cur6.next().get("score");
	    			t_gameList1.add(yn);
	    			System.out.println(yn);
	    		}while(cur7.hasNext()){
	    			Object yn = cur7.next().get("score");
	    			t_gameList2.add(yn);
	    			System.out.println(yn);
	    		}while(cur8.hasNext()){
	    			Object yn = cur8.next().get("score");
	    			t_gameList3.add(yn);
	    			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+yn);
	    		}while(cur9.hasNext()){
	    			Object yn = cur9.next().get("score");
	    			t_gameList4.add(yn);
	    			System.out.println(yn);
	    		}while(cur0.hasNext()){
	    			Object yn = cur0.next().get("score");
	    			t_gameList5.add(yn);
	    			System.out.println(yn);
	    		}
	    		mav.addObject("scoreList",scoreList);
	    		mav.addObject("m_gameList1",m_gameList1);
	    		mav.addObject("m_gameList2",m_gameList2);
	    		mav.addObject("m_gameList3",m_gameList3);
	    		mav.addObject("m_gameList4",m_gameList4);
	    		mav.addObject("m_gameList5",m_gameList5);
	    		
	    		mav.addObject("t_gameList1",t_gameList1);
	    		mav.addObject("t_gameList2",t_gameList2);
	    		mav.addObject("t_gameList3",t_gameList3);
	    		mav.addObject("t_gameList4",t_gameList4);
	    		mav.addObject("t_gameList5",t_gameList5);
	    		
	    		mav.addObject("trainList",trainList);
	    		
	    		mav.addObject("mainUrl","game/hello.jsp");
	    		
	        	return mav;
		    		
	    	} catch (UnknownHostException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    		
	    	} catch (MongoException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    	
	    	}
		
	}	
	
	@RequestMapping("/loadbyday.do")
	public ModelAndView loadbyday(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView("game/loadbyday");
		System.out.println("loadbyday.jsp(controller)");
	
		HttpSession session = request.getSession(true);
		String email = (String)session.getAttribute("email");
		String day = (String)request.getParameter("day");
		
		ArrayList dayList = new ArrayList();
		
	
		try {	
			
				
				
				System.out.println("email : " +email);
				System.out.println("day : " +day);
			
				Mongo mongo = new Mongo("localhost",27017);
				
				DB db = mongo.getDB("test");
				
				DBCollection collection = db.getCollection("score");
						
				BasicDBObject query = new BasicDBObject();
				
				query.put("email",email);
				query.put("day",day);
				
				DBCursor cur = collection.find(query);
				
				int Yn = 0;
			
	    		while(cur.hasNext()){
	    			Object yn = cur.next().get("gameNum");
	    			dayList.add(yn);
	    			System.out.println(yn);
	    		}	    
	    	
	    		mav.addObject("dayList",dayList);    	    		
	    		
	        	return mav;
		    		
	    	} catch (UnknownHostException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    		
	    	} catch (MongoException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    	
	    	}
		}	
	@RequestMapping("/insertgamedb.do")
	public ModelAndView goinsertgamedb(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView("start");
		System.out.println("insertgamedb.jsp(controller)");
		
		HttpSession session = request.getSession(true);
		String email = (String)session.getAttribute("email");			
		String gameNum = (String)request.getParameter("gameNum");
		String score = (String)request.getParameter("score");
		
		Calendar oCalendar = Calendar.getInstance( );
		final String[] week = { "sun", "mon", "tue", "wed", "thr", "fri", "sat" };
		System.out.println("현재 요일: " + week[oCalendar.get(Calendar.DAY_OF_WEEK) - 1] + "요일");
		String day = week[oCalendar.get(Calendar.DAY_OF_WEEK) - 1];
				
		try {
		    		
		    		// connect to mongoDB, ip and port number
		    		Mongo mongo = new Mongo("localhost",27017);
		    		
		    		// get database from MongoDB,
		    		// if database doesn't exists, mongoDb will create  it automatically
		    		DB db = mongo.getDB("test");
		    		
		    		// Get collection from MongoDB, database named "test"
		    		// if collection doesn't exists, mongoDB will create it automatically
		    		DBCollection collection = db.getCollection("score");
		    		
		    		// create a document to store key and value
		    		BasicDBObject document = new BasicDBObject();
		    		document.put("email", email);
		    		document.put("score", score);
		    		document.put("gameNum", gameNum);
		    		document.put("day",day);
		    		
		    		// save it into collection named "jeongukCollection"
		    		collection.insert(document);
		    		
		      		mav.addObject("mainUrl","game/game.jsp");
		        	return mav;
		    		
	    	} catch (UnknownHostException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    		
	    	} catch (MongoException e) {
	    		e.printStackTrace();
	    		mav.addObject("mainUrl","errorpage.jsp");
	    		return mav;
	    	
	    	}
		}
		@RequestMapping("/brainprofile.do")
		public ModelAndView brainprofile(HttpServletRequest request, HttpServletResponse response) throws Exception{
			System.out.println("brainprofile.jsp(controller)");
			ModelAndView mav = new ModelAndView("start");
			
			HttpSession session = request.getSession(true);
			
			String email = (String)session.getAttribute("email");
			
			ArrayList scoreList = new ArrayList();
			ArrayList m_gameList1 = new ArrayList();
			ArrayList m_gameList2 = new ArrayList();
			ArrayList m_gameList3 = new ArrayList();
			ArrayList m_gameList4 = new ArrayList();
			ArrayList m_gameList5 = new ArrayList();
			
			ArrayList t_gameList1 = new ArrayList();
			ArrayList t_gameList2 = new ArrayList();
			ArrayList t_gameList3 = new ArrayList();
			ArrayList t_gameList4 = new ArrayList();
			ArrayList t_gameList5 = new ArrayList();
			
			try {			    		
		    		Mongo mongo = new Mongo("localhost",27017);
		    		
		    		DB db = mongo.getDB("test");
		    		
		    		DBCollection collection = db.getCollection("score");
		    		
		    		BasicDBObject query = new BasicDBObject();
		    		BasicDBObject query1 = new BasicDBObject();	
		    		BasicDBObject query2 = new BasicDBObject();	
		    		BasicDBObject query3 = new BasicDBObject();	
		    		BasicDBObject query4 = new BasicDBObject();	
		    		BasicDBObject query5 = new BasicDBObject();	
		    		
		    		BasicDBObject query6 = new BasicDBObject();	
		    		BasicDBObject query7 = new BasicDBObject();	
		    		BasicDBObject query8 = new BasicDBObject();	
		    		BasicDBObject query9 = new BasicDBObject();	
		    		BasicDBObject query0 = new BasicDBObject();
		    		
		    		query.put("email",email);
		    		
		    		query1.put("gameNum","1");
		    		query1.put("email",email);
		    		query2.put("gameNum","2");
		    		query2.put("email",email);
		    		query3.put("gameNum","3");
		    		query3.put("email",email);
		    		query4.put("gameNum","4");
		    		query4.put("email",email);
		    		query5.put("gameNum","5");
		    		query5.put("email",email);
		    		
		    		query6.put("gameNum","1");	    	
		    		query7.put("gameNum","2");
		    		query8.put("gameNum","3");
		    		query9.put("gameNum","4");
		    		query0.put("gameNum","5");
		    		
		    		
		    		DBCursor cur = collection.find(query);
		    		DBCursor cur1 = collection.find(query1);
		    		DBCursor cur2 = collection.find(query2);
		    		DBCursor cur3 = collection.find(query3);
		    		DBCursor cur4 = collection.find(query4);
		    		DBCursor cur5 = collection.find(query5);
		    		
		    		DBCursor cur6 = collection.find(query6);
		    		DBCursor cur7 = collection.find(query7);
		    		DBCursor cur8 = collection.find(query8);
		    		DBCursor cur9 = collection.find(query9);
		    		DBCursor cur0 = collection.find(query0);
		    		
		    		
		    		while(cur.hasNext()){
		    			Object yn = cur.next().get("score");
		    			scoreList.add(yn);
		    			System.out.println(yn);
		    		}
		    		while(cur1.hasNext()){
		    			Object yn = cur1.next().get("score");
		    			m_gameList1.add(yn);
		    			System.out.println(yn);
		    		}while(cur2.hasNext()){
		    			Object yn = cur2.next().get("score");
		    			m_gameList2.add(yn);
		    			System.out.println(yn);
		    		}while(cur3.hasNext()){
		    			Object yn = cur3.next().get("score");
		    			m_gameList3.add(yn);
		    			System.out.println(yn);
		    		}while(cur4.hasNext()){
		    			Object yn = cur4.next().get("score");
		    			m_gameList4.add(yn);
		    			System.out.println(yn);
		    		}while(cur5.hasNext()){
		    			Object yn = cur5.next().get("score");
		    			m_gameList5.add(yn);
		    			System.out.println(yn);
		    		}
		    		
		    		while(cur6.hasNext()){
		    			Object yn = cur6.next().get("score");
		    			t_gameList1.add(yn);
		    			System.out.println(yn);
		    		}while(cur7.hasNext()){
		    			Object yn = cur7.next().get("score");
		    			t_gameList2.add(yn);
		    			System.out.println(yn);
		    		}while(cur8.hasNext()){
		    			Object yn = cur8.next().get("score");
		    			t_gameList3.add(yn);
		    			System.out.println(yn);
		    		}while(cur9.hasNext()){
		    			Object yn = cur9.next().get("score");
		    			t_gameList4.add(yn);
		    			System.out.println(yn);
		    		}while(cur0.hasNext()){
		    			Object yn = cur0.next().get("score");
		    			t_gameList5.add(yn);
		    			System.out.println(yn);
		    		}
		    		mav.addObject("scoreList",scoreList);
		    		mav.addObject("m_gameList1",m_gameList1);
		    		mav.addObject("m_gameList2",m_gameList2);
		    		mav.addObject("m_gameList3",m_gameList3);
		    		mav.addObject("m_gameList4",m_gameList4);
		    		mav.addObject("m_gameList5",m_gameList5);
		    		
		    		mav.addObject("t_gameList1",t_gameList1);
		    		mav.addObject("t_gameList2",t_gameList2);
		    		mav.addObject("t_gameList3",t_gameList3);
		    		mav.addObject("t_gameList4",t_gameList4);
		    		mav.addObject("t_gameList5",t_gameList5);

					mav.addObject("mainUrl","game/brainprofile.jsp");
		        	return mav;
			    		
		    	} catch (UnknownHostException e) {
		    		e.printStackTrace();
		    		mav.addObject("mainUrl","errorpage.jsp");
		    		return mav;
		    		
		    	} catch (MongoException e) {
		    		e.printStackTrace();
		    		mav.addObject("mainUrl","errorpage.jsp");
		    		return mav;
		    	
		    	}
		}
		@RequestMapping("/mypage.do")
		public ModelAndView gomypage(HttpServletRequest request, HttpServletResponse response) throws Exception{
			System.out.println("mypage.jsp(controller)");
			
			HttpSession session = request.getSession(true);	
			session.getAttribute("email");
			
			
			
			ModelAndView mav = new ModelAndView("start");
			mav.addObject("mainUrl","member/mypage.jsp");
	
			return mav;
		}
		
		@RequestMapping("/gamedetail.do")
		public ModelAndView gogamevisualization(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			ModelAndView mav = new ModelAndView("start");
			System.out.println("gamevisualization.jsp(controller)");
			
			HttpSession session = request.getSession(true);
			String gamename = (String)request.getParameter("gamename");
			String email = (String)session.getAttribute("email");
			ArrayList scoreList = new ArrayList();
			ArrayList averageList = new ArrayList();
			String gameNum="";
			
			if(gamename.equals("cardmatch"))
			{
				gameNum = "1";
			}else if(gamename.equals("memorytest"))
			{
				gameNum = "2";
			}else if(gamename.equals("concentrationtest"))
			{
				gameNum = "3";
			}else if(gamename.equals("mathtest"))
			{
				gameNum = "4";
			}
			//have to adjust gamename!!!
			
			try {			    		
		    		Mongo mongo = new Mongo("localhost",27017);
		    		
		    		DB db = mongo.getDB("test");
		    		
		    		DBCollection collection = db.getCollection("score");
		    	
		    		/*DBObject myDoc = collection.findOne();
		    		System.out.println(myDoc);*/
		    		BasicDBObject query = new BasicDBObject();		    		
		    		BasicDBObject query2 = new BasicDBObject();
		    		
		    		query.put("gameNum",gameNum);
		    		query.put("email",email);
		    		query2.put("gameNum",gameNum);
		    		
		    		DBCursor cur = collection.find(query);
		    		DBCursor cur2 = collection.find(query2);
		    		
		    		while(cur.hasNext()){
		    			Object yn = cur.next().get("score");
		    			scoreList.add(yn);
		    			System.out.println(yn);
		    		}
		    		
		    		while(cur2.hasNext()){
		    			Object yn = cur2.next().get("score");
		    			averageList.add(yn);
		    			System.out.println("~"+yn);
		    		}
		    				    		
		    		mav.addObject("scoreList",scoreList);
		    		mav.addObject("averageList",averageList);
		    		mav.addObject("mainUrl","game/gamedetail.jsp");
		        	return mav;
			    		
		    	} catch (UnknownHostException e) {
		    		e.printStackTrace();
		    		mav.addObject("mainUrl","errorpage.jsp");
		    		return mav;
		    		
		    	} catch (MongoException e) {
		    		e.printStackTrace();
		    		mav.addObject("mainUrl","errorpage.jsp");
		    		return mav;
		    	
		    	}
		}
	}
