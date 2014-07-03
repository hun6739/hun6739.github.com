<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script language="javascript" src="script.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	int num = Integer.parseInt( request.getParameter( "num" ) );
	request.setAttribute("num", num);
%>

<body onload="document.modifyform.passwd.focus()">
	<p>
	<form method="post" action="modifyView.jsp" name="modifyform" onsubmit="return modifySave()">
		
		<input type="hidden" name="num" value=${num}>
		
		<table border="1" align="center" cellpadding="3" cellspacing="0">
			<tr>
				<th colspan="2" height="30">
					비밀번호를 입력해 주세요
				</th>
			</tr>
			<tr>
				<th width="100" height="30"> 비밀번호 </th>
				<td width="200">
					<input type="password" name="passwd" maxlength="12" size="12">
				</td>
			</tr>
			<tr>
				<th colspan="2" height="35">
					<input type="submit" value="확인">
					<input type="button" value="취소"
						onclick="javascript:window.location='index.jsp'">
				</th>
			</tr>
		</table>
	</form>
</body>





