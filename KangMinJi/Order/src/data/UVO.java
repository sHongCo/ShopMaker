package data;

public class UVO {

	private int uNum;
	private String uId;
	private String uPass;
	private String uName;
	private String uPhone;
	private String uMail;
	private String uAdd;

	public UVO(int uNum, String uId, String uPass, String uName, String uPhone, String uMail, String uAdd) {
		this.uNum = uNum;
		this.uId = uId;
		this.uPass = uPass;
		this.uName = uName;
		this.uPhone = uPhone;
		this.uMail = uMail;
		this.uAdd = uAdd;
	}

	public int getuNum() {
		return uNum;
	}

	public void setuNum(int uNum) {
		this.uNum = uNum;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPass() {
		return uPass;
	}

	public void setuPass(String uPass) {
		this.uPass = uPass;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuMail() {
		return uMail;
	}

	public void setuMail(String uMail) {
		this.uMail = uMail;
	}

	public String getuAdd() {
		return uAdd;
	}

	public void setuAdd(String uAdd) {
		this.uAdd = uAdd;
	}
}