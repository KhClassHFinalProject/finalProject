package ju.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ju.dto.LoanDTO;

public class LoanDAOImple implements LoanDAO {

	private SqlSessionTemplate sqlMap;
	
	public LoanDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<LoanDTO> loanList() {
		List<LoanDTO> list = sqlMap.selectList("loanSELList");
		return list;
	}
	
	public List<LoanDTO> loanListAfter() {
		List<LoanDTO> list = sqlMap.selectList("loanSELAfter");
		return list;
	}
	
	public List<LoanDTO> loanList(String mem_idx) {
		List<LoanDTO> list = sqlMap.selectList("loanSELListmem",mem_idx);
		return list;
	}
	
	public int yeyakNum(String bk_isbn) {
		int result = sqlMap.selectOne("yeSELSun",bk_isbn);
		return result;
	}
	
	public int loanOne(String bk_idx) {
		int count = sqlMap.selectOne("loanSELOne",bk_idx);
		return count;
	}
	
	public int checkOutGo(LoanDTO dto) {
		int result = sqlMap.insert("loanINSAdd",dto);
		return result;
	}
	
	public int checkInGo(String bk_idx) {
		int result = sqlMap.insert("loanUPRe",bk_idx);
		return result;
	}
	
	

	
}
