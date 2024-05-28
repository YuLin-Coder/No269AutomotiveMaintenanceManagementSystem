<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>预约信息详细</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"yuyuexinxi");
     %>
  预约信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>车牌号：</td><td width='39%'><%=m.get("chepaihao")%></td><td width='11%'>品牌型号：</td><td width='39%'><%=m.get("pinpaixinghao")%></td></tr><tr><td width='11%'>车主姓名：</td><td width='39%'><%=m.get("chezhuxingming")%></td><td width='11%'>联系电话：</td><td width='39%'><%=m.get("lianxidianhua")%></td></tr><tr><td width='11%'>预约事项：</td><td width='39%'><%=m.get("yuyueshixiang")%></td><td width='11%'>预约时间：</td><td width='39%'><%=m.get("yuyueshijian")%></td></tr><tr><td width='11%'>备注：</td><td width='39%'><%=m.get("beizhu")%></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


