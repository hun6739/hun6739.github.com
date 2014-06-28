<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link href="style.css" rel="stylesheet" type="text/css">

<%@ include file="color.jsp" %>
<p>
<p>
<%
	BoardDBBean manager = BoardDBBean.getInstance();
	int count = manager.getCount();	
%>


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
		<th width="150"> �� �� �� </th>
	</tr>
	<%
		if( count > 0 ) {
			// ���� �ִ� ���
			ArrayList <BoardDataBean> list = manager.getArticles( count );
			for( int i=0; i<list.size(); i++ ) {
				%>
				<tr>
					<td height="30" align="center">
						<a href="modifyForm.jsp?num=<%=list.get(i).getNum()%>">
							<%=list.get(i).getNum()%>
						</a>
					</td>
					<td align="center">
						<%=list.get(i).getEmail()%>
					</td>
					<td align="center">
						<%=list.get(i).getContent()%>						
					</td>
					<td align="center">
						<%
						SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );	
						%>						
						<%=sdf.format( list.get(i).getReg_date() )%>
					</td>
				</tr>
				<%				
			}			
			
		} else {
			// ���� ���� ���
			%>
			<tr>
				<td colspan="6" height="40" align="center">
					���Ͽ� ���� �����ϴ�. �۾��⸦ ������ �ּ���
				</td>			
			</tr>			
			<%			
		}
	
	%>
</table>
