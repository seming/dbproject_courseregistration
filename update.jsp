<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>수강신청 사용자 정보 수정</title></head>
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
	mySQL = "select s_id, s_pwd, s_name, s_major, s_grade from student where s_id='" + session_id + "'" ;
	ResultSet rs = stmt.executeQuery(mySQL);

	if(rs.next()){
		String s_id = rs.getString("s_id");
		String s_pwd = rs.getString("s_pwd");
		String s_name = rs.getString("s_name");
		String s_major = rs.getString("s_major");
		String s_grade = rs.getString("s_grade");
	
	

%>

<form method="post" action="update_verify.jsp"> </br></br> 개인 정보 수정</br></br>
<tr><td><divalign="center">아이디</div></td>
<td><div align="center"><input type="text"name="s_id" value="<%=s_id%>"></div></td>
</tr>
<tr><td><divalign="center">패스워드</div></td>
<td><div align="center"><input type="password"name="s_pwd" value="<%=s_pwd %>">
</div></td>
</tr>
<tr><td><divalign="center">이름</div></td>
<td><div align="center"><input type="text"name="s_name" value="<%=s_name%>"></div></td>
</tr>
<tr><td><divalign="center">전공</div></td>
<td><div align="center"><input type="text"name="s_major" value="<%=s_major%>"></div></td>
</tr>
<tr><td><divalign="center">학년</div></td>
<td><div align="center"><input type="text"name="s_grade" value="<%=s_grade%>"></div></td>
</tr>
<%
	}
	stmt.close();
	myConn.close();
	%>
<tr>
<td colspan=2><divalign="center">
<INPUT TYPE="SUBMIT" NAME="Submit"VALUE="수정">

</div></td>
</tr>
</table>

</form></body></html> 