<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>维修信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有维修信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  车牌号：<input name="chepaihao" type="text" id="chepaihao" style='border:solid 1px #000000; color:#666666' size="12" />  品牌型号：<input name="pinpaixinghao" type="text" id="pinpaixinghao" style='border:solid 1px #000000; color:#666666' size="12" />  车主姓名：<input name="chezhuxingming" type="text" id="chezhuxingming" style='border:solid 1px #000000; color:#666666' size="12" />  维修项目：<%=Info.getselect("weixiuxiangmu","weixiuxiangmuxinxi","weixiuxiangmu"," 1=1 ")%>  维修日期：<input name="weixiuriqi1" type="text" id="weixiuriqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="weixiuriqi2" type="text" id="weixiuriqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />
     <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车牌号</td>
    <td bgcolor='#CCFFFF'>品牌型号</td>
    <td bgcolor='#CCFFFF'>车主姓名</td>
    <td bgcolor='#CCFFFF'>联系电话</td>
    <td bgcolor='#CCFFFF'>维修项目</td>
    <td bgcolor='#CCFFFF'>维修内容</td>
    <td bgcolor='#CCFFFF'>维修费用</td>
    <td bgcolor='#CCFFFF' width='65' align='center'>维修日期</td>
    
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
 <% 
  	double weixiufeiyongz=0;


  	 new CommDAO().delete(request,"weixiuxinxi"); 
    String url = "weixiuxinxi_list2.jsp?1=1"; 
    String sql =  "select * from weixiuxinxi where chepaihao='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}
if(request.getParameter("pinpaixinghao")=="" ||request.getParameter("pinpaixinghao")==null ){}else{sql=sql+" and pinpaixinghao like '%"+request.getParameter("pinpaixinghao")+"%'";}
if(request.getParameter("chezhuxingming")=="" ||request.getParameter("chezhuxingming")==null ){}else{sql=sql+" and chezhuxingming like '%"+request.getParameter("chezhuxingming")+"%'";}
if(request.getParameter("weixiuxiangmu")=="" ||request.getParameter("weixiuxiangmu")==null ){}else{sql=sql+" and weixiuxiangmu like '%"+request.getParameter("weixiuxiangmu")+"%'";}
if (request.getParameter("weixiuriqi1")==""  ||request.getParameter("weixiuriqi1")==null ) {}else{sql=sql+" and weixiuriqi >= '"+request.getParameter("weixiuriqi1")+"'";}
if (request.getParameter("weixiuriqi2")==""  ||request.getParameter("weixiuriqi2")==null ) {}else {sql=sql+" and weixiuriqi <= '"+request.getParameter("weixiuriqi2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	weixiufeiyongz=weixiufeiyongz+Float.valueOf((String)map.get("weixiufeiyong")).floatValue();



     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("chepaihao") %></td>
 <td><%=map.get("pinpaixinghao") %></td>
 <td><%=map.get("chezhuxingming") %></td>
 <td><%=map.get("lianxidianhua") %></td>
 <td><%=map.get("weixiuxiangmu") %></td>
 <td><%=map.get("weixiuneirong") %></td>
 <td><%=map.get("weixiufeiyong") %></td>
 <td><%=map.get("weixiuriqi") %></td>
 
 
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="weixiuxinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table><br>
共计维修费用:<%=weixiufeiyongz%>；  
${page.info }

  <%
//yoxutixinxg if(kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
%>
  </body>
</html>

