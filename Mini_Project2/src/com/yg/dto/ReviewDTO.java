package com.yg.dto;

public class ReviewDTO {
	private int rbno;
	private String rtitle;
	private String rcontent;
	private String ID;
	private String rwritedate;
	private int rhitcount;
	private int pno;
	private int ref;
	private int level;
	private int step;
	private int obno;
	private String image;
	private String pname;
	private String color;
	private String size;
	private String filename1;
	private String filename2;
	
	public ReviewDTO() {}
	
	public ReviewDTO(String rtitle, String rcontent, String iD, int pno, int ref, int level, int step, int obno) {
		super();
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		ID = iD;
		this.pno = pno;
		this.ref = ref;
		this.level = level;
		this.step = step;
		this.obno = obno;
	}


	public ReviewDTO(String rtitle, String rcontent, String ID, int pno, int obno, String filename1, String filename2) {
		super();
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.ID = ID;
		this.pno = pno;
		this.obno = obno;
		this.filename1 = filename1;
		this.filename2 = filename2;
	}

	public int getRbno() {
		return rbno;
	}

	public void setRbno(int rbno) {
		this.rbno = rbno;
	}

	public String getRtitle() {
		return rtitle;
	}

	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getRwritedate() {
		return rwritedate;
	}

	public void setRwritedate(String rwritedate) {
		this.rwritedate = rwritedate;
	}

	public int getRhitcount() {
		return rhitcount;
	}

	public void setRhitcount(int rhitcount) {
		this.rhitcount = rhitcount;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}


	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getObno() {
		return obno;
	}

	public void setObno(int obno) {
		this.obno = obno;
	}

	public String getFilename1() {
		return filename1;
	}

	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}

	public String getFilename2() {
		return filename2;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}


	
}
