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
		// ���� ���� 
		%>
		<script language="javascript">
			<!--
			alert( "�ۼ����� �����߽��ϴ�.\n��� �� �ٽ� �õ��ϼ���" );
			// -->
		</script>
		<%
	} else if(result == -1) {
		// �̸��� ����
		%>
		<script language="javascript">
			<!--
			alert( "�̸��� ������ Ȯ���ϼ���" );
			history.back();
			//-->
		</script>
		<%
	} else {
		// ���� ����
		response.sendRedirect( "index.jsp");		
	}
%>