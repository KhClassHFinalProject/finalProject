package ju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ju.dto.*;
import ju.model.*;

@Controller
public class adminLoanBookController {

	@Autowired
	public LoanDAO loanDao;	
	
	@Autowired
	public BookDAO bookDao;
	
	
	// 대출관리 메인페이지로 이동
		@RequestMapping("/loanbookList.ju")
		public ModelAndView loanbookList(){
			List<LoanDTO> list = loanDao.loanList();
			List<LoanDTO> list2 = loanDao.loanListAfter();
			String dateFormat="yyyy-MM-dd";
			SimpleDateFormat sdf=new SimpleDateFormat(dateFormat);
			List<String> sdList = new ArrayList<String>();
			for(int i=0; i<list.size(); i++){
				/*list.add((sdf.format(list.get(i).getLb_sd(i))));
				list.get(i).setLb_sd(sdList.get(i));*/
			}
			List<String> edList = new ArrayList<String>();
			for(int i=0; i<list.size(); i++){
				edList.add((sdf.format(list.get(i).getLb_ed())));
			}
			
			ModelAndView mav = new ModelAndView("admin/loanbookManage/loanbookList","list",list);
			mav.addObject("sdList",sdList);
			mav.addObject("edList",edList);
			mav.addObject("list2",list2);
			return mav;
		}
		
	// 반납페이지로 이동
		@RequestMapping(value="/checkIn.ju",method=RequestMethod.GET)
		public ModelAndView checkIn(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin/loanbookManage/checkIn");
			return mav;
		}
		
	// 대출페이지로 이동
		@RequestMapping(value="/checkOut.ju",method=RequestMethod.GET)
		public ModelAndView checkOut(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin/loanbookManage/checkOut");
			return mav;
		}
		
	// 반납하기
		@RequestMapping(value="/checkIn.ju",method=RequestMethod.POST)
		public ModelAndView checkInStart(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin/loanbookManage/checkIn");
			return mav;
		}
		
	// 반납도서 정보페이지로 이동
		@RequestMapping(value="/loanbookInfo2.ju",method=RequestMethod.GET)
		public ModelAndView loanbookInfo2(String bk_idx){
			BookDTO dto = bookDao.bookReInfo(bk_idx);
			ModelAndView mav = new ModelAndView("admin/loanbookManage/loanbookInfo","dto",dto);
			return mav;
		}
				
	// 대출하기
		@RequestMapping(value="/checkOut2.ju",method=RequestMethod.GET)
		public ModelAndView checkOutStart(
				@RequestParam(value="bk_idx",defaultValue="0")String bk_idx,
				LoanDTO dto,HttpSession session){
			ModelAndView mav = null;
			int count = loanDao.loanOne(bk_idx);
			System.out.println(count);
			if(count==0){
				MemberDTO mdto=(MemberDTO)session.getAttribute("dto");
				String mem_idx=mdto.getMem_idx();
				Long unixTime=System.currentTimeMillis();
				String lb_idx="LB"+unixTime;
				dto.setLb_idx(lb_idx);
				dto.setMem_idx(mem_idx);
				dto.setBook_idx(bk_idx);
				int result = bookDao.bookTakeUpdate(bk_idx);
				int set = loanDao.checkOutGo(dto);
				System.out.println("컨트롤러dto: " + dto);
				String msg = set>0?"도서 대출":"도서 대출 실패";
				mav = new ModelAndView("admin/adminMsg","msg",msg);
				mav.addObject("page","loanbookList.ju");
			}else{
				String msg = "이미 대출중인 도서입니다. 다른도서를 빌려주세요";
				mav = new ModelAndView("admin/adminMsg","msg",msg);
				mav.addObject("page","loanbookList.ju");
			}
			return mav;
		}
		
	
	// 반납하기
		@RequestMapping(value="/checkIn2.ju",method=RequestMethod.GET)
		public ModelAndView checkInStart(
				@RequestParam(value="bk_idx",defaultValue="0")String bk_idx,
				LoanDTO dto){
			int result = bookDao.bookReUpdate(bk_idx);
			int count = loanDao.checkInGo(bk_idx);
			String msg = count>0?"도서 반납":"도서 반납 실패";
			ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
			mav.addObject("page","loanbookList.ju");
			return mav;
		}
		
	// 메일보내기
		@RequestMapping("/mailSend.ju")
		public ModelAndView mailSend(
				@RequestParam(value="mem_id",defaultValue="0")String mem_id){

		String content="책 반납 하루 전입니다.";
    	EmailDAO dao = new EmailDAO();
    	dao.sendEmail(mem_id, content);
    	String msg = "메일전송 완료";
    	ModelAndView mav = new ModelAndView("admin/adminMsg","msg",msg);
    	mav.addObject("page","loanbookList.ju");
		return mav;
		}
}
