<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.Calendar" %>

<html><head><title>수강신청 입력</title></head>
<body>
<%@ include file="top.jsp" %>
<%   if (session_id==null) response.sendRedirect("login.jsp");  %>

<table width="75%" align="center" border>
<br>
<tr><th>학번</th><th>이름</th><th>학년</th><th>전공</th>
      <th>삭제</th></tr>
 <%	
	String c_id = request.getParameter("c_id");
	int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
%>
<%
Connection myConn = null;
Statement stmt = null;
String mySQL = null;

String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db01";
String passwd = "ss2";
String jdbc_driver = "oracle.jdbc.driver.OracleDriver";

ResultSet myResultSet;

String s_id="";
String s_name;
int s_grade;
String s_major;

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
	mySQL = "select s.s_id, s.s_name, s.s_grade, s.s_major from enroll e, student s where e.s_id = s.s_id and e.c_id='"+c_id+"' and e.c_id_no ="+c_id_no+" and e.e_year = "+year+" and e.e_semester= "+semester;
	
myResultSet = stmt.executeQuery(mySQL);

if (myResultSet != null) {
	while (myResultSet.next()) {	
		 s_id = myResultSet.getString("s_id");		
		 s_name = myResultSet.getString("s_name");	
		 s_grade = myResultSet.getInt("s_grade");	
		 s_major = myResultSet.getString("s_major");	
%>

<tr>
  <td align="center"><%=s_id %></td> <td align="center"><%=s_name %></td> 
   <td align="center"><%=s_grade %></td><td align="center"><%=s_major %></td>
   <td align="center"><a href="delete.jsp %>">삭제</a></td>
 
 
</tr>
<%
	}//while문 끝
	}//if문 끝
 

	stmt.close();  myConn.close();
%>
</table></body></html>
    