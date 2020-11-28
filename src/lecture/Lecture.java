package lecture;

public class Lecture extends LectureType {

	int	lectureID;
	String lectureGrade;
	String lectureType;
	String lectureNumber;
	String lectureName;
	String lectureCredit;
	String lectureTheory;
	String lecturePractice;
	String lectureDivide;
	String lectureLimit;
	String lectureProfessor;
	String lectureTime;
	String lectureClassroom;
	String lectureNote;
	
	public int getLectureID() {
		return lectureID;
	}

	public void setLectureID(int lectureID) {
		this.lectureID = lectureID;
	}

	public String getLectureGrade() {
		return lectureGrade;
	}

	public void setLectureGrade(String lectureGrade) {
		this.lectureGrade = lectureGrade;
	}

	public String getLectureType() {
		return lectureType;
	}

	public void setLectureType(String lectureType) {
		this.lectureType = lectureType;
	}

	public String getLectureNumber() {
		return lectureNumber;
	}

	public void setLectureNumber(String lectureNumber) {
		this.lectureNumber = lectureNumber;
	}

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	public String getLectureCredit() {
		return lectureCredit;
	}

	public void setLectureCredit(String lectureCredit) {
		this.lectureCredit = lectureCredit;
	}

	public String getLectureTheory() {
		return lectureTheory;
	}

	public void setLectureTheory(String lectureTheory) {
		this.lectureTheory = lectureTheory;
	}

	public String getLecturePractice() {
		return lecturePractice;
	}

	public void setLecturePractice(String lecturePractice) {
		this.lecturePractice = lecturePractice;
	}

	public String getLectureDivide() {
		return lectureDivide;
	}

	public void setLectureDivide(String lectureDivide) {
		this.lectureDivide = lectureDivide;
	}

	public String getLectureLimit() {
		return lectureLimit;
	}

	public void setLectureLimit(String lectureLimit) {
		this.lectureLimit = lectureLimit;
	}

	public String getLectureProfessor() {
		return lectureProfessor;
	}

	public void setLectureProfessor(String lectureProfessor) {
		this.lectureProfessor = lectureProfessor;
	}

	public String getLectureTime() {
		return lectureTime;
	}

	public void setLectureTime(String lectureTime) {
		this.lectureTime = lectureTime;
	}

	public String getLectureClassroom() {
		return lectureClassroom;
	}

	public void setLectureClassroom(String lectureClassroom) {
		this.lectureClassroom = lectureClassroom;
	}

	public String getLectureNote() {
		return lectureNote;
	}

	public void setLectureNote(String lectureNote) {
		this.lectureNote = lectureNote;
	}
	
	public Lecture() {
		super();
		this.lectureID = 0;
		this.lectureGrade = "";
		this.lectureType = "";
		this.lectureNumber = "";
		this.lectureName = "";
		this.lectureCredit = "";
		this.lectureTheory = "";
		this.lecturePractice = "";
		this.lectureDivide = "";
		this.lectureLimit = "";
		this.lectureProfessor = "";
		this.lectureTime = "";
		this.lectureClassroom = "";
		this.lectureNote = "";
	}
	
	public Lecture(String collegeType, String area1id, String area1Name, String area2id, String area2Name,
			String area3id, String area3Name, String area4id, String area4Name, int lectureID, String lectureGrade,
			String lectureType, String lectureNumber, String lectureName, String lectureCredit, String lectureTheory,
			String lecturePractice, String lectureDivide, String lectureLimit, String lectureProfessor,
			String lectureTime, String lectureClassroom, String lectureNote) {
		super(collegeType, area1id, area1Name, area2id, area2Name, area3id, area3Name, area4id, area4Name);
		this.lectureID = lectureID;
		this.lectureGrade = lectureGrade;
		this.lectureType = lectureType;
		this.lectureNumber = lectureNumber;
		this.lectureName = lectureName;
		this.lectureCredit = lectureCredit;
		this.lectureTheory = lectureTheory;
		this.lecturePractice = lecturePractice;
		this.lectureDivide = lectureDivide;
		this.lectureLimit = lectureLimit;
		this.lectureProfessor = lectureProfessor;
		this.lectureTime = lectureTime;
		this.lectureClassroom = lectureClassroom;
		this.lectureNote = lectureNote;
	}	

	public String toString() {
		return getCollegeType() + "\t" + getArea1Name() + "\t" + getArea2Name() + "\t" + getArea3Name() + "\t" + getArea4Name() + "\t" + getLectureID() + "\t" +
							getLectureGrade() + "\t" + getLectureType() + "\t" + getLectureNumber() + "\t" + getLectureName() + "\t" + getLectureCredit() + "\t" +
							getLectureTheory() + "\t" + getLecturePractice() + "\t" + getLectureDivide() + "\t" + getLectureLimit() + "\t" + getLectureProfessor() + "\t" +
							getLectureTime() + "\t" + getLectureClassroom() + "\t" + getLectureNote();
	}
	
	public void show() {
		System.out.println("--------------------------------");
		System.out.println("대학: " + getCollegeType());
		System.out.println("지역명1: " + getArea1Name());
		System.out.println("지역명2: " + getArea2Name());
		System.out.println("지역명3: " + getArea3Name());
		System.out.println("지역명4: " + getArea4Name());
		System.out.println("강의ID: " + getLectureID());
		System.out.println("강의 등급: " + getLectureGrade());
		System.out.println("강의 유형: " + getLectureType());
		System.out.println("강의 번호: " + getLectureNumber());
		System.out.println("강의 이름: " + getLectureName());
		System.out.println("강의 증명: " + getLectureCredit());
		System.out.println("강의 이론: " + getLectureTheory());
		System.out.println("강의 실습: " + getLecturePractice());
		System.out.println("강의 나누기: " + getLectureDivide());
		System.out.println("강의 제한: " + getLectureLimit());
		System.out.println("강의 교수: " + getLectureProfessor());
		System.out.println("강의 시간: " + getLectureTime());
		System.out.println("강의 교실: " + getLectureClassroom());
		System.out.println("강의 노트: " + getLectureNote());
	}
}