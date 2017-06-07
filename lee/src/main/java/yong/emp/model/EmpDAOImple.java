package yong.emp.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class EmpDAOImple implements EmpDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	public EmpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	public int empAdd(EmpDTO dto) {
		
		int count = sqlMap.insert("empInsert",dto);
		return count;
	}
	
	public int empDel(String name){
		
		int count = sqlMap.delete("empDelete",name);
		return count;
	}
	
	public List<EmpDTO> empAllList() {
		
		List<EmpDTO> list = sqlMap.selectList("empAllList");
		return list;
	}
	
	public EmpDTO empFind(String name){
		List<EmpDTO>list = sqlMap.selectList("empFind", name);
		EmpDTO dto = list.get(0);
		return dto;
	}
	
	public int empUpdate(EmpDTO dto) {
		int count = sqlMap.update("empUpdate",dto);
		
		return count;
	}

}
