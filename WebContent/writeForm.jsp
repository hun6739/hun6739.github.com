<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script language="javascript" src="script.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">

<body onload="document.writeform.email.focus()">
	<p>
	<form method="post" action="writePro.jsp" name="writeform" onsubmit="return writeSave()" >
	
		<table border="1" align="center" cellpadding="3" cellspacing="0">
			<tr>
				<th height="30">��&nbsp;��&nbsp;��</th>
				<td>
					<input type="text" name="email" maxlength="40" size="40">
				</td>
			</tr>
			<tr>
				<th height="30">��&nbsp;&nbsp;&nbsp;�� </th>
				<td>
					<textarea name="content" rows="10" cols="38"></textarea>
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
					<input type="submit" value="�ۼ�">
					<input type="button" value="���"
						onclick="javascript:window.location='index.jsp'">					
				</th>
			</tr>
		
		</table>
	</form>
</body>    






