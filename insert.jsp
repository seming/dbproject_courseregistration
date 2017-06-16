<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.Calendar" %>
<html><head><title>������û �Է�</title></head>
<body>
<%@ include file="top.jsp" %>
<%   if (session_id==null) response.sendRedirect("login.jsp");  %>

<table width="75%" align="center" border>
<br>
<tr><th>�����ȣ</th><th>�й�</th><th>�����</th><th>����</th><th>������</th><th>����</th><th>�ð�</th><th>���</th>
      <th>������û</th></tr>

<%!
private String verify_day(int getDay){
	String day;
	switch(getDay/10){
		case 1:
			day="��";
			break;
		case 2:
			day="ȭ";
			break;
		case 3:
			day="��";
			break;
		case 4:
			day="��";
			break;
		case 5:
			day="��";
			break;
		case 6:
			day="��";
			break;
		default:
			day=" ";
	}
	switch(getDay%10){
		case 1:
			day=day+" ��";
			break;
		case 2:
			day=day+" ȭ";
			break;
		case 3:
			day=day+" ��";
			break;
		case 4:
			day=day+" ��";
			break;
		case 5:
			day=day+" ��";
			break;
		case 6:
			day=day+" ��";
			break;
		default:
			day=day+" ";
	}
	return day;
}
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

String c_id="";
int c_id_no;
String c_name;
int c_unit;
String c_time_start;
String c_time_end;
String c_time;
int c_day;
String p_name;
String t_where;
String day;

	try {
		Class.forName(jdbc_driver);
	         myConn =  DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();	
    } catch(SQLException ex) {
	     System.err.println("SQLException: " + ex.getMessage());
    }
	
	mySQL = "select c.c_id, c.c_id_no, c.c_name, c.c_unit, c.c_day, c.c_time_start, c.c_time_end, t.t_where, p.p_name from course c, teach t, professor p where t.p_id=p.p_id and  c.c_id= t.c_id and c.c_id_no = t.c_id_no and t_year="+year+" and t_semester="+semester+" and c.c_id not in (select c_id from enroll where s_id='"+session_id+"')";
	
myResultSet = stmt.executeQuery(mySQL);

if (myResultSet != null) {
	while (myResultSet.next()) {	
		 c_id = myResultSet.getString("c_id");
		 c_id_no = myResultSet.getInt("c_id_no");			
		c_name = myResultSet.getString("c_name");
		c_unit = myResultSet.getInt("c_unit");
		p_name = myResultSet.getString("p_name");
		t_where = myResultSet.getString("t_where");
		c_day = myResultSet.getInt("c_day");
		c_time_start = myResultSet.getString("c_time_start");
		c_time_end = myResultSet.getString("c_time_end");
		
		c_time = c_time_start +"-"+c_time_end;
		day = verify_day(c_day);
		
%>

<tr>
  <td align="center"><%=c_id %></td> <td align="center"><%=c_id_no %></td> 
  <td align="center"><%=c_name %></td><td align="center"><%=c_unit %></td>
  <td align="center"><%=p_name %></td><td align="center"><%=day %></td>
  <td align="center"><%=c_time %></td>
  </td><td align="center"><%=t_where %></td>
  <td align="center"><a href="insert_verify.jsp?c_id=<%=c_id %>&c_id_no=<%= c_id_no %>">��û</a></td>
</tr>
<%
	}//while�� ��
	}//if�� ��
 

	stmt.close();  myConn.close();
	
	
%>
</table></body></html>
    