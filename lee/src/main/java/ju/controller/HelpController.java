package ju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HelpController {

	
	//공지사항 게시판 관련 메소드
	@RequestMapping("/noticeList.ju")
	public ModelAndView noticeList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/notice/noticeList");
		return mav;
	}
	
	@RequestMapping("/noticeWrite.ju")
	public ModelAndView noticeWrite(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/notice/noticeWrite");
		return mav;
	}
	
	@RequestMapping("/noticeWriteok.ju")
	public ModelAndView noticeWriteok(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/notice/noticeWriteok");
		return mav;
	}
	
	@RequestMapping("/noticeChange.ju")
	public ModelAndView noticeChange(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/notice/noticeChange");
		return mav;
	}
	
	@RequestMapping("/noticeContent.ju")
	public ModelAndView noticeContent(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/notice/noticeContent");
		return mav;
	}
	
	@RequestMapping("/noticeDelete.ju")
	public ModelAndView noticeDelete(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/notice/noticeDelete");
		return mav;
	}
	
	
	//분실물 게시판 관련 메소드
	@RequestMapping("/missingList.ju")
	public ModelAndView missingList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/missing/missingList");
		return mav;
	}
	
	@RequestMapping("/missingWrite.ju")
	public ModelAndView missingWrite(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/missing/missingWrite");
		return mav;
	}
	
	@RequestMapping("/missingWriteok.ju")
	public ModelAndView missingWriteok(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/missing/missingWriteok");
		return mav;
	}

	
	//QnA 게시판 관련 메소드
	@RequestMapping("/questList.ju")
	public ModelAndView questList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/quest/questList");
		return mav;
	}
	
	
	//FaQ 게시판 관련 메소드
	@RequestMapping("/faqList.ju")
	public ModelAndView faqList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/faq/faqList");
		return mav;
	}
	
	
	//희망도서 요청 게시판 관련 메소드
	@RequestMapping("/orderBkList.ju")
	public ModelAndView orderbkList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/orderBk/orderBkList");
		return mav;
	}
	
	
	//책추천 감상평 게시판 관련 메소드
	@RequestMapping("/reviewList.ju")
	public ModelAndView reviewList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("help/review/reviewList");
		return mav;
	}
	
}
