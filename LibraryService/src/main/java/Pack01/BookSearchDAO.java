package Pack01;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import DTO.BookSearchDTO;

public class BookSearchDAO {
	
	SqlSessionFactory ssf = null;
	public BookSearchDAO() {
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) { e.printStackTrace(); }
	}
	
	public List<book_testBean> bookSearch(final BookSearchDTO dto) {
		SqlSession session = ssf.openSession();
		List<book_testBean> mm = session.selectList("SearchBook",dto);
		session.close();
		return mm;
	}
	
	public String getJSON(BookSearchDTO dto) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		BookSearchDAO bookDAO = new BookSearchDAO();
		List<book_testBean> BookList = bookDAO.bookSearch(dto);
		for(int i = 0; i < BookList.size(); i++) {
			result.append("[{\"value\": \"" + BookList.get(i).getBookID()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getImg()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getBookClass()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getBookName()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getAuthor()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getPublisher()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getCheckOutState()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getReservationState()+"\"},");
			result.append("{\"value\": \"" + BookList.get(i).getDetail()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}

}
