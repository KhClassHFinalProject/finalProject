package yong.emp.controller;

import java.util.List;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yong.emp.model.*;

@Controller
public class EmpController {
	
	@Autowired
	private EmpDAO empDAO;
	
	@RequestMapping("/emp.do")
	public String empMain(){
		return "emp/emp";
	}
	
	@RequestMapping("/empAdd.do")
	public ModelAndView empAdd(EmpDTO dto){
		
		int result = empDAO.empAdd(dto);
		String msg = result >0?"사원등록 성공!":"사원등록 실패!";
		ModelAndView mav = new ModelAndView("emp/empMsg","msg",msg);
		
		return mav;
	}
	
	@RequestMapping("/empDel.do")
	public ModelAndView empDel(
			@RequestParam("name")String name){
		int result = empDAO.empDel(name);
		String msg = result >0?"사원삭제 성공!":"사원삭제 실패!";
		ModelAndView mav = new ModelAndView("emp/empMsg","msg",msg);
		
		return mav;
	}
	
	@RequestMapping("/empList.do")
	public ModelAndView empAllList(){
		List<EmpDTO> list = empDAO.empAllList();
		ModelAndView mav = new ModelAndView("emp/empList","list",list);
		
		return mav;
	}
	
	@RequestMapping("/empFind.do")
	public ModelAndView empFind(
			@RequestParam("name")String name){
		EmpDTO dto = empDAO.empFind(name);
		ModelAndView mav = new ModelAndView("emp/empFind","dto",dto);
		return mav;
	}
	
	@RequestMapping(value="/empUpdate.do", method=RequestMethod.GET)
	public ModelAndView empUpdateForm(
		@RequestParam("name")String name){
			EmpDTO dto = empDAO.empFind(name);
			ModelAndView mav = new ModelAndView("emp/empUpdate","dto",dto);
			return mav;
			
	}
	
	@RequestMapping(value="/empUpdate.do", method=RequestMethod.POST)
	public ModelAndView empUpdate(EmpDTO dto){
		int count = empDAO.empUpdate(dto);
		String msg = count>0?"사원수정 성공!":"사원수정 실패!";
		ModelAndView mav = new ModelAndView("emp/empMsg","msg",msg);
		return mav;
	}
	
	
}
