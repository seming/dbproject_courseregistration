<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"  %>
<html><head><title>수강신청 입력</title></head>
<body>
<%@ include file="top.jsp" %>
<%   if (session_id==null) response.sendRedirect("login.jsp");  %>


<%	
	String s_id = (String)session.getAttribute("user");
	String c_id = request.getParameter("c_id");
	int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
%>
<%		
Connection myConn = null;
Statement stmt = null;
String mySQL = null;
String result = null;

String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db01";
String passwd = "ss2";
String jdbc_driver = "oracle.jdbc.driver.OracleDriver"; 

int resultnum;

	try {
		Class.forName(jdbc_driver);
  	        myConn =  DriverManager.getConnection (dburl, user, passwd);
    } catch(SQLException ex) {
	     System.err.println("SQLException: " + ex.getMessage());
    }
	mySQL = "delete from enroll where s_id='" +s_id+"'";
	
	
	System.out.println(c_id);
	
	resultnum = stmt.executeUpdate(mySQL);
	System.out.println(resultnum);
	
%>
<script>	
	alert("<%= result %>"); 
	location.href="select.jsp";
</script>
<%		
stmt.close();  myConn.close();
%>
</body></html>
