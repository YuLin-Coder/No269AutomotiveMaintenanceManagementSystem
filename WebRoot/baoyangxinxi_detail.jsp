<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>������Ϣ��ϸ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"baoyangxinxi");
     %>
  ������Ϣ��ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>���ƺţ�</td><td width='39%'><%=m.get("chepaihao")%></td><td width='11%'>Ʒ���ͺţ�</td><td width='39%'><%=m.get("pinpaixinghao")%></td></tr><tr><td width='11%'>����������</td><td width='39%'><%=m.get("chezhuxingming")%></td><td width='11%'>��ϵ�绰��</td><td width='39%'><%=m.get("lianxidianhua")%></td></tr><tr><td width='11%'>������Ŀ��</td><td width='39%'><%=m.get("baoyangxiangmu")%></td><td width='11%'>�������ݣ�</td><td width='39%'><%=m.get("baoyangneirong")%></td></tr><tr><td width='11%'>�������ã�</td><td width='39%'><%=m.get("baoyangfeiyong")%></td><td width='11%'>�������ڣ�</td><td width='39%'><%=m.get("baoyangriqi")%></td></tr><tr><td width='11%'>��ע��</td><td width='39%'><%=m.get("beizhu")%></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


