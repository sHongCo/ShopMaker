package shop;

public class REVO {

	private int reNum;
	private String reContents;
	private String reId;
	private String reDate;
	private int rePoint;

	public REVO() {

	}

	public REVO(int reNum,  String reContents, String reId, String reDate, int rePoint) {
		this.reNum = reNum;
		this.reContents = reContents;
		this.reId = reId;
		this.reDate = reDate;
		this.rePoint = rePoint;
	}

	public int getreNum() {
		return reNum;
	}

	public void setreNum(int reNum) {
		this.reNum = reNum;
	}

	public String getreId() {
		return reId;
	}

	public void setreId(String reId) {
		this.reId = reId;
	}

	public String getreContents() {
		return reContents;
	}

	public void setreContents(String reContents) {
		this.reContents = reContents;
	}

	public String getreDate() {
		return reDate;
	}

	public void setreDate(String reDate) {
		this.reDate = reDate;
	}

	public int getrePoint() {
		return rePoint;
	}

	public void setrePoint(int rePoint) {
		this.rePoint = rePoint;
	}
}