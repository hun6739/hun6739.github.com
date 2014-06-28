<%@page import="board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding( "euc-kr" );
%>
<jsp:useBean id="article" class="board.BoardDataBean" />
	<jsp:setProperty property="*" name="article"/>

<%
		article.setPasswd(request.getParameter("passwd"));
		article.setEmail(request.getParameter("email"));
		article.setContent(request.getParameter("content"));
		article.setReg_date( new Timestamp( System.currentTimeMillis()) );
		
%>
<%
	BoardDBBean manager = BoardDBBean.getInstance();
	int result = manager.insertArticle( article );	
	
	if( result == 0 ) {
		// 글쓰기 실패
		%>
		<script language="javascript">
			<!--
			alert( "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요" );
			history.back();
			//-->
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
		// 글쓰기 성공
		response.sendRedirect( "index.jsp" );
	}
%>