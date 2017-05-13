package finalp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping("/home.do")
	public ModelAndView goIndex(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		
		return mav;
	}
}
