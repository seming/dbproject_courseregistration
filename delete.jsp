<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"  %>
<html><head><title>������û �Է�</title></head>
<body>

<%	
	String id = (String)session.getAttribute("user");
	String session_identify= (String)session.getAttribute("identify");
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
	stmt = myConn.createStatement();	
} catch(SQLException ex) {
     System.err.println("SQLException: " + ex.getMessage());
}
	
	try  {  	
	
		if(session_identify.equals("professor")){
			mySQL = "Delete from teach where c_id='" +c_id+"' and c_id_no='"+c_id_no+"' and p_id ='"+id+"'";
		}
		else{
			mySQL = "Delete from enroll where c_id='" +c_id+"' and s_id ='"+id+"'";
		}
	
	
	stmt.executeQuery(mySQL);
	out.println("<script>alert('�����Ǿ����ϴ�.');</script>");
%>
<script>	
	
	location.href="select.jsp";
</script>
<%		
	} catch(SQLException ex) {		
		 String sMessage=" ";
	   	  if (ex.getErrorCode() == 20006){
	   		  sMessage="�������� �־� ������ �� �����ϴ�.";
	   		  out.println("<script>alert('" +sMessage+"');</script>");
	   		  out.println("<script>location.href= \"select_professor.jsp\";</script>");
	   	  }
		 System.err.println("SQLException: " + ex.getMessage());
	}  
	finally {
	    if (stmt != null) 
           try { myConn.commit(); stmt.close();  myConn.close(); }
	      catch(SQLException ex) { }
    }

%>
</body></html>
