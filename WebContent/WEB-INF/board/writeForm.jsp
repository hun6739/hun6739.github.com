<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<script language="javascript" src="script.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">

<body onload="document.writeform.email.focus()">
	<p>
	<form method="post" action="writePro.jsp" name="writeform" onsubmit="return writeSave()" >
	
		<table border="1" align="center" cellpadding="3" cellspacing="0">
			<tr>
				<th height="30">이&nbsp;메&nbsp;일</th>
				<td>
					<input type="text" name="email" maxlength="40" size="40">
				</td>
			</tr>
			<tr>
				<th height="30">내&nbsp;&nbsp;&nbsp;용 </th>
				<td>
					<textarea name="content" rows="10" cols="38"></textarea>
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
					<input type="submit" value="작성">
					<input type="button" value="취소"
						onclick="javascript:window.location='index.jsp'">					
				</th>
			</tr>
		
		</table>
	</form>
</body>    






