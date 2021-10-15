package Pack01;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class BookDAO {
	SqlSessionFactory ssf = null;
	SqlSession session = null;
	public BookDAO() {
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) { e.printStackTrace(); }
	}

	public List<CheckOutBean> checkList(String userID) {
		session = ssf.openSession();
		List<CheckOutBean> checkList = null;
		
		try {
			checkList = session.selectList("checkOutList",userID);
			System.out.println(checkList);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return checkList;
	}

	public List<BookBean> reserList(String userID) {
		session = ssf.openSession();
		List<BookBean> reserList = null;
		
		try {
			reserList = session.selectList("reserList",userID);
			System.out.println("reserList"+reserList);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return reserList;
	}

	// ISBN으로 책 검색하기
	public List<BookBean> bookDetail(int ISBN) {
		
		session = ssf.openSession();
		List<BookBean> bookDetail = null;
		
		try {
			bookDetail = session.selectList("bookDetail",ISBN);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return bookDetail;
	}

	public int delayApply(int checkNum) {
		int data = 0;
		session = ssf.openSession();
		
		try {
			data = session.update("delayApply", checkNum);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return data;
	}
	
	
	
}
