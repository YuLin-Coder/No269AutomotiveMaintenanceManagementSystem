<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>保险信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有保险信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  车牌号：<input name="chepaihao" type="text" id="chepaihao" style='border:solid 1px #000000; color:#666666' size="12" />  品牌型号：<input name="pinpaixinghao" type="text" id="pinpaixinghao" style='border:solid 1px #000000; color:#666666' size="12" />  车主姓名：<input name="chezhuxingming" type="text" id="chezhuxingming" style='border:solid 1px #000000; color:#666666' size="12" />  保险公司名称：<input name="baoxiangongsimingcheng" type="text" id="baoxiangongsimingcheng" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='baoxianxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车牌号</td>    <td bgcolor='#CCFFFF'>品牌型号</td>    <td bgcolor='#CCFFFF'>车主姓名</td>    <td bgcolor='#CCFFFF'>联系电话</td>    <td bgcolor='#CCFFFF'>保险种类</td>    <td bgcolor='#CCFFFF'>保险公司名称</td>    <td bgcolor='#CCFFFF'>保费金额</td>    <td bgcolor='#CCFFFF' width='65' align='center'>保险到期时间</td>        
	
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	double baofeijinez=0;

int baoxiandaoqishijiantx=0;
  	 new CommDAO().delete(request,"baoxianxinxi"); 
    String url = "baoxianxinxi_list.jsp?1=1"; 
    String sql =  "select * from baoxianxinxi where 1=1";
	if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}if(request.getParameter("pinpaixinghao")=="" ||request.getParameter("pinpaixinghao")==null ){}else{sql=sql+" and pinpaixinghao like '%"+request.getParameter("pinpaixinghao")+"%'";}if(request.getParameter("chezhuxingming")=="" ||request.getParameter("chezhuxingming")==null ){}else{sql=sql+" and chezhuxingming like '%"+request.getParameter("chezhuxingming")+"%'";}if(request.getParameter("baoxiangongsimingcheng")=="" ||request.getParameter("baoxiangongsimingcheng")==null ){}else{sql=sql+" and baoxiangongsimingcheng like '%"+request.getParameter("baoxiangongsimingcheng")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	baofeijinez=baofeijinez+Float.valueOf((String)map.get("baofeijine")).floatValue();
int baoxiandaoqishijiants=Info.getBetweenDayNumber((String)map.get("baoxiandaoqishijian")+" 00:00",Info.getDateStr())/24/60;if (baoxiandaoqishijiants<15){baoxiandaoqishijiantx=baoxiandaoqishijiantx+1;}

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("chepaihao") %></td>    <td><%=map.get("pinpaixinghao") %></td>    <td><%=map.get("chezhuxingming") %></td>    <td><%=map.get("lianxidianhua") %></td>    <td><%=map.get("baoxianzhonglei") %></td>    <td><%=map.get("baoxiangongsimingcheng") %></td>    <td><%=map.get("baofeijine") %></td>    <td><%=map.get("baoxiandaoqishijian") %></td>        
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="baoxianxinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="baoxianxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="baoxianxinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
共计保费金额:<%=baofeijinez%>；  
${page.info }

 <%
 if(baoxiandaoqishijiantx>0)
{
%>
 <style>
#winpop { width:200px; height:0px; position:absolute; right:0; bottom:0; border:1px solid #666; margin:0; padding:1px; overflow:hidden; display:none;} 
#winpop .title { width:100%; height:22px; line-height:20px; background:#FFCC00; font-weight:bold; text-align:center; font-size:12px;} 
#winpop .con { width:100%; height:90px; line-height:20px; font-weight:bold; font-size:12px; color:#FF0000; text-align:center} 
#silu { font-size:12px; color:#666; position:absolute; right:0; text-align:right; text-decoration:underline; line-height:22px;} 
.close { position:absolute; right:4px; top:-1px; color:#FFF; cursor:pointer} 
</style> 
<script type="text/javascript"> 
function tips_pop(){ 
var MsgPop=document.getElementById("winpop"); 
var popH=parseInt(MsgPop.style.height);//将对象的高度转化为数字 
if (popH==0){ 
MsgPop.style.display="block";//显示隐藏的窗口 
show=setInterval("changeH('up')",2); 
} 
else { 
hide=setInterval("changeH('down')",2); 
} 
} 
function changeH(str) { 
var MsgPop=document.getElementById("winpop"); 
var popH=parseInt(MsgPop.style.height); 
if(str=="up"){ 
if (popH <=100){ 
MsgPop.style.height=(popH+4).toString()+"px"; 
} 
else{ 
clearInterval(show); 
} 
} 
if(str=="down"){ 
if (popH>=4){ 
MsgPop.style.height=(popH-4).toString()+"px"; 
} 
else{ 
clearInterval(hide);  
MsgPop.style.display="none"; //隐藏DIV 
} 
} 
} 
window.onload=function(){ //加载 
document.getElementById('winpop').style.height='0px'; 
setTimeout("tips_pop()",500); //3秒后调用tips_pop()这个函数 
} 
</script> <div id="silu"> 
<body>
</div> 
<div id="winpop"> 
<div class="title">系统提醒！ <span class="close" onClick="tips_pop()">X </span> </div> 
<div class="con">当前有<%=baoxiandaoqishijiantx%>条保险到期时间值记录小于15，谢谢！</div>
<%
}
%>
  </body>
</html>

