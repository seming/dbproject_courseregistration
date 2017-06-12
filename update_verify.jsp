<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head><title> 수강신청 사용자 정보 수정 </title></head>
<body>
…..
<%  
	String session_id= (String)session.getAttribute("user");
	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;

	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db01";
	String passwd = "ss2";
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";

	String s_id = request.getParameter("s_id");
	String s_pwd = request.getParameter("s_pwd");
	String s_name = request.getParameter("s_name");
	String s_major = request.getParameter("s_major");
	String s_grade = request.getParameter("s_grade");

	try{
		Class.forName(jdbc_driver);
		myConn = DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();
		mySQL = "update student set s_id ='"+s_id+"', s_pwd='"+s_pwd+"', s_name='"+s_name+"', s_major='"+s_major+"',s_grade='"+s_grade+"'" ;
		ResultSet rs = stmt.executeQuery(mySQL);
		
		out.println("<script>alert('회원정보가 수정되었습니다.');</script>");
		out.println("<script>location.href= \"update.jsp\";</script>");
	
     } catch(SQLException ex) {
  	   String sMessage;
   	   if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
	  else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
	  else sMessage="잠시 후 다시 시도하십시오";	
     }
	finally{
		if(stmt != null){
			stmt.close();
			myConn.close();
		}
	}
%>
…
</body></html>
