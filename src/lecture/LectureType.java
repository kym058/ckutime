package lecture;

public class LectureType {

	String collegeType;
	String area1ID;
	String area1Name;
	String area2ID;
	String area2Name;
	String area3ID;
	String area3Name;
	String area4ID;
	String area4Name;
	
	public String getCollegeType() {
		return collegeType;
	}
	public void setCollegeType(String collegeType) {
		this.collegeType = collegeType;
	}
	public String getArea1ID() {
		return area1ID;
	}
	public void setArea1ID(String area1id) {
		area1ID = area1id;
	}
	public String getArea1Name() {
		return area1Name;
	}
	public void setArea1Name(String area1Name) {
		this.area1Name = area1Name;
	}
	public String getArea2ID() {
		return area2ID;
	}
	public void setArea2ID(String area2id) {
		area2ID = area2id;
	}
	public String getArea2Name() {
		return area2Name;
	}
	public void setArea2Name(String area2Name) {
		this.area2Name = area2Name;
	}
	public String getArea3ID() {
		return area3ID;
	}
	public void setArea3ID(String area3id) {
		area3ID = area3id;
	}
	public String getArea3Name() {
		return area3Name;
	}
	public void setArea3Name(String area3Name) {
		this.area3Name = area3Name;
	}
	public String getArea4ID() {
		return area4ID;
	}
	public void setArea4ID(String area4id) {
		area4ID = area4id;
	}
	public String getArea4Name() {
		return area4Name;
	}
	public void setArea4Name(String area4Name) {
		this.area4Name = area4Name;
	}
	
	public LectureType(String collegeType, String area1id, String area1Name, String area2id, String area2Name,
			String area3id, String area3Name, String area4id, String area4Name) {
		super();
		this.collegeType = collegeType;
		area1ID = area1id;
		this.area1Name = area1Name;
		area2ID = area2id;
		this.area2Name = area2Name;
		area3ID = area3id;
		this.area3Name = area3Name;
		area4ID = area4id;
		this.area4Name = area4Name;
	}
	
	public LectureType() {
		collegeType = "";
		area1ID = "";
		area1Name = "";
		area2ID = "";
		area2Name = "";
		area3ID = "";
		area3Name = "";
		area4ID = "";
		area4Name = "";
	}

}
