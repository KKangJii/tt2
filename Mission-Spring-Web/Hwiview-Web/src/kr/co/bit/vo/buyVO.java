package kr.co.bit.vo;

public class buyVO {

	private int buy_no;
	private String id;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	private String name;
	private String product_name;
	private String tel1;
	private String tel2;
	private String tel3;
	private String basic_addr;
	private String detail_addr;
	private String reg_date;
	private String prot;
	
	public buyVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public buyVO(int buy_no, String name, String product_name, String tel1, String tel2, String tel3, String basic_addr,
			String detail_addr, String reg_date, String prot) {
		super();
		this.buy_no = buy_no;
		this.name = name;
		this.product_name = product_name;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.basic_addr = basic_addr;
		this.detail_addr = detail_addr;
		this.reg_date = reg_date;
		this.prot = prot;
	}

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getBasic_addr() {
		return basic_addr;
	}

	public void setBasic_addr(String basic_addr) {
		this.basic_addr = basic_addr;
	}

	public String getDetail_addr() {
		return detail_addr;
	}

	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getProt() {
		return prot;
	}

	public void setProt(String prot) {
		this.prot = prot;
	}

	@Override
	public String toString() {
		return "buyVO [buy_no=" + buy_no + ", name=" + name + ", product_name=" + product_name + ", tel1=" + tel1
				+ ", tel2=" + tel2 + ", tel3=" + tel3 + ", basic_addr=" + basic_addr + ", detail_addr=" + detail_addr
				+ ", reg_date=" + reg_date + ", prot=" + prot + "]";
	}
	
	
	
}
