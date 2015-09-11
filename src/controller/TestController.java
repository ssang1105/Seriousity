package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class TestController {
		
	@RequestMapping("/game.do")
	public ModelAndView game(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("game.jsp(controller)");
		ModelAndView mav = new ModelAndView("start");
		mav.addObject("mainUrl","game/game.jsp");

		return mav;
	}
	@RequestMapping("/gogame.do")
	public ModelAndView gogame(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("gamepage.jsp(controller)");
		
		String gamenum = (String)request.getParameter("gamenum");
		ModelAndView mav = new ModelAndView("start");
		mav.addObject("mainUrl","game/gamepage"+gamenum+".jsp");

		return mav;
	}
	
	@RequestMapping("/convertscore.do") 	
	public ModelAndView convertscore(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("convertscore.jsp(controller)");
		ModelAndView mav = new ModelAndView("start");
		String id = (String)request.getParameter("id");
		String score = (String)request.getParameter("score");
		
		System.out.println("id ? "+ id);
		System.out.println("score ? "+ score);
		
		mav.addObject("id",id);
		mav.addObject("score",score);
		mav.addObject("mainUrl","game/result.jsp");
		
		return mav;
	}
	
	@RequestMapping("/join.do")
	public ModelAndView gojoin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("join.jsp(controller)");
		
		ModelAndView mav = new ModelAndView("start");
		mav.addObject("mainUrl","member/join.jsp");

		return mav;
	}
	
	@RequestMapping("/login.do")
	public ModelAndView gologin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("login.jsp(controller)");
				
		ModelAndView mav = new ModelAndView("start");
		mav.addObject("mainUrl","member/login.jsp");

		return mav;
	}
		
	
	@RequestMapping("/logout.do")
	public ModelAndView gologout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("logout.jsp(controller)");
		
		HttpSession session = request.getSession(true);
		session.setAttribute("loginYn", "N");
		session.setAttribute("email", null);
		
		ModelAndView mav = new ModelAndView("default");
		//mav.addObject("mainUrl","game/hello.jsp");

		return mav;
	}
	
	
	
	
}



