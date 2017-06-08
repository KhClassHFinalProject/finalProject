package ju.dto;

public class FedexDTO {
	private String fedex_idx;
	private String mem_idx;
	private String bk_idx;
	private int fedex_num;
	private String lb_idx;
	
	public FedexDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public FedexDTO(String fedex_idx, String mem_idx, String bk_idx, int fedex_num, String lb_idx) {
		super();
		this.fedex_idx = fedex_idx;
		this.mem_idx = mem_idx;
		this.bk_idx = bk_idx;
		this.fedex_num = fedex_num;
		this.lb_idx = lb_idx;
	}

	public String getFedex_idx() {
		return fedex_idx;
	}

	public void setFedex_idx(String fedex_idx) {
		this.fedex_idx = fedex_idx;
	}

	public String getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(String mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getBk_idx() {
		return bk_idx;
	}

	public void setBk_idx(String bk_idx) {
		this.bk_idx = bk_idx;
	}

	public int getFedex_num() {
		return fedex_num;
	}

	public void setFedex_num(int fedex_num) {
		this.fedex_num = fedex_num;
	}

	public String getLb_idx() {
		return lb_idx;
	}

	public void setLb_idx(String lb_idx) {
		this.lb_idx = lb_idx;
	}
	
	
}
