package ju.model;
import java.util.*;
import ju.dto.*;

public interface MemberDAO {

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
