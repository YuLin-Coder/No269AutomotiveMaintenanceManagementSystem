<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>年检信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有年检信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  车牌号：<input name="chepaihao" type="text" id="chepaihao" style='border:solid 1px #000000; color:#666666' size="12" />  品牌型号：<input name="pinpaixinghao" type="text" id="pinpaixinghao" style='border:solid 1px #000000; color:#666666' size="12" />  车主姓名：<input name="chezhuxingming" type="text" id="chezhuxingming" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车牌号</td>
    <td bgcolor='#CCFFFF'>品牌型号</td>
    <td bgcolor='#CCFFFF'>车主姓名</td>
    <td bgcolor='#CCFFFF'>联系电话</td>
    <td bgcolor='#CCFFFF' width='65' align='center'>下次年检日期</td>
    
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
 <% 
  	

int xiacinianjianriqitx=0;
  	 new CommDAO().delete(request,"nianjianxinxi"); 
    String url = "nianjianxinxi_list2.jsp?1=1"; 
    String sql =  "select * from nianjianxinxi where chepaihao='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}
if(request.getParameter("pinpaixinghao")=="" ||request.getParameter("pinpaixinghao")==null ){}else{sql=sql+" and pinpaixinghao like '%"+request.getParameter("pinpaixinghao")+"%'";}
if(request.getParameter("chezhuxingming")=="" ||request.getParameter("chezhuxingming")==null ){}else{sql=sql+" and chezhuxingming like '%"+request.getParameter("chezhuxingming")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	
int xiacinianjianriqits=Info.getBetweenDayNumber((String)map.get("xiacinianjianriqi")+" 00:00",Info.getDateStr())/24/60;if (xiacinianjianriqits<15){xiacinianjianriqitx=xiacinianjianriqitx+1;}


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("chepaihao") %></td>
 <td><%=map.get("pinpaixinghao") %></td>
 <td><%=map.get("chezhuxingming") %></td>
 <td><%=map.get("lianxidianhua") %></td>
 <td><%=map.get("xiacinianjianriqi") %></td>
 
 
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"> <a href="nianjianxinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table><br>
  
${page.info }

  <%
//yoxutixinxg if(kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
%>
  </body>
</html>

