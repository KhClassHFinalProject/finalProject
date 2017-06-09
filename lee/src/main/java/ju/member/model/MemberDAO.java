 package ju.member.model;


import ju.dto.*;
import java.util.*;

public interface MemberDAO {
	
	public int joinSubmit(MemberDTO dto);
	
	public int mailCheck(String mem_id);
	
	public int loginForm(String mem_id, String mem_pwd);
	
	public int loginSubmit(String mem_id, String mem_pwd);
	
	public int checkHp(String mem_hp);
	
	public List<HolidayDTO> getHoliday(int yr, int mon);
	
	public List<HolidayDTO> getHolidayFC(int yr);
	public List<MemberDTO> memberList(int cp, int ls);
	public List<MemberDTO> memberListSearch(int cp, int ls,String mem_name);
	public MemberDTO memberInfo(String mem_idx);
	public int banAdd(BanDTO dto, int ban_period);
	public BanDTO memberBanInfo(String mem_idx);
	public int banDel(String mem_idx);
	public BanDTO memberLoanBan(String mem_idx);
	public int banCount(String mem_idx);
	public List<LoanDTO> memberLoan(String mem_idx);
	public int memberDel(String mem_idx);
	public int getTotlaCnt();
}
