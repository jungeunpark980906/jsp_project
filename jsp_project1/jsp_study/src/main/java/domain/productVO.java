package domain;

public class productVO {
	/* create table product(
		pno int not null auto_increment,
		pname varchar(50) not null,
		price int not null,
		regdate datetime default now(),
		madeby varchar(50),
		primary key(pno)
		);
	 * */
	
	//멤버변수
	private int pno;
	private String pname;
	private int price;
	private String regdate;
	private String madeby;
	
	
	//생성자
	public productVO() {}
	
	//상품 등록 pname, price, madeby
	public productVO(String pname, int price, String madeby) {
		this.pname = pname;
		this.price = price;
		this.madeby = madeby;
	}
	
	//상품 리스트 pno, pname, regdate
	public productVO(int pno, String pname, String regdate) {
		this.pno = pno;
		this.pname = pname;
		this.regdate = regdate;
	}
	
	
	//상품 수정 pno, pname, price, madeby
	public productVO(int pno, String pname, int price, String madeby) {
		this.pno = pno;
		this.pname = pname;
		this.price = price;
		this.madeby = madeby;
	}

	

	//상품 상세페이지 pno, pname, price, regdate, madeby
	public productVO(int pno, String pname, int price, String regdate, String madeby) {
		this.pno = pno;
		this.pname = pname;
		this.price = price;
		this.regdate = regdate;
		this.madeby = madeby;
	}

	//getter,setter
	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getMadeby() {
		return madeby;
	}

	public void setMadeby(String madeby) {
		this.madeby = madeby;
	}
	
	//toString
	@Override
	public String toString() {
		return "productVO [pno=" + pno + ", pname=" + pname + ", price=" + price + ", regdate=" + regdate + ", madeby="
				+ madeby + "]";
	}
	
	
	
}
