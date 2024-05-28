<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>保养信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有保养信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  车牌号：<input name="chepaihao" type="text" id="chepaihao" style='border:solid 1px #000000; color:#666666' size="12" />  品牌型号：<input name="pinpaixinghao" type="text" id="pinpaixinghao" style='border:solid 1px #000000; color:#666666' size="12" />  车主姓名：<input name="chezhuxingming" type="text" id="chezhuxingming" style='border:solid 1px #000000; color:#666666' size="12" />  保养项目：<%=Info.getselect("baoyangxiangmu","baoyangxiangmuxinxi","baoyangxiangmu"," 1=1 ")%>  保养日期：<input name="baoyangriqi1" type="text" id="baoyangriqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="baoyangriqi2" type="text" id="baoyangriqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />
     <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车牌号</td>
    <td bgcolor='#CCFFFF'>品牌型号</td>
    <td bgcolor='#CCFFFF'>车主姓名</td>
    <td bgcolor='#CCFFFF'>联系电话</td>
    <td bgcolor='#CCFFFF'>保养项目</td>
    <td bgcolor='#CCFFFF'>保养内容</td>
    <td bgcolor='#CCFFFF'>保养费用</td>
    <td bgcolor='#CCFFFF' width='65' align='center'>保养日期</td>
    
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
 <% 
  	double baoyangfeiyongz=0;


  	 new CommDAO().delete(request,"baoyangxinxi"); 
    String url = "baoyangxinxi_list2.jsp?1=1"; 
    String sql =  "select * from baoyangxinxi where chepaihao='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}
if(request.getParameter("pinpaixinghao")=="" ||request.getParameter("pinpaixinghao")==null ){}else{sql=sql+" and pinpaixinghao like '%"+request.getParameter("pinpaixinghao")+"%'";}
if(request.getParameter("chezhuxingming")=="" ||request.getParameter("chezhuxingming")==null ){}else{sql=sql+" and chezhuxingming like '%"+request.getParameter("chezhuxingming")+"%'";}
if(request.getParameter("baoyangxiangmu")=="" ||request.getParameter("baoyangxiangmu")==null ){}else{sql=sql+" and baoyangxiangmu like '%"+request.getParameter("baoyangxiangmu")+"%'";}
if (request.getParameter("baoyangriqi1")==""  ||request.getParameter("baoyangriqi1")==null ) {}else{sql=sql+" and baoyangriqi >= '"+request.getParameter("baoyangriqi1")+"'";}
if (request.getParameter("baoyangriqi2")==""  ||request.getParameter("baoyangriqi2")==null ) {}else {sql=sql+" and baoyangriqi <= '"+request.getParameter("baoyangriqi2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	baoyangfeiyongz=baoyangfeiyongz+Float.valueOf((String)map.get("baoyangfeiyong")).floatValue();



     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("chepaihao") %></td>
 <td><%=map.get("pinpaixinghao") %></td>
 <td><%=map.get("chezhuxingming") %></td>
 <td><%=map.get("lianxidianhua") %></td>
 <td><%=map.get("baoyangxiangmu") %></td>
 <td><%=map.get("baoyangneirong") %></td>
 <td><%=map.get("baoyangfeiyong") %></td>
 <td><%=map.get("baoyangriqi") %></td>
 
 
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"> <a href="baoyangxinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table><br>
共计保养费用:<%=baoyangfeiyongz%>；  
${page.info }

  <%
//yoxutixinxg if(kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
%>
  </body>
</html>

