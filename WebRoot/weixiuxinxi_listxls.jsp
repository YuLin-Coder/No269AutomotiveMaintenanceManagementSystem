<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=weixiuxinxi.xls");
%>
<html>
  <head>
    <title>维修信息</title>
  </head>

  <body >
  <p>已有维修信息列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车牌号</td>    <td bgcolor='#CCFFFF'>品牌型号</td>    <td bgcolor='#CCFFFF'>车主姓名</td>    <td bgcolor='#CCFFFF'>联系电话</td>    <td bgcolor='#CCFFFF'>维修项目</td>    <td bgcolor='#CCFFFF'>维修内容</td>    <td bgcolor='#CCFFFF'>维修费用</td>    <td bgcolor='#CCFFFF' width='65' align='center'>维修日期</td>        
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "weixiuxinxi_list.jsp?1=1"; 
    String sql =  "select * from weixiuxinxi where 1=1";
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
    <td><%=map.get("chepaihao") %></td>    <td><%=map.get("pinpaixinghao") %></td>    <td><%=map.get("chezhuxingming") %></td>    <td><%=map.get("lianxidianhua") %></td>    <td><%=map.get("weixiuxiangmu") %></td>    <td><%=map.get("weixiuneirong") %></td>    <td><%=map.get("weixiufeiyong") %></td>    <td><%=map.get("weixiuriqi") %></td>        
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

