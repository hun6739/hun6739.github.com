<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="script.js"></script>

<%
	int num = Integer.parseInt( request.getParameter( "num" ) );
	String passwd = request.getParameter( "passwd" );
%>
<%
	BoardDBBean manager = BoardDBBean.getInstance();
	int result = manager.checkArticle( num, passwd );

	if( result == 1 ) {
		// ��й�ȣ�� ����
		BoardDataBean article = manager.getArticle( num );		
		%>
		<body onload="document.modifyview.email.focus()">
			<p>
			<form method="post" action="modifyPro.jsp" name="modifyview" onsubmit="return modifyViewSave()">
				
				<input type="hidden" name="num" value="<%=num%>">
			
				<table border="1" align="center" cellpadding="3" cellspacing="0">
					<tr>
						<th colspan="2" height="30">
							������ ������ �Է��� �ּ���
						</th>
					</tr>
					<tr>
						<th height="30">��&nbsp;��&nbsp;��</th>
						<td>
							<input type="text" name="email" maxlength="50" size="40" value="<%=article.getEmail()%>">
						</td>
					</tr>
					<tr>
						<th height="30">��&nbsp;&nbsp;&nbsp;�� </th>
						<td>
							<textarea name="content" rows="10" cols="38"><%=article.getContent()%></textarea>
						</td>	
					</tr>
					<tr>
						<th height="30">��й�ȣ </th>
						<td>
							<input type="password" name="passwd" maxlength="12" size="12">
						</td>
					</tr>
					<tr>
						<th colspan="2" height="35">
							<input type="submit" value="����">
							<input type="button" value="���"
						onclick="javascript:window.location='index.jsp'">
						</th>
					</tr>				
				
				</table>				
			</form>		
		</body>
		<%		
	} else {
		// ��й�ȣ�� �ٸ���.
		%>
		<script language="javascript">
			<!--
			alert( "��й�ȣ�� �ٸ��ϴ�.\n��й�ȣ�� �ٽ� Ȯ���ϼ���" );
			history.back();
			//-->
		</script>		
		<%		
	}
%>









