package schedule;

import java.util.ArrayList;

import lecture.Lecture;

public class Schedule {
	
	public String mondayList[] = new String[14];
	public String tuesdayList[] = new String[14];
	public String wendesdayList[] = new String[14];
	public String thursdayList[] = new String[14];
	public String fridayList[] = new String[14];
	public String saturdayList[] = new String[14];
	public String mondayListID[] = new String[14];
	public String tuesdayListID[] = new String[14];
	public String wendesdayListID[] = new String[14];
	public String thursdayListID[] = new String[14];
	public String fridayListID[] = new String[14];
	public String saturdayListID[] = new String[14];
	public int total = 0;

	public Schedule() {
		for(int i = 0; i < 14; i++) {
			mondayList[i] = "X";
			tuesdayList[i] = "X";
			wendesdayList[i] = "X";
			thursdayList[i] = "X";
			fridayList[i] = "X";
			saturdayList[i] = "X";
			mondayListID[i] = "X";
			tuesdayListID[i] = "X";
			wendesdayListID[i] = "X";
			thursdayListID[i] = "X";
			fridayListID[i] = "X";
			saturdayListID[i] = "X";
		}
	}
	
	public void addSchedule(String schedule, String lectureName, String lectureClassroom, String lectureID) {
		int temp;
		if((temp = schedule.indexOf("월")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					mondayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureName + "<br>" + lectureClassroom;
					mondayListID[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureID;
				}
			}
		}
		if((temp = schedule.indexOf("화")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					tuesdayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureName + "<br>" + lectureClassroom;
					tuesdayListID[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureID;
				}
			}
		}		
		if((temp = schedule.indexOf("수")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					wendesdayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureName + "<br>" + lectureClassroom;
					wendesdayListID[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureID;
				}
			}
		}			
		if((temp = schedule.indexOf("목")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					thursdayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureName + "<br>" + lectureClassroom;
					thursdayListID[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureID;
				}
			}
		}			
		if((temp = schedule.indexOf("금")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					fridayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureName + "<br>" + lectureClassroom;
					fridayListID[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureID;
				}
			}
		}			
		if((temp = schedule.indexOf("토")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					saturdayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureName + "\n" + lectureClassroom;
					saturdayListID[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))] = lectureID;
				}
			}
		}
	}
	
	public boolean validate(String schedule) {
		int temp;
		if((temp = schedule.indexOf("월")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					if(!mondayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))].equals("X")) {
						return false;
					}
				}
			}
		}
		if((temp = schedule.indexOf("화")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					if(!tuesdayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))].equals("X")) {
						return false;
					}
				}
			}
		}		
		if((temp = schedule.indexOf("수")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					if(!wendesdayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))].equals("X")) {
						return false;
					}
				}
			}
		}			
		if((temp = schedule.indexOf("목")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					if(!thursdayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))].equals("X")) {
						return false;
					}
				}
			}
		}			
		if((temp = schedule.indexOf("금")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					if(!fridayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))].equals("X")) {
						return false;
					}
				}
			}
		}			
		if((temp = schedule.indexOf("토")) > -1) {
			temp += 2;
			int startPoint = temp;
			int endPoint = temp;
			for(int i = temp; i < schedule.length() && schedule.charAt(i) != ':'; i++) {
				if(schedule.charAt(i) == '[') {
					startPoint = i;
				}
				if(schedule.charAt(i) == ']') {
					endPoint = i;
					if(!saturdayList[Integer.parseInt(schedule.substring(startPoint + 1, endPoint))].equals("X")) {
						return false;
					}
				}
			}
		}
		return true;
	}	
	
	public void show() {
		for(int i = 0; i < 14; i++) {
			System.out.println(mondayList[i] + " " + tuesdayList[i] + " " + wendesdayList[i] + " " +
									thursdayList[i] + " " + fridayList[i] + " " + saturdayList[i]);
		}
	}
	
	public void addFromList(ArrayList<Lecture> lectureList) {
		for(int i = 0; i < lectureList.size(); i++) {
			addSchedule(lectureList.get(i).getLectureTime(), lectureList.get(i).getLectureName(), lectureList.get(i).getLectureClassroom(), lectureList.get(i).getLectureID() + "");
			total += Integer.parseInt(lectureList.get(i).getLectureCredit());
		}
	}
	
}
