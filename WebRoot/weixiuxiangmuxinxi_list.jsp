<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>维修项目信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有维修项目信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  维修项目：<input name="weixiuxiangmu" type="text" id="weixiuxiangmu" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='weixiuxiangmuxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>维修项目</td>    
	
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"weixiuxiangmuxinxi"); 
    String url = "weixiuxiangmuxinxi_list.jsp?1=1"; 
    String sql =  "select * from weixiuxiangmuxinxi where 1=1";
	if(request.getParameter("weixiuxiangmu")=="" ||request.getParameter("weixiuxiangmu")==null ){}else{sql=sql+" and weixiuxiangmu like '%"+request.getParameter("weixiuxiangmu")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("weixiuxiangmu") %></td>    
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="weixiuxiangmuxinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="weixiuxiangmuxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <!--qiatnalijne--> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

