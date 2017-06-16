<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.Calendar" %>

<html><head><title>수강신청 입력</title></head>
<body>
<%@ include file="top.jsp" %>
<%   if (session_id==null) response.sendRedirect("login.jsp");  %>

<table width="75%" align="center" border>
<br>
<tr><th>과목번호</th><th>분반</th><th>과목명</th><th>학점</th><th>요일</th><th>시간</th><th>장소</th><th>수강학생보기</th>
      <th>삭제</th></tr>
      
 <%!
private String verify_day(int getDay){
	String day;
	switch(getDay/10){
		case 1:
			day="월";
			break;
		case 2:
			day="화";
			break;
		case 3:
			day="수";
			break;
		case 4:
			day="목";
			break;
		case 5:
			day="금";
			break;
		case 6:
			day="토";
			break;
		default:
			day=" ";
	}
	switch(getDay%10){
		case 1:
			day=day+" 월";
			break;
		case 2:
			day=day+" 화";
			break;
		case 3:
			day=day+" 수";
			break;
		case 4:
			day=day+" 목";
			break;
		case 5:
			day=day+" 금";
			break;
		case 6:
			day=day+" 토";
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

String c_id="";
int c_id_no;
String c_name;
int c_unit;
String c_time_start;
String c_time_end;
String c_time;
int c_day;
String t_where;
String day;

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
	mySQL = "select c.c_id, c_name, c.c_id_no, c.c_unit, c.c_day, c.c_time_start, c.c_time_end, t.t_where from teach t, course c where t.c_id=c.c_id and t.c_id_no = c.c_id_no and t.t_year = "+year+" and t.t_semester= "+semester+"and p_id='" + session_id + "'";

myResultSet = stmt.executeQuery(mySQL);

if (myResultSet != null) {
	while (myResultSet.next()) {	
		 c_id = myResultSet.getString("c_id");
		 c_id_no = myResultSet.getInt("c_id_no");			
		 c_name = myResultSet.getString("c_name");	
		 c_unit = myResultSet.getInt("c_unit");
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
   <td align="center"><%=day %></td><td align="center"><%=c_time %></td>
  </td><td align="center"><%=t_where %></td>
   <td align="center"><a href="select_teachStudent.jsp?c_id=<%=c_id %>&c_id_no=<%= c_id_no %>">확인</a></td>
   <td align="center"><a href="delete.jsp?c_id=<%=c_id %>&c_id_no=<%= c_id_no %>">삭제</a></td>
 
 
</tr>
<%
	}//while문 끝
	}//if문 끝
 

	stmt.close();  myConn.close();
%>
</table></body></html>
    