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
		// �۾��� ����
		%>
		<script language="javascript">
			<!--
			alert( "�۾��⿡ �����߽��ϴ�.\n��� �� �ٽ� �õ��ϼ���" );
			history.back();
			//-->
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
		// �۾��� ����
		response.sendRedirect( "index.jsp" );
	}
%>