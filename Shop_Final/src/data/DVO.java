package data;

public class DVO {
	
	private int dnum;
	private String dname; 
	private int dcount;
	private int dprice;
	private String did;
	
	public DVO(){
		
	}
	
	public DVO(int dnum, String dname, int dcount, int dprice){
		
		this.dnum = dnum;
		this.dname = dname;
		this.dcount = dcount;
		this.dprice = dprice;
		
	}
	

	public int getDnum() {
		return dnum;
	}

	public void setDnum(int dnum) {
		this.dnum = dnum;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getDcount() {
		return dcount;
	}

	public void setDcount(int dcount) {
		this.dcount = dcount;
	}

	public int getDprice() {
		return dprice;
	}

	public void setDprice(int dprice) {
		this.dprice = dprice;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}
	
	
	
	
	
	
	
	
	
	
	
}
