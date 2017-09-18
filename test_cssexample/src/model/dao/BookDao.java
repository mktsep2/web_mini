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
		String sql = "SELECT A.BOOKNO ,REPLACE(A.TITLE,'\"','') TITLE ,A.SUBTITLE ,A.BIGCLASS ,A.MINCLASS ,REPLACE(A.AUTHOR,'\"','') AUTHOR ,REPLACE(A.COMPANY,'\"','') COMPANY ,A.PYEAR ,A.IMGNO ,B.IMGNO ,B.IMGSOURCE FROM BOOK A, IMGSOURCE B WHERE A.IMGNO = B.IMGNO AND A.BOOKNO BETWEEN 1 AND 40";
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				allList.add(new BookVo(rset.getInt(1),rset.getString(2), rset.getString(3), rset.getString(4),rset.getString(5),rset.getString(6),rset.getString(7),rset.getInt(8),rset.getString(11)));
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

	public static void bookAdd(BookVo bvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO book VALUES(?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(9, bvo.getImgsource());
			pstmt.executeUpdate();
		} catch (SQLException s) {
			s.printStackTrace();
			throw s;
		} finally {
			DBUtil.close(con, pstmt);
		}
	}


    public static void delete(int bookno) throws SQLException{
    	Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from book where bookno=?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,bookno);
			pstmt.executeUpdate();
		} catch (SQLException s) {
			s.printStackTrace();
			throw s;
		} finally {
			DBUtil.close(con, pstmt);
		}
	}

	public static void update(BookVo bvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "UPDATE book SET title = ? , subtitle= ? ,bigclass= ? ,minclass= ?,author= ?,company= ?,pyear= ?,imgno=?  WHERE bookno = ?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bvo.getTitle());
			pstmt.setString(2, bvo.getSubtitle());
			pstmt.setString(3, bvo.getBigclass());
			pstmt.setString(4, bvo.getMinclass());
			pstmt.setString(5, bvo.getAuthor());
			pstmt.setString(6, bvo.getCompany());
			pstmt.setInt(7, bvo.getPyear());
			pstmt.setString(8, bvo.getImgsource());
			pstmt.setInt(9, bvo.getBookno());

			pstmt.executeQuery();

		} catch (SQLException s) {
			s.printStackTrace();
			throw s;
		} finally {
			DBUtil.close(con, pstmt);
		}
	}


}
