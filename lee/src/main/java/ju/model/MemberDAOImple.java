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
	
	
	
	
	
	
	
	
	public int joinSubmit(MemberDTO dto) {
		
		int count = sqlMap.insert("memINSjoin", dto);
		return count;
	}

	public int mailCheck(String mem_id) {
		System.out.println("mem_id = "+mem_id);
		int count = sqlMap.selectOne("memSELcheckmail", mem_id);
				
		return count;
	}

	public int loginForm(String mem_id, String mem_pwd) {

		return 0;
	}

	public int checkHp(String mem_hp) {
		System.out.println("mem_id = "+mem_hp);
		int count = sqlMap.selectOne("memSELcheckmail", mem_hp);
				
		return count;
	}
	
	public List<HolidayDTO> getHoliday(int yr, int mon) {
		String wh = "";
		if(mon==12){
			wh = 
					"solar_date >= '"+yr+"-"+mon+"-"+"01' and solar_date < '"+yr+"-"+01+"-"+"01'";
		}else{
		wh = 
				"solar_date >= '"+yr+"-"+mon+"-"+"01' and solar_date < '"+yr+"-"+(mon+1)+"-"+"01'";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("wh", wh);
		List<HolidayDTO> hdto = sqlMap.selectList("holidaySELget", map);
//		System.out.println("음력 : "+hdto.get(0).getLunar_Date());
//		System.out.println("양력 : "+hdto.get(0).getSolar_Date());
		return hdto;
	}
	
	public List<HolidayDTO> getHolidayFC(int yr) {
		String wh="solar_date >= '"+yr+"-01-01' and solar_date < '"+yr+"-12-31'";
		System.out.println("진입! wh : " + wh);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("wh", wh);
		List<HolidayDTO> hdto = sqlMap.selectList("holidaySELget", map);
//		System.out.println("음력 : "+hdto.get(0).getLunar_Date());
//		System.out.println("양력 : "+hdto.get(0).getSolar_Date());
		return hdto;
	}
}
