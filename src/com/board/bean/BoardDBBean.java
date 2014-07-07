package com.board.bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.board.db.sqlconfig.IBatisDBConnector;
import com.ibatis.sqlmap.client.SqlMapClient;

public class BoardDBBean {
	private static BoardDBBean _instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
	    _instance.SetDB();
	    return _instance;
	}  
	
	private SqlMapClient myDB;
	
	private void SetDB() {
	    myDB = IBatisDBConnector.getSqlMapInstance();
	}
	private SqlMapClient GetDB() {
	    return myDB;
	}
	
	
	public int getCount() throws SQLException {
		int count = 0;
		count = (int)GetDB().queryForObject("getCount", null);
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList <BoardDataBean> getArticles( int count ) throws SQLException {
		
		ArrayList <BoardDataBean> list = null;
		list = (ArrayList<BoardDataBean>)GetDB().queryForList("getArticles", null);
	    return list;
	}
	
	public BoardDataBean getArticle( int num ) throws SQLException {
		BoardDataBean article = new BoardDataBean();
		article = (BoardDataBean)GetDB().queryForObject("getArticle", num);
		
		article.setEmail(article.getEmail().trim());
		article.setContent(article.getContent().trim());
		
		return article;
	}
	
	
	public int insertArticle( BoardDataBean article ) throws SQLException {
		
		Pattern p= Pattern.compile("\\w+[@]\\w+\\.\\w+");
		Matcher m = p.matcher(article.getEmail());
		
		if(!m.find()){
			return -1;
		}
		
		GetDB().insert("insertArticle", article);
		return 1;
	}	
	
	public int checkArticle( int num, String pass ) throws SQLException {
		String passwd = null;
		passwd = (String)GetDB().queryForObject("checkArticle", num);
		
		if( pass.equals( passwd.trim() ) ) {
			return 1;
		} else {
			return -1;	
		}
	}
	
	public int updateArticle( BoardDataBean article ) throws SQLException {
		
		Pattern p= Pattern.compile("\\w+[@]\\w+\\.\\w+");
		Matcher m = p.matcher(article.getEmail());
		
		if(!m.find()){
			return -1;
		}
		GetDB().update("updateArticle", article);
		
		return 1;
	}
}








