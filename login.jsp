<%@ page contentType="text/html; charset=EUC-KR"%>
<HTML>
<head><title>������û �ý��� �α���</title></head>
<BODY>
<tablewidth="75%"align="center" bgcolor="#FFFF99"border>
<tr><td><div align="center"> ���̵�� �н����带 �Է��ϼ���</table>
<table width="75%" align="center" bgcolor="#FFFF99" border>
<FORM method="post" action="login_verify.jsp" > �α����� �ߵǾ����� Ȯ��

<label for="r2_1"><input name="userIdentify" type="radio" value="student" checked>�л�</label>
<label for="r2_2"><input name="userIdentify" type="radio" value="professor" >����</label><br><br>

<tr><td><div align="center">���̵�</div></td>
<td><div align="center"><input type="text"name="userID"></div></td>
</tr>
<tr><td><div align="center">�н�����</div></td>
<td><div align="center"><input type="password"name="userPassword">
</div></td>
</tr>
<tr>
<td colspan=2><div align="center">
<INPUT TYPE="SUBMIT" NAME="Submit"VALUE="�α���">
<INPUT TYPE="RESET"VALUE="���">
</div></td>
</tr>
</table>
</FORM>
</BODY></HTML>