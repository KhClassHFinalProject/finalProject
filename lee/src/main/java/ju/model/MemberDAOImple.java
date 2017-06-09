package ju.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.*;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<MemberDTO> memberList(int cp, int ls){
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		List<MemberDTO> list = sqlMap.selectList("memSELList",map);
		return list;
	}
	
	public List<MemberDTO> memberListSearch(int cp, int ls,String mem_name){
		int startnum=(cp-1)*ls+1;
		int endnum = cp*ls;
		Map map = new HashMap();
		map.put("startnum", startnum);
		map.put("endnum", endnum);
		map.put("mem_name", mem_name+"%");
		List<MemberDTO> list = sqlMap.selectList("memSELSearch",map);
		return list;
	}
	
	public MemberDTO memberInfo(String mem_idx){
		MemberDTO dto = sqlMap.selectOne("memSELInfo",mem_idx);
		return dto;
	}
	
	public int banCount(String mem_idx){
		int count = sqlMap.selectOne("banSELCount",mem_idx);
		return count;
	}
	
	public int getTotlaCnt(){
		int result = sqlMap.selectOne("memtotalCnt");
		return result;
	}
	
	public List<LoanDTO> memberLoan(String mem_idx){
		List<LoanDTO> list = sqlMap.selectList("memSELLoan",mem_idx);
		return list;
	}
	
	public int memberDel(String mem_idx){
		int result = sqlMap.delete("memDEL",mem_idx);
		System.out.println(result);
		return result;
	}
	
	public BanDTO memberBanInfo(String mem_idx){
		BanDTO dto = sqlMap.selectOne("banSELInfo",mem_idx);
		if(dto==null){
			dto = new BanDTO();
		}
		return dto;
	}
	
	public BanDTO memberLoanBan(String mem_idx){
		BanDTO dto = sqlMap.selectOne("memSELBan",mem_idx);
		return dto;
	}
	
	public int banAdd(BanDTO dto, int ban_period){
		Map<String,Object> bkMap=new HashMap<String,Object>();
		bkMap.put("ban_end",ban_period);
		bkMap.put("dto", dto);
		int result=sqlMap.insert("banINSBan",bkMap);
		return result;
	}
	
	public int banDel(String mem_idx){
		int result=sqlMap.delete("banUPBan",mem_idx);
		return result;
	}
}
