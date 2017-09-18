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

import model.vo.BookVo;
import model.vo.CustomerVo;
import model.dao.BookDao;
import model.dao.CustomerDao;
@WebServlet("/book")
public class BookServlet extends HttpServlet {
    public BookServlet() {
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
		String command=request.getParameter("command").trim();
		if(command.equals("bookList")){
			getBookData(request, response);
		}else if(command.equals("bookAdd")){
			bookAdd(request, response);
		}else if(command.equals("bookUpdate")){	
			bookUpdate(request, response);
		}else if(command.equals("bookDelete")){
			bookDelete(request, response);
		}else if(command.equals("loginUser")){
			
		}
		
	}
	
	public void getBookData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;		
		try {		
			ArrayList<BookVo> allList = BookDao.getBooks();	
			System.out.println(allList);
			request.setAttribute("allList", allList);
			url = "booklist.jsp";
			
		} catch (SQLException e) {			
			request.setAttribute("error", "sad");
			url = "error.jsp";
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);
		rdp.forward(request, response);
	}
	
	public void bookAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookno = (Integer.parseInt(request.getParameter("bookno").trim()));
		String title = request.getParameter("title").trim();
		String subtitle = request.getParameter("subtitle").trim();
		String bigclass = request.getParameter("bigclass").trim();		
		String minclass = request.getParameter("minclass").trim();		
		String author = request.getParameter("author").trim();		
		String company = request.getParameter("company").trim();		
		int pyear = (Integer.parseInt(request.getParameter("pyear").trim()));		
//		String imgsource = request.getParameter("imgsource").trim();		
		BookVo bvo = new BookVo(bookno, title, subtitle, bigclass, minclass, author, company, pyear, "book"+bookno);
		HttpSession	session = request.getSession();
		String url = null;	
		try {			
			BookDao.bookAdd(bvo);			
			session.setAttribute("bvo", bvo);
			url = "admin.jsp";
		} catch (SQLException e) {		
			request.setAttribute("error", "도서 추가 실패");
			url = "error.jsp";
			e.printStackTrace();
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);		
		rdp.forward(request, response);
	}
	public void bookUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookno = (Integer.parseInt(request.getParameter("bookno").trim()));
		String title = request.getParameter("title").trim();
		String subtitle = request.getParameter("subtitle").trim();
		String bigclass = request.getParameter("bigclass").trim();		
		String minclass = request.getParameter("minclass").trim();		
		String author = request.getParameter("author").trim();		
		String company = request.getParameter("company").trim();		
		int pyear = (Integer.parseInt(request.getParameter("pyear").trim()));		
//		String imgsource = request.getParameter("imgsource").trim();		
		BookVo bvo = new BookVo(bookno, title, subtitle, bigclass, minclass, author, company, pyear, "book"+bookno);
		HttpSession	session = request.getSession();
		String url = null;	
		try {			
			BookDao.update(bvo);
			session.setAttribute("bvo", bvo);
			url = "admin.jsp";
		} catch (SQLException e) {		
			request.setAttribute("error", "도서 수정 실패");
			url = "error.jsp";
			e.printStackTrace();
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);		
		rdp.forward(request, response);
	}
	
	public void bookDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookno = request.getParameter("bookno");
		String url = null;	
		
		System.out.println("bookno" + bookno);
		try {			
			BookDao.delete(Integer.parseInt(bookno));	
			url = "admin.jsp";
			System.out.println(3);
		} catch (SQLException e) {		
			request.setAttribute("error", "도서 삭제 실패");
			url = "error.jsp";
			e.printStackTrace();
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);		
		rdp.forward(request, response);  
	}	
}
