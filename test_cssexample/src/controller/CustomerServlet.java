package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CustomerDao;
import model.vo.CustomerVo;

//모든 요청을 받고 처리하는 메인 controller 클래스
//html or jsp등의 모든 요청 수락 -> 처리 -> 결과값 출력 지시 
//servlet은 반드시 web.xml에 url 매핑 

@WebServlet("/cust")
public class CustomerServlet extends HttpServlet {       
   
	private static final long serialVersionUID = 1L;

	public CustomerServlet() {
        super();      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String command = request.getParameter("command");
		System.out.println(command);
	if(command.equals("insert")){
			insert(request, response);
		}else if(command.equals("delete")){
			delete(request, response);
		}else if(command.equals("update")){			
			update(request, response);
		}else if(command.equals("allView")){
			getCustomers(request, response);
		}else if(command.equals("loginUser")){
			loginUser(request, response);
		}
	}
	
	public void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id").trim();
		String pw = request.getParameter("pw").trim();
		HttpSession	session = request.getSession();
		System.out.println(id);
		System.out.println(pw);
		
		String url = null;	
		try {			
			CustomerVo cvo = CustomerDao.loginUser(id, pw);
			if (cvo !=null) {
				if (id.equals(cvo.getId()) && pw.equals(cvo.getPassword())) {
					System.out.println(cvo);
					session.setAttribute("cvo", cvo);
					session.setAttribute("id", id);
//				request.setAttribute("cvo", cvo);
					url = "loginUser.jsp";
				} 
			} else {
				request.setAttribute("error", "아이디 또는 비밀번호 오류");
				url = "error.jsp";
			}
		} catch (SQLException e) {		
			request.setAttribute("error", "로그인 실패");
			url = "error.jsp";
			e.printStackTrace();
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);		
		rdp.forward(request, response);
	}
	
	/** insert -> db에 저장 -> select후 -> 저장한 정보 보기 
	 * 회원 가입 메소드 
	 * 1. Client가 보내온 데이터를 받아 DAO를 통해 DB에 입력한다.
	 * 2. 처리 결과에 따라 
	 * 		2-1. 입력에 실패하면 error.jsp로 수행을 넘긴다.
	 *		2-2. 정상적으로 입력을 성공했으면 입력한 글내용을 보여주는 JSP(view.jsp)로 이동한다.	 *        
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id").trim();
		String password = request.getParameter("password").trim();
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();		
		CustomerVo cvo = new CustomerVo(id, password, name, email);
		HttpSession	session = request.getSession();
		String url = null;	
		try {			
			CustomerDao.insert(cvo);			
			session.setAttribute("cvo", cvo);
			url = "index.html";
		} catch (SQLException e) {		
			request.setAttribute("error", "회원가입 실패");
			url = "error.jsp";
			e.printStackTrace();
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);		
		rdp.forward(request, response);
	}	
	/**
	 * 회원 탈퇴 즉 삭제 메소드
	 * 1. 탈퇴시켜려 하는 client의 id값으로 삭제한다.
	 * 2. 처리 결과에 따라 
	 * 	2-1. 입력에 실패하면 error.jsp로 수행을 넘긴다.
	 *  2-2. 정상적으로 삭제 성공했으면 글목록을 보여주는 JSP(list.jsp)가 출력 되도록 한다.
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id").trim();
		String url = null;	
		System.out.println("탈퇴2");
		System.out.println("id" + id);
		try {			
			CustomerDao.delete(id);	
			System.out.println(2);
			url = "index.html";
			System.out.println(3);
		} catch (SQLException e) {		
			request.setAttribute("error", "탈퇴 실패");
			url = "error.jsp";
			e.printStackTrace();
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);		
		rdp.forward(request, response);  
	}	
	
	
	/**
	 * 가입된 회원 정보 update 메소드
	 * 1. update.jsp로 호출되는 메소드로 pw와 email값만 업데이트 가능하다.
	 * 2. 처리 결과에 따라 
		* 	2-1. 입력에 실패하면 error.html로 수행을 넘긴다.
		*  2-2. 정상적으로 삭제 성공했으면 단순 성공 메세지가 출력되는 JSP(updateSuccess.jsp)가 실행 되도록 한다.
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id").trim();
		String password = request.getParameter("password").trim();
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		System.out.println("id" + id);
		HttpSession	session = request.getSession();
		CustomerVo cvo = new CustomerVo(id, password, name, email);
		String url = null;	
		try {			
			CustomerDao.update(cvo);			
			session.setAttribute("cvo", cvo);
			url = "loginUser.jsp";
		} catch (SQLException e) {		
			request.setAttribute("error", "수정 실패");
			url = "error.jsp";
			e.printStackTrace();
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);		
		rdp.forward(request, response);
					
	}
	
	/**
	 * 가입된 모든 회원 정보 검색 메소드
	 * 1. 다수의 jsp로 호출되는 메소드로 모든 고객 정보를 DAO로 부터 받아온다
	 * 2. 처리 결과에 따라 
		* 	2-1. 입력에 실패하면 error.jsp로 수행을 넘긴다.
		*  2-2. 정상적으로 Dao로부터 받아온 값이 있다면 JSP(list.jsp)가 실행되도록 한다
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;		
		try {			
			ArrayList<CustomerVo> allList = CustomerDao.getCustomers();		
			System.out.println(allList);
			request.setAttribute("allList", allList);
			url = "asdasdasd.jsp";
			
		} catch (SQLException e) {			
			request.setAttribute("error", "모든 고객 검색 실패");
			url = "error.jsp";
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);
		rdp.forward(request, response);
	}
}
