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

import model.dao.CustomerDao;
import model.vo.CustomerVo;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	process(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pw= request.getParameter("pw");
		String id= request.getParameter("id");
		System.out.println(id);
		System.out.println(pw);
		if(pw.equals("1234")&&id.equals("admin")){
			try {
				request.setAttribute("id", id);
				ArrayList<CustomerVo> allList = CustomerDao.getCustomers();
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}else{
			System.out.println("틀렸습니다.");
		}
	}
}

