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
}
