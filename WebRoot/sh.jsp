<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>…Û∫À</title>
  </head>
  <body>
  <%
String yuan=request.getParameter("yuan");
String id=request.getParameter("id");
String tablename=request.getParameter("tablename");
String sql="";
if(yuan.equals(" «"))
{
	sql="update "+tablename+" set issh='∑Ò' where id="+id;
}
else
{
	sql="update "+tablename+" set issh=' «' where id="+id;
}
 new CommDAO().commOper(sql); 
out.print("<script>location.href='"+request.getHeader("Referer")+"';</script>");
%>
  </body>
</html>


