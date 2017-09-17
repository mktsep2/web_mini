package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.vo.BookVo;
import model.vo.CustomerVo;
import util.DBUtil;

public class BookDao {
	public static ArrayList<BookVo> getBooks() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<BookVo>  allList = new ArrayList<>();
		String sql = "select  * from book,IMGSOURCE where book.IMGNO=IMGSOURCE.IMGNO and bookno between 1 and 40";
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				allList.add(new BookVo(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),rset.getString(5),rset.getString(6),rset.getString(7),rset.getInt(8),rset.getString(11)));
			}
			System.out.println(allList);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			throw sqle;
		} finally {
			DBUtil.close(conn, pstmt, rset);
		}
		return allList;
	}

	public static void insert(BookVo bvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO customer VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bvo.getBookno());
			pstmt.setString(2, bvo.getTitle());
			pstmt.setString(3, bvo.getSubtitle());
			pstmt.setString(4, bvo.getBigclass());
			pstmt.setString(5, bvo.getMinclass());
			pstmt.setString(6, bvo.getAuthor());
			pstmt.setString(7, bvo.getCompany());
			pstmt.setInt(8, bvo.getPyear());
			pstmt.setString(9,"book"+bvo.getBookno());
			pstmt.executeUpdate();
		} catch (SQLException s) {
			s.printStackTrace();
			throw s;
		} finally {
			DBUtil.close(con, pstmt);
		}
	}


    public static void delete(String id) throws SQLException{
    	Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from customer where id=?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		} catch (SQLException s) {
			s.printStackTrace();
			throw s;
		} finally {
			DBUtil.close(con, pstmt);
		}
	}

	public static void update(CustomerVo cvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "UPDATE customer SET password = ? , email = ? WHERE id = ?";
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cvo.getPassword());
			pstmt.setString(2, cvo.getEmail());
			pstmt.setString(3, cvo.getId());

			pstmt.executeQuery();

		} catch (SQLException s) {
			s.printStackTrace();
			throw s;
		} finally {
			DBUtil.close(con, pstmt);
		}
	}


}
