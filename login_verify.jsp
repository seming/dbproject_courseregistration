<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
String userID =request.getParameter("userID");
String userPassword =request.getParameter("userPassword");
String userIdentify = request.getParameter("userIdentify");

Connection myConn = null;
Statement stmt = null;
String mySQL = null;

String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db01";
String passwd = "ss2";
String jdbc_driver = "oracle.jdbc.driver.OracleDriver";

System.out.println(userIdentify);
Class.forName(jdbc_driver);
myConn = DriverManager.getConnection (dburl, user, passwd);
stmt = myConn.createStatement();
if(userIdentify.equals("student")){
	mySQL = "select s_id from student where s_id='" + userID + "' and s_pwd='"+ userPassword +"'";
	ResultSet rs = stmt.executeQuery(mySQL);


	if(rs.next()){
		String s_id = rs.getString("s_id");
		session.setAttribute("identify", "student");
		session.setAttribute("user", s_id);
		out.println("<script>alert('로그인 성공');</script>");
	
		out.println("<script>location.href = \"main.jsp\"; </script>");
	}

	else{
		out.println("<script>alert('로그인에 실패하였습니다. 아이디나 비밀번호를 확인해주세요.');</script>");
		%>
		<script>location.href = "login.jsp"; </script>
		<%
	}
}
else if(userIdentify.equals("professor")){
	mySQL = "select p_id from professor where p_id='" + userID + "' and p_pwd='"+ userPassword +"'";
	ResultSet rs = stmt.executeQuery(mySQL);


	if(rs.next()){
		String p_id = rs.getString("p_id");
		session.setAttribute("identify", "professor");
		session.setAttribute("user", p_id);
		out.println("<script>alert('로그인 성공');</script>");
	
		out.println("<script>location.href = \"main.jsp\"; </script>");
	}

	else{
		out.println("<script>alert('로그인에 실패하였습니다. 아이디나 비밀번호를 확인해주세요.');</script>");
		%>
		<script>location.href = "login.jsp"; </script>
		<%
	}
}





 stmt.close();
myConn.close();
%>
