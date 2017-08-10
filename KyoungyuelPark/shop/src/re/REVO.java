package re;

public class REVO {

	private int reNum;
	private String reTitle;
	private String reContents;
	private String reName;
	private String reDate;
	private int rePoint;

	public REVO() {

	}

	public REVO(int reNum, String reTitle, String reContents, String reName, String reDate, int rePoint) {
		this.reNum = reNum;
		this.reTitle = reTitle;
		this.reContents = reContents;
		this.reName = reName;
		this.reDate = reDate;
		this.rePoint = rePoint;
	}

	public int getreNum() {
		return reNum;
	}

	public void setreNum(int reNum) {
		this.reNum = reNum;
	}

	public String getreTitle() {
		return reTitle;
	}

	public void setreTitle(String reTitle) {
		this.reTitle = reTitle;
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

	public String getreName() {
		return reName;
	}

	public void setreName(String reName) {
		this.reName = reName;
	}

	public int getrePoint() {
		return rePoint;
	}

	public void setrePoint(int rePoint) {
		this.rePoint = rePoint;
	}
}