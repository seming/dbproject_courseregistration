<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head><title> ������û ����� ���� ���� </title></head>
<body>

<%  
	String session_id= (String)session.getAttribute("user");
	String session_identify= (String)session.getAttribute("identify");
	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;

	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db01";
	String passwd = "ss2";
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	
	String id,pwd,name,major;
	int grade=1;
	
	if(session_identify.equals("professor")){
		id = request.getParameter("p_id");
		pwd = request.getParameter("p_pwd");
		name = request.getParameter("p_name");	
		major = request.getParameter("p_major");
	}
	else{
		id = request.getParameter("s_id");
		pwd = request.getParameter("s_pwd");
		name = request.getParameter("s_name");	
		grade =  Integer.parseInt(request.getParameter("s_grade"));
		major = request.getParameter("s_major");
	}

	try{
		Class.forName(jdbc_driver);
		myConn = DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();
		if(session_identify.equals("professor")){
			mySQL = "update professor set p_id ='"+id+"', p_pwd='"+pwd+"', p_name='"+name+"', p_major='"+major+"' where p_id ='"+id+"'" ;
		}
		else {
			mySQL = "update student set s_id ='"+id+"', s_pwd='"+pwd+"', s_name='"+name+"', s_grade="+ grade +", s_major='"+major+"' where s_id ='"+id+"'" ;
		}
		stmt.executeQuery(mySQL);
		
		out.println("<script>alert('ȸ�������� �����Ǿ����ϴ�.');</script>");
		if(session_identify.equals("professor")){
			out.println("<script>location.href= \"update_professor.jsp\";</script>");
		}
		else{
			out.println("<script>location.href= \"update.jsp\";</script>");
		}
	
     } catch(SQLException ex) {
  	   String sMessage;
   	   if (ex.getErrorCode() == 20002 || ex.getErrorCode() == 20004) sMessage="��ȣ�� 4�ڸ� �̻��̾�� �մϴ�";
	  else if (ex.getErrorCode() == 20003 || ex.getErrorCode() == 20005) sMessage="��ȣ�� ������ �Էµ��� �ʽ��ϴ�.";
	  else sMessage="��� �� �ٽ� �õ��Ͻʽÿ�";	
   	  
   	   out.println("<script>alert('" +sMessage+"');</script>");
     	if(session_identify.equals("professor")){
	     	out.println("<script>location.href= \"update_professor.jsp\";</script>");
	    } 
     	else{
	    	out.println("<script>location.href= \"update.jsp\";</script>");
     	}
     }
	finally{
		if(stmt != null){
			stmt.close();
			myConn.close();
		}
	}
%>
</body></html>
