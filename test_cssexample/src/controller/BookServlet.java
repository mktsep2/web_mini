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
		
		String command=request.getParameter("command").trim();
		if(command.equals("insert")) insert(request, response);
		else if(command.equals("list")){
			getBookData(request, response);
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
	
	public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookVo bvo=new BookVo(Integer.parseInt(request.getParameter("bookno").trim()), request.getParameter("title").trim(), request.getParameter("subtitle").trim(), request.getParameter("bigclass").trim(), request.getParameter("minclass").trim(), request.getParameter("author").trim(), request.getParameter("company").trim(),Integer.parseInt(request.getParameter("pyear").trim()),"");
		String url = null;	
		try {			
			System.out.println(bvo);
			BookDao.insert(bvo);			
			url = "javascript:alert('success!');";
		} catch (SQLException e) {		
			request.setAttribute("error", "회원가입 실패");
			url = "error.jsp";
			e.printStackTrace();
		}
		RequestDispatcher rdp = request.getRequestDispatcher(url);		
		rdp.forward(request, response);
	}	
	
}
