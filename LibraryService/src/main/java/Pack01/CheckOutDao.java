package Pack01;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

interface Commend2{
	int commend(SqlSession session);
}

class Proxy2{
	void m1(CheckOutDao dao, Commend2 c) {
		SqlSession session = dao.ssf.openSession();
				
		try {
			int result = c.commend(session);
			if (result>0) session.commit(); // Ŀ���� �ϸ� �ȴ�.
		} catch (Exception e) { e.printStackTrace(); 
		} finally { session.close(); }
	}
}

public class CheckOutDao{
	SqlSessionFactory ssf = null;
	
	public CheckOutDao() {
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			System.out.println("--------------------------------");
			ssf = new SqlSessionFactoryBuilder().build(is);
			System.out.println(ssf==null);
		} catch (Exception e) { e.printStackTrace(); }
	}
	
//	// ȸ������ ��, ���̵� �ߺ� Ȯ��
//	public boolean checkid(String userID) {
//		SqlSession session = ssf.openSession();
//		String result = session.selectOne("userCheckID", userID);
//		session.close();
//		if (result == null) {
//			return true; // �ߺ��� ���̵� ���� ���, ȸ������ ����
//		}
//		return false; // �ߺ��� ���̵� �ִ� ���, ȸ������ �Ұ���
//	}
	
//	// ȸ������ ��, DB�� ������ ����
//	public void insert(UserDTO u) {
//		Proxy2 t = new Proxy2();
//		System.out.println(u.getUserID()+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		t.m1(this, new Commend2() {
//			public int commend(SqlSession session) {
//				System.out.println("ȸ������ ���� �Ϸ�");
//				return session.insert("userInsert", u);
//			}
//		});
//		System.out.println("111111111111111111111111");		
//	}
	
	// ������ ���
	public void showPro(checkOutDTO checkoutDTO) {
		System.out.println("������ ��� ����");
		SqlSession session = ssf.openSession();
		List<String> result = session.selectList("conCheckOUt", checkoutDTO);

		
	}
}