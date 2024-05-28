<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=chezhuxinxi.xls");
%>
<html>
  <head>
    <title>车主信息</title>
  </head>

  <body >
  <p>已有车主信息列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车牌号</td>    <td bgcolor='#CCFFFF'>密码</td>    <td bgcolor='#CCFFFF'>品牌型号</td>    <td bgcolor='#CCFFFF'>颜色</td>    <td bgcolor='#CCFFFF' width='65' align='center'>首次上牌日期</td>    <td bgcolor='#CCFFFF'>车主姓名</td>    <td bgcolor='#CCFFFF' width='40' align='center'>性别</td>    <td bgcolor='#CCFFFF'>联系电话</td>        
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "chezhuxinxi_list.jsp?1=1"; 
    String sql =  "select * from chezhuxinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	//zoxngxetxoxngjxvi
//txixgihxngjs
//youzuiping2
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("chepaihao") %></td>    <td><%=map.get("mima") %></td>    <td><%=map.get("pinpaixinghao") %></td>    <td><%=map.get("yanse") %></td>    <td><%=map.get("shoucishangpairiqi") %></td>    <td><%=map.get("chezhuxingming") %></td>    <td align='center'><%=map.get("xingbie") %></td>    <td><%=map.get("lianxidianhua") %></td>        
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

