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
	
	// 유나-------------------------------------------------------------------------------
	@RequestMapping("/load") // 길찾기 클릭시, 화면
	public String load() {
		return "loadView";
	}
	@RequestMapping("/login") // 로그인 화면
	public String login() {
		return "loginView";
	}
	@RequestMapping("/join") // 회원가입 화면
	public String join() {
		return "joinView";
	}
	
	@RequestMapping("/loginPro") // 로그인 실행(성공 여부에 따른 뷰 변환)
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
			System.out.println("관리자 로그인");
			loginResult = adminDao.loginPro(adminloginDTO); // 관리자 로그인 성공 여부 확인
			if(loginResult==true) {
				this.httpSession=httpSession;
				this.httpSession.setAttribute("SessionID", adminloginDTO.getAdminID());
				this.httpSession.setAttribute("flag", "A");
			}
		}else {
			System.out.println("사용자 로그인");
			loginResult = userDao.loginPro(userloginDTO); // 사용자 로그인 성공 여부 확인
			if(loginResult==true) {
				this.httpSession=httpSession;
				this.httpSession.setAttribute("SessionID", userloginDTO.getUserID());
				this.httpSession.setAttribute("flag", "U");
			}
		}
		System.out.println((loginResult==true)?"로그인 성공":"로그인 실패");
		model.addAttribute("loginSuccess", loginResult);
		return (loginResult==true)? "redirect:/": "loginView";
	}
	
	@RequestMapping("/joinPro") // 회원가입 실행
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
	    
	    if(m) {//사용할 수 있다. db에서 찾았는데없으니까
	        message = "success";
	    }else {//사용할 수 없다.
	        message ="fail";
	    }	
	    return message;
	}
	
	@RequestMapping("/logout") // 로그아웃
	public String joinPro() {
		System.out.println("로그아웃");
		this.httpSession.setAttribute("SessionID", null);
		return "redirect:/";
	}
	
	@RequestMapping("/adminpage") // 관리자페이지
	public String adminpage() {
		System.out.println("관리자 페이지 진입");
		
		return "adminpageView";
	}


	// 나은------------------------------------------------------------------------------
		@RequestMapping("/notice")
		public String notice() {
			return "noticeView";
		}
		@RequestMapping("/mypage")
		public String mypage(Model model) {
			// session의 id 들고옴
			// id 로 user테이블 조회 list
			// 예약, 대출테이블에서 카운팅 int
			// view 페이지로 결과 던져주기
			
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
	
	//// 진현------------------------------------------------------------------------------
	@RequestMapping("/introduce")
	public String introduce() {
		return "introduceView";
	}
	
	///진웅------------------------------------------------------------------------------
	@RequestMapping("/search")
	public String search() {
		return "searchView";
	}
	@RequestMapping("/bestBook")
	public String bestBook() {
		return "bestBookView";
	}
}
