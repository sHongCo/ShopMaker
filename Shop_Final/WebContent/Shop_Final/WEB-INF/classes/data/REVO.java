package data;

import java.sql.Timestamp;

public class REVO {

	private int reNum;
	private String reContents;
	private String reId;
	Timestamp reDate;
	private int rePoint;
	
	///////////
	private int pNum;

	public REVO() {

	}

	public REVO(int reNum, String reContents, String reId, Timestamp reDate, int rePoint) {
		this.reNum = reNum;
		this.reContents = reContents;
		this.reId = reId;
		this.reDate = reDate;
		this.rePoint = rePoint;
	}
///////////////////////////////////////////////////
	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
/////////////////////////////////////////////////	
	
	

	public int getreNum() {
		return reNum;
	}

	public void setreNum(int reNum) {
		this.reNum = reNum;
	}
	
	public String getreContents() {
		return reContents;
	}

	public void setreContents(String reContents) {
		this.reContents = reContents;
	}

	public Timestamp getreDate() {
		return reDate;
	}

	public void setreDate(Timestamp reDate) {
		this.reDate = reDate;
	}

	public String getreId() {
		return reId;
	}

	public void setreId(String reId) {
		this.reId = reId;
	}

	public int getrePoint() {
		return rePoint;
	}

	public void setrePoint(int rePoint) {
		this.rePoint = rePoint;
	}
}