package ju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	@RequestMapping("/index.ju")
	public ModelAndView index(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("introindex.ju")
	public ModelAndView introindex(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("introindex");
		return mav;
	}
	
	@RequestMapping("/helpindex.ju")
	public ModelAndView helpindex(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("helpindex");
		return mav;
	}
	

}
