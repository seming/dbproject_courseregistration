<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.Calendar" %>

<html><head><title>������û �Է�</title></head>
<body>
<%@ include file="top.jsp" %>
<%   if (session_id==null) response.sendRedirect("login.jsp");  %>

<table width="75%" align="center" border>
<br>
<tr><th>�����ȣ</th><th>�й�</th><th>�����</th><th>�����л�����</th>
      <th>����</th></tr>
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

Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int semester = 1;

if(month== 11 || month==12 || (month >=1 && month<=4)){
	semester = 1;
}
else{
	semester = 2;
}
	try {
		Class.forName(jdbc_driver);
	         myConn =  DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();	
    } catch(SQLException ex) {
	     System.err.println("SQLException: " + ex.getMessage());
    }
	mySQL = "select c.c_id, c_name, c.c_id_no from teach t, course c where t.c_id=c.c_id and t.c_id_no = c.c_id_no and t.t_year = "+year+" and t.t_semester= "+semester+"and p_id='" + session_id + "'";
	
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
   <td align="center"><a href="select_teachStudent.jsp?c_id=<%=c_id %>&c_id_no=<%= c_id_no %>">Ȯ��</a></td>
   <td align="center"><a href="delete.jsp?c_id=<%=c_id %>&c_id_no=<%= c_id_no %>">����</a></td>
 
 
</tr>
<%
	}//while�� ��
	}//if�� ��
 

	stmt.close();  myConn.close();
%>
</table></body></html>
    