<%@ page contentType="text/html; charset=EUC-KR" %>
<%
String session_id= (String)session.getAttribute("user");
String session_identify= (String)session.getAttribute("identify");
String log;
if (session_id==null){
	log="<a href=login.jsp>�α���</a>";
}
else log="<a href=logout.jsp>�α׾ƿ�</a>";
%>
<table width="75%" align="center" bgcolor="#FFFF99" border>
<tr>

<%
if(session_id != null && session_identify.equals("professor")){

%>
<td align="center"><b><%=log%></b></td>
<td align="center"><b><a href="update_professor.jsp">����� ���� ����</b></td>
<td align="center"><b><a href="insert.jsp">���ǰ��� �Է�</b></td>
<td align="center"><b><a href="delete.jsp">���ǰ��� ����</b></td>
<td align="center"><b><a href="select_professor.jsp">���ǰ��� ��ȸ</b></td>
</tr>
</table>

<%
}
else{
%>
<td align="center"><b><%=log%></b></td>
<td align="center"><b><a href="update.jsp">����� ���� ����</b></td>
<td align="center"><b><a href="insert.jsp">������û �Է�</b></td>
<td align="center"><b><a href="delete.jsp">������û ����</b></td>
<td align="center"><b><a href="select.jsp">������û ��ȸ</b></td>
</tr>
</table>
<%
}
%>