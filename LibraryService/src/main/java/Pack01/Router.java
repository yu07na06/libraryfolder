package Pack01;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class Router {
	UserDao userDao = new UserDao();
	AdminDao adminDao = new AdminDao();
	HttpSession httpSession;
	
	// ����-------------------------------------------------------------------------------
	@RequestMapping("/load") // ��ã�� Ŭ����, ȭ��
	public String load() {
		return "loadView";
	}
	@RequestMapping("/login") // �α��� ȭ��
	public String login() {
		return "loginView";
	}
	@RequestMapping("/join") // ȸ������ ȭ��
	public String join() {
		return "joinView";
	}
	
	@RequestMapping("/loginPro") // �α��� ����(���� ���ο� ���� �� ��ȯ)
	public String loginPro(
			HttpServletRequest request,
			Model model, 
			HttpSession httpSession, 
			userLoginDTO userloginDTO,
			adminLoginDTO adminloginDTO
			) {

		String id = request.getParameter("userID");
		
		boolean loginResult;
		if(id.equals("")) {
			System.out.println("������ �α���");
			loginResult = adminDao.loginPro(adminloginDTO); // ������ �α��� ���� ���� Ȯ��
			if(loginResult==true) {
				this.httpSession=httpSession;
				this.httpSession.setAttribute("SessionID", adminloginDTO.getAdminID());
				this.httpSession.setAttribute("flag", "A");
			}
		}else {
			System.out.println("����� �α���");
			loginResult = userDao.loginPro(userloginDTO); // ����� �α��� ���� ���� Ȯ��
			if(loginResult==true) {
				this.httpSession=httpSession;
				this.httpSession.setAttribute("SessionID", userloginDTO.getUserID());
				this.httpSession.setAttribute("flag", "U");
			}
		}
		System.out.println((loginResult==true)?"�α��� ����":"�α��� ����");
		model.addAttribute("loginSuccess", loginResult);
		return (loginResult==true)? "redirect:/": "loginView";
	}
	
	@RequestMapping("/joinPro") // ȸ������ ����
	public String joinPro(UserDTO u) {
		userDao.insert(u);
		return "loginView";
	}
	
	@ResponseBody
	@RequestMapping(value="/idcheck", method= RequestMethod.POST)
	public String idcheck(UserDTO id){
		System.out.println(id.getUserID());
		
	    boolean m = userDao.checkid(id.getUserID());
	    String message=null;
	    
	    if(m) {//����� �� �ִ�. db���� ã�Ҵµ������ϱ�
	        message = "success";
	    }else {//����� �� ����.
	        message ="fail";
	    }	
	    return message;
	}
	
	@RequestMapping("/logout") // �α׾ƿ�
	public String joinPro() {
		System.out.println("�α׾ƿ�");
		this.httpSession.setAttribute("SessionID", null);
		return "redirect:/";
	}
	
	@RequestMapping("/adminpage") // ������������
	public String adminpage() {
		System.out.println("������ ������ ����");
		
		return "adminpageView";
	}


	// ����------------------------------------------------------------------------------
		@RequestMapping("/notice")
		public String notice() {
			return "noticeView";
		}
		@RequestMapping("/mypage")
		public String mypage(Model model) {
			// session�� id ����
			// id �� user���̺� ��ȸ list
			// ����, �������̺��� ī���� int
			// view �������� ��� �����ֱ�
			
			UserDao dao = new UserDao();
			String id = (String)this.httpSession.getAttribute("SessionID");
			User userOne = dao.showUser(id);
			model.addAttribute("userOne",userOne);
			
			int checkCount = dao.checkCount(id);
			model.addAttribute("checkCount",checkCount);
			
			int reservationCount = dao.reservationCount(id);
			model.addAttribute("reservationCount",reservationCount);
					
			
			return "mypageView";
		}
		@RequestMapping("/faq")
		public String faq() {
			return "faq";
		}
		@RequestMapping("/help")
		public String help() {
			return "helpView";
		}
		
		@RequestMapping("/checkout")
		public String checkout(Model model) {
			
			BookDAO dao = new BookDAO();
			String id = (String)this.httpSession.getAttribute("SessionID");
			List<CheckOutBean> checkList = dao.checkList(id);
			model.addAttribute("checkList",checkList);
			
			UserDao udao = new UserDao();
			int checkCount = udao.checkCount(id);
			model.addAttribute("checkCount",checkCount);
			
			
			System.out.println(checkCount);
			
			System.out.println("check controller");
			
			return "checkoutView";
		}
		
		@RequestMapping("/reservation")
		public String reservation(Model model) {
			
			BookDAO dao = new BookDAO();
			String id = (String)this.httpSession.getAttribute("SessionID");
			List<BookBean> reserList = dao.reserList(id);
			model.addAttribute("reserList",reserList);
			
			UserDao udao = new UserDao();
			int reservationCount = udao.reservationCount(id);
			model.addAttribute("reservationCount",reservationCount);
			
			return "reservationView";
			
		}
		@RequestMapping("deleteReser")
		public String deleteReser(Model model, int reserNum) {
			
			UserDao dao = new UserDao();
			
			dao.deleteReser(reserNum);
			
			
			return "reservationView";
		}
		
		@RequestMapping("bookDetail")
		public String bookDetail(Model model , int ISBN){
			BookDAO dao = new BookDAO();
			List<BookBean> detailBook = dao.bookDetail(ISBN);
		//	BookBean detailBook = dao.bookDetail(ISBN);
			
			model.addAttribute("detailBook",detailBook);
			
			return "bookDetailView";
		}
		
		@RequestMapping("delay")
		public String delayApply(Model model, HttpServletRequest request) {
			int data=0;
			int checkNum = Integer.parseInt(request.getParameter("checkNum"));
			System.out.println("check"+checkNum);
			BookDAO dao = new BookDAO();
			data = dao.delayApply(checkNum);
			
			System.out.println(data);
			
			model.addAttribute("data",data);
			
			return "data";
		}
	
	//// ����------------------------------------------------------------------------------
	@RequestMapping("/introduce")
	public String introduce() {
		return "introduceView";
	}
	
	///����------------------------------------------------------------------------------
	@RequestMapping("/search")
	public String search() {
		return "searchView";
	}
	@RequestMapping("/bestBook")
	public String bestBook() {
		return "bestBookView";
	}
}
