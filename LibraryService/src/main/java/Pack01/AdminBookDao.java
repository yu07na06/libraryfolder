package Pack01;

import java.io.IOException;

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet
public class AdminBookDao   {
	SqlSessionFactory ssf = null;
	public AdminBookDao() {
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) { e.printStackTrace(); }
	}
	void insert(AdminBookDto dto) {
		SqlSession session = ssf.openSession();
		try {
			int result = session.insert("insert",dto);
			if(result > 0) session.commit();
			
		} catch (Exception e) { e.printStackTrace();
		}finally { session.close(); }
		System.out.println("insert success");
	}
	void select(AdminBookDto dto) {
		SqlSession session = ssf.openSession();
		try {
			int result = session.insert("insert",dto);
			if(result > 0) session.commit();
			
		} catch (Exception e) { e.printStackTrace();
		}finally { session.close(); }
		System.out.println("select success");
	}
	

	public List<AdminBookDto> select1(final int id) {
		SqlSession session = ssf.openSession();
		AdminBookDto dto = new AdminBookDto();
		List<AdminBookDto> mm =  session.selectList("select",id);
		session.close();
		return mm;
	}
	
	public List<AdminBookDto> bookSearch(final BookSearchDTO dto) {
		SqlSession session = ssf.openSession();
		System.out.println(dto.getSearchItem());
		List<AdminBookDto> mm = session.selectList("adminSearchBook",dto);
		session.close();
		return mm;
	}
//	public void htmlcontent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try{
//			request.setCharacterEncoding("UTF-8");
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print("<html><body>");
//			out.print("<input type='textbox'>");
//			out.print("</html></body>");
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	public String getJSON(BookSearchDTO dto) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		AdminBookDao bookDAO = new AdminBookDao();
		List<AdminBookDto> BookList = bookDAO.bookSearch(dto);
		for(int i = 0; i < BookList.size(); i++) {
			
			result.append("[{\"value\": \"" + BookList.get(i).getISBN()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getBookID()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getBookClass()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getBookName()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getAuthor()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getPublisher()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getCheckOutState()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getReservationState()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getRegistDate()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getRegister()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getDetail()+"\"}],");
		}
		result.append("]}");
		
		return result.toString();
	}
	
	public String getJSON1(int id) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		AdminBookDao bookDAO = new AdminBookDao();
		List<AdminBookDto> BookList = bookDAO.select1(id);
		for(int i = 0; i < BookList.size(); i++) {
			
			result.append("[{\"value\": \"" + BookList.get(i).getISBN()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getBookID()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getBookClass()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getBookName()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getAuthor()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getPublisher()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getCheckOutState()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getReservationState()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getRegistDate()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getRegister()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getDetail()+"\"}],");
		}
		result.append("]}");
		
		return result.toString();
	}
}
