<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"  %>
<html><head><title>������û �Է�</title></head>
<body>
<%@ include file="top.jsp" %>
<%   if (session_id==null) response.sendRedirect("login.jsp");  %>

<table width="75%" align="center" border>
<br>
<tr><th>�����ȣ</th><th>�й�</th><th>�����</th><th>����</th>
      <th>������û</th></tr>
<%
Connection myConn = null;
Statement stmt = null;
String mySQL = null;

String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db01";
String passwd = "ss2";
String jdbc_driver = "oracle.jdbc.driver.OracleDriver";

ResultSet myResultSet;

String c_id="";
int c_id_no;
String c_name;
int c_unit;

	try {
		Class.forName(jdbc_driver);
	         myConn =  DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();	
    } catch(SQLException ex) {
	     System.err.println("SQLException: " + ex.getMessage());
    }

	mySQL = "select c.c_id, c_name, c.c_id_no from enroll e, course c where e.c_id=c.c_id and e.c_id_no = c.c_id_no and s_id='" + session_id + "'";
	
myResultSet = stmt.executeQuery(mySQL);

if (myResultSet != null) {
	while (myResultSet.next()) {	
		 c_id = myResultSet.getString("c_id");
		 c_id_no = myResultSet.getInt("c_id_no");			
		 c_name = myResultSet.getString("c_name");			
%>

<tr>
  <td align="center"><%=c_id %></td> <td align="center"><%=c_id_no %></td> 
   <td align="center"><%=c_name %></td>
   <td align="center"><a href="delete.jsp?c_id=<%=c_id %>&c_id_no=<%= c_id_no %>">����</a></td>
 
 
</tr>
<%
	}//while�� ��
	}//if�� ��
 

	stmt.close();  myConn.close();
%>
</table></body></html>
    