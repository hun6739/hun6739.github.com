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
		// 비밀번호가 같다
		BoardDataBean article = manager.getArticle( num );		
		%>
		<body onload="document.modifyview.email.focus()">
			<p>
			<form method="post" action="modifyPro.jsp" name="modifyview" onsubmit="return modifyViewSave()">
				
				<input type="hidden" name="num" value="<%=num%>">
			
				<table border="1" align="center" cellpadding="3" cellspacing="0">
					<tr>
						<th colspan="2" height="30">
							수정할 정보를 입력해 주세요
						</th>
					</tr>
					<tr>
						<th height="30">이&nbsp;메&nbsp;일</th>
						<td>
							<input type="text" name="email" maxlength="50" size="40" value="<%=article.getEmail()%>">
						</td>
					</tr>
					<tr>
						<th height="30">내&nbsp;&nbsp;&nbsp;용 </th>
						<td>
							<textarea name="content" rows="10" cols="38"><%=article.getContent()%></textarea>
						</td>	
					</tr>
					<tr>
						<th height="30">비밀번호 </th>
						<td>
							<input type="password" name="passwd" maxlength="12" size="12">
						</td>
					</tr>
					<tr>
						<th colspan="2" height="35">
							<input type="submit" value="수정">
							<input type="button" value="취소"
						onclick="javascript:window.location='index.jsp'">
						</th>
					</tr>				
				
				</table>				
			</form>		
		</body>
		<%		
	} else {
		// 비밀번호가 다르다.
		%>
		<script language="javascript">
			<!--
			alert( "비밀번호가 다릅니다.\n비밀번호를 다시 확인하세요" );
			history.back();
			//-->
		</script>		
		<%		
	}
%>









