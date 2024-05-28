<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>保养信息详细</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"baoyangxinxi");
     %>
  保养信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>车牌号：</td><td width='39%'><%=m.get("chepaihao")%></td><td width='11%'>品牌型号：</td><td width='39%'><%=m.get("pinpaixinghao")%></td></tr><tr><td width='11%'>车主姓名：</td><td width='39%'><%=m.get("chezhuxingming")%></td><td width='11%'>联系电话：</td><td width='39%'><%=m.get("lianxidianhua")%></td></tr><tr><td width='11%'>保养项目：</td><td width='39%'><%=m.get("baoyangxiangmu")%></td><td width='11%'>保养内容：</td><td width='39%'><%=m.get("baoyangneirong")%></td></tr><tr><td width='11%'>保养费用：</td><td width='39%'><%=m.get("baoyangfeiyong")%></td><td width='11%'>保养日期：</td><td width='39%'><%=m.get("baoyangriqi")%></td></tr><tr><td width='11%'>备注：</td><td width='39%'><%=m.get("beizhu")%></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


