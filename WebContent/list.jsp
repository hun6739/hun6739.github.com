<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.board.bean.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.bean.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link href="style.css" rel="stylesheet" type="text/css">

<%@ include file="color.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p>
<p>


<table border="1" align="center" cellpadding="3" cellspacing="0">
	<tr>
		<td colspan="5" height="30" align="right">
			<a href="writeForm.jsp"><b>�۾���</b></a>&nbsp;(������ �۹�ȣ Ŭ��)&nbsp;
		</td>
	</tr>
	<tr>
		<th width="50" height="30"> ��ȣ </th>
		<th width="150"> �� �� �� </th>
		<th width="400"> �� �� </th>
		<th width="200"> �� �� �� </th>
	</tr>
	
	
	<c:if test="${count>0}">
		<c:forEach items="${list}" var="list">
				<tr>
					<td height="30" align="center">
						<a href="modifyForm.jsp?num=${list.num}">
							${list.num}
						</a>
					</td>
					<td align="center">
						${list.email}
					</td>
					<td align="center">
						${list.content}						
					</td>
					<td align="center">
						${list.reg_date}
					</td>
				</tr>
		</c:forEach>
	</c:if>
</table>
