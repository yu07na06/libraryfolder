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
			if (result>0) session.commit(); // Ŀ���� �ϸ� �ȴ�.
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
	
	// ���� ----------------------------------------------------------------------------------------------------------
	// ȸ������ ��, ���̵� �ߺ� Ȯ��
	public boolean checkid(String userID) {
		SqlSession session = ssf.openSession();
		String result = session.selectOne("userCheckID", userID);
		session.close();
		if (result == null) {
			return true; // �ߺ��� ���̵� ���� ���, ȸ������ ����
		}
		return false; // �ߺ��� ���̵� �ִ� ���, ȸ������ �Ұ���
	}
	
	// ȸ������ ��, DB�� ������ ����
	public void insert(UserDTO u) {
		Proxy t = new Proxy();
		System.out.println(u.getUserID()+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		t.m1(this, new Commend() {
			public int commend(SqlSession session) {
				System.out.println("ȸ������ ���� �Ϸ�");
				return session.insert("userInsert", u);
			}
		});
		System.out.println("111111111111111111111111");		
	}
	
	// �α��� ��, ���� ��ġ Ȯ��
	public boolean loginPro(userLoginDTO userloginDTO) {
		System.out.println("�α��� ��, ���� ��ġ Ȯ��");
		SqlSession session = ssf.openSession();
		String result = session.selectOne("userCheck", userloginDTO);
		session.close();
		if (result == null) {
			return false; // �α��� ������ ���� ���� ���, �α��� �Ұ���
		}
		return true; // �α��� ������ �´� ���, �α��� ����
	}
	
	
	// ���� ---------------------------------------------------------------------------------------------
	public User showUser(String userID) {
		SqlSession session = ssf.openSession();
		User user = new User();
		
		try {
			user = session.selectOne("showUser",userID);
			
			System.out.println("db���� ����");
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		System.out.println("�������");
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