<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=baoxianxinxi.xls");
%>
<html>
  <head>
    <title>保险信息</title>
  </head>

  <body >
  <p>已有保险信息列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车牌号</td>    <td bgcolor='#CCFFFF'>品牌型号</td>    <td bgcolor='#CCFFFF'>车主姓名</td>    <td bgcolor='#CCFFFF'>联系电话</td>    <td bgcolor='#CCFFFF'>保险种类</td>    <td bgcolor='#CCFFFF'>保险公司名称</td>    <td bgcolor='#CCFFFF'>保费金额</td>    <td bgcolor='#CCFFFF' width='65' align='center'>保险到期时间</td>        
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "baoxianxinxi_list.jsp?1=1"; 
    String sql =  "select * from baoxianxinxi where 1=1";
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
    <td><%=map.get("chepaihao") %></td>    <td><%=map.get("pinpaixinghao") %></td>    <td><%=map.get("chezhuxingming") %></td>    <td><%=map.get("lianxidianhua") %></td>    <td><%=map.get("baoxianzhonglei") %></td>    <td><%=map.get("baoxiangongsimingcheng") %></td>    <td><%=map.get("baofeijine") %></td>    <td><%=map.get("baoxiandaoqishijian") %></td>        
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

