package ju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index.ju")
	public String toIndex() {

		return "index";

	}

	@RequestMapping("/myCard2.ju")
	public String toMycard2() {

		return "member/myCard2";

	}

}