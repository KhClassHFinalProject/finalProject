package ju.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
    Logger log = Logger.getLogger(this.getClass());

	
	@RequestMapping(value="/index.ju")
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView("index");
		log.debug("인터셉터 테스트");
		return mav;
	}
}
