<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>������û ����� ���� ����</title></head>
<body>
<%@ include file="top.jsp" %>

<%

if (session_id==null){
	response.sendRedirect("login.jsp");
}

	//String userID =request.getParameter("userID");
	//String userPassword =request.getParameter("userPassword");

	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;

	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db01";
	String passwd = "ss2";
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";


	Class.forName(jdbc_driver);
	myConn = DriverManager.getConnection (dburl, user, passwd);
	stmt = myConn.createStatement();
	mySQL = "select p_id, p_pwd, p_name, p_major from professor where p_id='" + session_id + "'" ;
	ResultSet rs = stmt.executeQuery(mySQL);

	if(rs.next()){
		String p_id = rs.getString("p_id");
		String p_pwd = rs.getString("p_pwd");
		String p_name = rs.getString("p_name");
		String p_major = rs.getString("p_major");
	
	

%>

<form method="post" action="update_verify.jsp"> </br></br> ���� ���� ����</br></br>
<tr><td><divalign="center">���̵�</div></td>
<td><div align="center"><input type="text"name="p_id" value="<%=p_id%>"></div></td>
</tr>
<tr><td><divalign="center">�н�����</div></td>
<td><div align="center"><input type="password"name="p_pwd" value="<%=p_pwd %>">
</div></td>
</tr>
<tr><td><divalign="center">�̸�</div></td>
<td><div align="center"><input type="text"name="p_name" value="<%=p_name%>"></div></td>
</tr>
<tr><td><divalign="center">����</div></td>
<td><div align="center"><input type="text"name="p_major" value="<%=p_major%>"></div></td>
</tr>
<%
	}
	stmt.close();
	myConn.close();
	%>
<tr>
<td colspan=2><divalign="center">
<INPUT TYPE="SUBMIT" NAME="Submit"VALUE="����">

</div></td>
</tr>
</table>

</form></body></html> 