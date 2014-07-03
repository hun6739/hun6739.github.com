package com.board.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	public static BoardDBBean getInstance() {
		return instance;
	}	
	
	public int getCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String url="jdbc:cubrid:127.0.0.1:30000:guestroom:dba::";
			String user="dba";
			String passwd="1234";
			
			try {
				Class.forName("cubrid.jdbc.driver.CUBRIDDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
				
			con=DriverManager.getConnection(url,user,passwd);
			
			String sql = "select count(*) from guestroom";
			pstmt = con.prepareStatement( sql );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				count = rs.getInt( 1 );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}
		return count;
}
	
	public ArrayList <BoardDataBean> getArticles( int count ) {
		ArrayList <BoardDataBean> list = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String url="jdbc:cubrid:127.0.0.1:30000:guestroom:dba::";
		String user="dba";
		String passwd="1234";
		
		try {
			try {
				Class.forName("cubrid.jdbc.driver.CUBRIDDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con=DriverManager.getConnection(url,user,passwd);
			
			String sql = "select * from guestroom ";
			sql+= "order by num desc";
			
			pstmt = con.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				list = new ArrayList <BoardDataBean>(count);
				
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum( rs.getInt( "num" ) );
					article.setPasswd( rs.getString( "passwd" ));
					article.setEmail( rs.getString( "email" ));
					article.setReg_date( rs.getTimestamp( "reg_date"));
					article.setContent( rs.getString( "content" ));
					
					list.add( article );
					
				} while( rs.next() );			
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}		
		return list;
	}
	
	public BoardDataBean getArticle( int num ) {
		BoardDataBean article = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String url="jdbc:cubrid:127.0.0.1:30000:guestroom:dba::";
		String user="dba";
		String passwd="1234";
		
		try {
			try {
				Class.forName("cubrid.jdbc.driver.CUBRIDDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con=DriverManager.getConnection(url,user,passwd);
			
			String sql = "select * from guestroom where num=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setInt( 1, num );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				article = new BoardDataBean();
				article.setEmail( rs.getString( "email").trim());
				article.setContent( rs.getString( "content").trim());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}		
		return article;
	}
	
	
	public int insertArticle( BoardDataBean article ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Pattern p= Pattern.compile("\\w+[@]\\w+\\.\\w+");
		Matcher m = p.matcher(article.getEmail());
		
		if(!m.find()){
			return -1;
		}
		
		String url="jdbc:cubrid:127.0.0.1:30000:guestroom:dba::";
		String user="dba";
		String passwd="1234";
		try {
			try {
				Class.forName("cubrid.jdbc.driver.CUBRIDDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con=DriverManager.getConnection(url,user,passwd);
			String sql = null;
			
			sql="select * from guestroom";
			pstmt = con.prepareStatement( sql );
			rs = pstmt.executeQuery();

			sql = "insert into guestroom (passwd,email,content,reg_date) ";
			sql+="values(?,?,?,?)";
			pstmt = con.prepareStatement( sql );
			pstmt.setString( 1, article.getPasswd() );
			pstmt.setString( 2, article.getEmail() );
			pstmt.setString( 3, article.getContent() );
			pstmt.setTimestamp( 4, article.getReg_date() );
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}
		return result;
	}	
	
	public int checkArticle( int num, String pass ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String url="jdbc:cubrid:127.0.0.1:30000:guestroom:dba::";
		String user="dba";
		String passwd="1234";
		
		try {
			try {
				Class.forName("cubrid.jdbc.driver.CUBRIDDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con=DriverManager.getConnection(url,user,passwd);
			
			String sql = "select * from guestroom where num=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				if( pass.equals( rs.getString( "passwd" ).trim() ) ) {
					result = 1;
				} else {
					result = -1;	
				}
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}		
		return result;
	}
	
	public int updateArticle( BoardDataBean article ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		Pattern p= Pattern.compile("\\w+[@]\\w+\\.\\w+");
		Matcher m = p.matcher(article.getEmail());
		
		if(!m.find()){
			return -1;
		}
		
		String url="jdbc:cubrid:127.0.0.1:30000:guestroom:dba::";
		String user="dba";
		String passwd="1234";
		
		try {
			try {
				Class.forName("cubrid.jdbc.driver.CUBRIDDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con=DriverManager.getConnection(url,user,passwd);
			
			String sql = "select * from guestroom";
			pstmt = con.prepareStatement( sql );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				sql = "update guestroom set email=?, content=?, passwd=?, mod_date=? where num=?";
				pstmt = con.prepareStatement( sql );
				pstmt.setString( 1, article.getEmail() );
				pstmt.setString( 2, article.getContent() );
				pstmt.setString( 3, article.getPasswd() );
				pstmt.setTimestamp(4, article.getMod_date() );
				pstmt.setInt(5, article.getNum());
				
				result=pstmt.executeUpdate();
			}
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}
		return result;
	}
}








