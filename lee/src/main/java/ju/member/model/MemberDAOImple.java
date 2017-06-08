package ju.member.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.HolidayDTO;
import ju.dto.MemberDTO;


public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	
	public MemberDAOImple() {
		super();
	}
	
	

	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
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
	
	public int loginSubmit(String mem_id, String mem_pwd) {
		HashMap<String,String> map = new HashMap<String, String>();
//		System.out.println(mem_id+"/"+mem_pwd);
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);
		MemberDTO dto = sqlMap.selectOne("memSELlogin", map);
		
		if(dto==null || dto.getMem_idx().equals("")){
			//로그인 실패시
			return 0;
		}else{
			System.out.println("로그인 성공");
			//로그인 성공시 블랙리스트 확인
			String mem_idx = dto.getMem_idx();
			System.out.println(mem_idx);
			//String whe = "MEM_IDX='"+mem_idx+"' and BAN_START<=SYSDATE and BAN_END>=SYSDATE";
			int count = sqlMap.selectOne("memSELcheckban",mem_idx);
			System.out.println("count : "+count);
			//블랙리스트에 있는경우 0반환 로그인막기, 블랙리스트에 없는경우 1반환 로그인 실행
			return count>0?0:1;
		}
		
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
