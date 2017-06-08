package ju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping("/index.ju")
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("mainIndex.ju")
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainIndex");
		return mav;
	}
}
