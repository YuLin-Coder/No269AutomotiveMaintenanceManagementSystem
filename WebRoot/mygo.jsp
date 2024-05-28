<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
    

  </head>
  
  <body>
  <%
if (request.getSession().getAttribute("cx").equals("员工"))
{
	response.sendRedirect("left3.jsp");
} 

if (request.getSession().getAttribute("cx").equals("车主"))
{
	response.sendRedirect("left2.jsp");
}
if (request.getSession().getAttribute("cx").equals("超级管理员") || request.getSession().getAttribute("cx").equals("普通管理员"))
{
	response.sendRedirect("left.jsp");
}
 %>
  </body>
</html>

