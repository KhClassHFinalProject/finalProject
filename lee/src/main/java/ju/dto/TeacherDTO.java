package ju.dto;

public class TeacherDTO {

	private String tc_idx;
	private String tc_name;
	private String tc_sum;
	private String tc_addr;
	private String tc_hp;
	private String tc_birth;
	
	public TeacherDTO() {
		super();
	}

	public TeacherDTO(String tc_idx, String tc_name, String tc_sum, String tc_addr, String tc_hp, String tc_birth) {
		super();
		this.tc_idx = tc_idx;
		this.tc_name = tc_name;
		this.tc_sum = tc_sum;
		this.tc_addr = tc_addr;
		this.tc_hp = tc_hp;
		this.tc_birth = tc_birth;
	}

	public String getTc_idx() {
		return tc_idx;
	}

	public void setTc_idx(String tc_idx) {
		this.tc_idx = tc_idx;
	}

	public String getTc_name() {
		return tc_name;
	}

	public void setTc_name(String tc_name) {
		this.tc_name = tc_name;
	}

	public String getTc_sum() {
		return tc_sum;
	}

	public void setTc_sum(String tc_sum) {
		this.tc_sum = tc_sum;
	}

	public String getTc_addr() {
		return tc_addr;
	}

	public void setTc_addr(String tc_addr) {
		this.tc_addr = tc_addr;
	}

	public String getTc_hp() {
		return tc_hp;
	}

	public void setTc_hp(String tc_hp) {
		this.tc_hp = tc_hp;
	}

	public String getTc_birth() {
		return tc_birth;
	}

	public void setTc_birth(String tc_birth) {
		this.tc_birth = tc_birth;
	}
	
}
