<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<html>
  <head>
    
    <title>����ά�ޱ�������ϵͳ</title>
<LINK href="images/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style></head>
 <BODY leftMargin=5 topMargin=5 rightMargin=5>
<table width="100%" height="210" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D9E9FF" style="border-collapse:collapse">  
  <TBODY>
    <TR 
  align=middle bgColor=#ffffff>
      <td colspan="4" bgColor=#CADCEA><strong>ϵͳ������Ϣ</strong></td>
    </TR>
    <TR   align=middle 
  bgColor=#ffffff>
      <TD width="14%" align="left" valign="bottom" >��ǰ�û���</TD>
      <TD width="37%"  align="left" valign="bottom" ><font class="t4"><%=request.getSession().getAttribute("username")%></font></TD>
      <TD width="9%"  align="left" valign="bottom" >����Ȩ�ޣ�</TD>
      <TD width="40%"  align="left" valign="bottom" ><font class="t4"><%=request.getSession().getAttribute("cx")%></font></TD>
    </TR>
    <TR   align=middle 
  bgColor=#ffffff>
      <TD height="38" align="left" valign="bottom"  >��ǰ���ڣ�</TD>
      <TD  align="left" valign="bottom" ><%java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.CHINA);

String result = format.format(date);
out.print(result);%></TD>
      <TD align="left" valign="bottom" >����IP��</TD>
      <TD  align="left" valign="bottom" ><%=request.getRemoteAddr() %></TD>
    </TR>
    <TR   align=middle 
  bgColor=#ffffff>
      <TD align="left" valign="bottom"  >������汾��</TD>
      <TD  align="left" valign="bottom" ><font class="t41"><%=request.getHeader("User-Agent")%></font></TD>
      <TD align="left" valign="bottom" >����ϵͳ��</TD>
      <TD  align="left" valign="bottom" ><font class="t41"><%=System.getProperty("os.name")%> </font></TD>
    </TR>
    <TR   align=middle 
  bgColor=#ffffff>
      <TD height="43" align="left" valign="bottom"  >�������˿ڣ�</TD>
      <TD  align="left" valign="bottom" ><font class="t41"><%=request.getServerPort()%></font></TD>
      <TD align="left" valign="bottom" >�������ڣ�</TD>
      <TD  align="left" valign="bottom" ><%
out.print(result);%></TD>
    </TR>
  </TBODY>
</TABLE>
<p>&nbsp;</p>
<table width="100%" height="193" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D9E9FF" style="border-collapse:collapse">  
  <TBODY>
    <TR 
  align=middle bgColor=#ffffff>
      <td colspan="2" bgColor=#CADCEA><strong>����ά�ޱ�������ϵͳ</strong></td>
    </TR>
    <TR   align=middle 
  bgColor=#ffffff>
      <TD width="10%" align="left" >ϵͳ���ߣ�</TD>
      <TD width="41%"  align="left" ><font class="t4">xxxxxx</font></TD>
    </TR>
    <TR   align=middle 
  bgColor=#ffffff>
      <TD align="left"  >ָ����ʦ��</TD>
      <TD  align="left" >xxxxxxx</TD>
    </TR>
    <TR   align=middle 
  bgColor=#ffffff>
      <TD align="left"  >��ϵ��ʽ��</TD>
      <TD  align="left" ><font class="t41">xxxxxxxxxxxxxxx</font></TD>
    </TR>
  </TBODY>
</TABLE>
<p>&nbsp;</p>
<P align=right>&nbsp;</P>
</BODY>
</html>


