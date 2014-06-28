<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.File"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding( "euc-kr" );
%>  
<jsp:useBean id="article" class="board.BoardDataBean"/>
	<jsp:setProperty property="*" name="article"/>
<%
	article.setNum(Integer.parseInt(request.getParameter("num") ) );
	article.setPasswd(request.getParameter("passwd"));
	article.setEmail(request.getParameter("email"));
	article.setContent(request.getParameter("content"));
	article.setMod_date( new Timestamp( System.currentTimeMillis()) );
%>	
<%
	BoardDBBean manager = BoardDBBean.getInstance();
	int result = manager.updateArticle( article );
	if( result == 0 ) {
		// 수정 실패 
		%>
		<script language="javascript">
			<!--
			alert( "글수정에 실패했습니다.\n잠시 후 다시 시도하세요" );
			// -->
		</script>
		<%
	} else if(result == -1) {
		// 이메일 오류
		%>
		<script language="javascript">
			<!--
			alert( "이메일 형식을 확인하세요" );
			history.back();
			//-->
		</script>
		<%
	} else {
		// 수정 성공
		response.sendRedirect( "index.jsp");		
	}
%>