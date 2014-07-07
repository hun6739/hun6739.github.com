package spring.board.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.board.bean.BoardDataBean;
import com.board.bean.BoardDBBean;

import spring.board.controller.*;

@Service
public class BoardService extends BoardController {
	@Override
	public ModelAndView listAction() throws Exception {
		int count=BoardDBBean.getInstance().getCount();
		ArrayList<BoardDataBean> articleList = BoardDBBean.getInstance().getArticles(count);	
		
		ModelAndView mav = new ModelAndView("list");
		mav.addObject("articleList", articleList);	// 셋팅된 리스트를 뷰에 포워드합니다.

		return mav;
	}
	
	@Override
	public ModelAndView writeAction(BoardDataBean article) throws Exception {

		BoardDBBean.getInstance().insertArticle(article);	
		return new ModelAndView("write");

	}
}