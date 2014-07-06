package com.board.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.bean.BoardDBBean;
import com.board.bean.BoardDataBean;
import com.board.controller.CommandAction;

public class ListAction  implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		BoardDBBean manager = BoardDBBean.getInstance();
		int count = manager.getCount();
		request.setAttribute("count", count);
		
		ArrayList <BoardDataBean> list = manager.getArticles( count );
		/*ArrayList <String> time = new ArrayList <String> ();
		
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );
		for( int i=0; i<list.size(); i++ ) {
			time.set(i, sdf.format( list.get(i).getReg_date()) );
		}
		request.setAttribute("time", time);*/
		request.setAttribute("list", list);
		
		return "list.jsp";
	}
	
}
