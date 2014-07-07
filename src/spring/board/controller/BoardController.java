package spring.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.board.bean.BoardDataBean;

@Controller	// 컨트롤러 등록
public abstract class BoardController {
	@RequestMapping("/list")	// url 맵핑
	public abstract ModelAndView listAction() throws Exception;
                                                               // Restful : url에서 파라미터 가져오기

	@RequestMapping("/writePro")
	public abstract ModelAndView writeAction(	@ModelAttribute BoardDataBean article) throws Exception;
	// 폼에서 넘어온 값 자동으로 빈에 셋팅
}