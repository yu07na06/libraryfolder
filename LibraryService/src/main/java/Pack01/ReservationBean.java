package Pack01;

import java.sql.Date;
import java.util.List;

public class ReservationBean {
	int reserNum;
	String userID;
	int bookID;
	String reservationApply;
	Date pickDate;
	String pickCheck;
	BookBean bookBean;
	public int getReserNum() {
		return reserNum;
	}
	public void setReserNum(int reserNum) {
		this.reserNum = reserNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getReservationApply() {
		return reservationApply;
	}
	public void setReservationApply(String reservationApply) {
		this.reservationApply = reservationApply;
	}
	public Date getPickDate() {
		return pickDate;
	}
	public void setPickDate(Date pickDate) {
		this.pickDate = pickDate;
	}
	public String getPickCheck() {
		return pickCheck;
	}
	public void setPickCheck(String pickCheck) {
		this.pickCheck = pickCheck;
	}

	public BookBean getBookBean() {
		return bookBean;
	}
	public void setBookBean(BookBean bookBean) {
		this.bookBean = bookBean;
	}
	@Override
	public String toString() {
		return "ReservationBean [reserNum=" + reserNum + ", userID=" + userID + ", bookID=" + bookID
				+ ", reservationApply=" + reservationApply + ", pickDate=" + pickDate + ", pickCheck=" + pickCheck
				+ ", bookBean=" + bookBean + "]";
	}

	
}
