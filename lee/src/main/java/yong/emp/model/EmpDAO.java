package yong.emp.model;

import java.util.List;

public interface EmpDAO {
	
	public int empAdd(EmpDTO dto);
	public int empDel(String name);
	public List<EmpDTO> empAllList();
	public EmpDTO empFind(String name);
	public int empUpdate(EmpDTO dto);
	
}
