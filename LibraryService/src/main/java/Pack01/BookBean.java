package Pack01;

import java.sql.Date;

public class BookBean {
	int ISBN;
	int bookID;
	String bookClass;
	String bookName;
	String author;
	String publisher;
	String checkOutState;
	String reservationState;
	Date registDate;
	String register;
	String detail;
	
	CheckOutBean checkOutBean;
	
	
	public int getISBN() {
		return ISBN;
	}
	public void setISBN(int iSBN) {
		ISBN = iSBN;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getBookClass() {
		return bookClass;
	}
	public void setBookClass(String bookClass) {
		this.bookClass = bookClass;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCheckOutState() {
		return checkOutState;
	}
	public void setCheckOutState(String checkOutState) {
		this.checkOutState = checkOutState;
	}
	public String getReservationState() {
		return reservationState;
	}
	public void setReservationState(String reservationState) {
		this.reservationState = reservationState;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public CheckOutBean getCheckOutBean() {
		return checkOutBean;
	}
	public void setCheckOutBean(CheckOutBean checkOutBean) {
		this.checkOutBean = checkOutBean;
	}
	@Override
	public String toString() {
		return "BookBean [ISBN=" + ISBN + ", bookID=" + bookID + ", bookClass=" + bookClass + ", bookName=" + bookName
				+ ", author=" + author + ", publisher=" + publisher + ", checkOutState=" + checkOutState
				+ ", reservationState=" + reservationState + ", registDate=" + registDate + ", register=" + register
				+ ", detail=" + detail + ", checkOutBean=" + checkOutBean + "]";
	}
	
	

	
	
}
