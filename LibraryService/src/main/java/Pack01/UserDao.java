package Pack01;

import java.io.InputStream;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

interface Commend{
	int commend(SqlSession session);
}

class Proxy{
	void m1(UserDao dao, Commend c) {
		SqlSession session = dao.ssf.openSession();
				
		try {
			int result = c.commend(session);
			if (result>0) session.commit(); // 커밋을 하면 된다.
		} catch (Exception e) { e.printStackTrace(); 
		} finally { session.close(); }
	}
}

public class UserDao{
	SqlSessionFactory ssf = null;
	
	public UserDao() {
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			System.out.println("--------------------------------");
			ssf = new SqlSessionFactoryBuilder().build(is);
			System.out.println(ssf==null);
		} catch (Exception e) { e.printStackTrace(); }
	}
	
	// 유나 ----------------------------------------------------------------------------------------------------------
	// 회원가입 시, 아이디 중복 확인
	public boolean checkid(String userID) {
		SqlSession session = ssf.openSession();
		String result = session.selectOne("userCheckID", userID);
		session.close();
		if (result == null) {
			return true; // 중복된 아이디가 없는 경우, 회원가입 가능
		}
		return false; // 중복된 아이디가 있는 경우, 회원가입 불가능
	}
	
	// 회원가입 시, DB에 데이터 삽입
	public void insert(UserDTO u) {
		Proxy t = new Proxy();
		System.out.println(u.getUserID()+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		t.m1(this, new Commend() {
			public int commend(SqlSession session) {
				System.out.println("회원가입 삽입 완료");
				return session.insert("userInsert", u);
			}
		});
		System.out.println("111111111111111111111111");		
	}
	
	// 로그인 시, 정보 일치 확인
	public boolean loginPro(userLoginDTO userloginDTO) {
		System.out.println("로그인 시, 정보 일치 확인");
		SqlSession session = ssf.openSession();
		String result = session.selectOne("userCheck", userloginDTO);
		session.close();
		if (result == null) {
			return false; // 로그인 정보가 맞지 않은 경우, 로그인 불가능
		}
		return true; // 로그인 정보가 맞는 경우, 로그인 가능
	}
	
	
	// 나은 ---------------------------------------------------------------------------------------------
	public User showUser(String userID) {
		SqlSession session = ssf.openSession();
		User user = new User();
		
		try {
			user = session.selectOne("showUser",userID);
			
			System.out.println("db연결 성공");
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		System.out.println("연결실패");
		return user;
	}
	
	public int checkCount(String userID) {
		SqlSession session = ssf.openSession();
		int checkCount = 0;
		
		try {
			checkCount = session.selectOne("checkCount",userID);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return checkCount;
	}

	public int reservationCount(String userID) {
		SqlSession session = ssf.openSession();
		int reservationCount = 0;
		
		try {
			reservationCount = session.selectOne("reservationCount",userID);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return reservationCount;
	}

	public void deleteReser(int reserNum) {
		SqlSession session = ssf.openSession();
		
		System.out.println("RESER"+reserNum);
		try {
			session.delete("deleteReser",reserNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
	}
}