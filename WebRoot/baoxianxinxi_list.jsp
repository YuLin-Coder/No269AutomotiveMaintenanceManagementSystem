<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>������Ϣ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>���б�����Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ���ƺţ�<input name="chepaihao" type="text" id="chepaihao" style='border:solid 1px #000000; color:#666666' size="12" />  Ʒ���ͺţ�<input name="pinpaixinghao" type="text" id="pinpaixinghao" style='border:solid 1px #000000; color:#666666' size="12" />  ����������<input name="chezhuxingming" type="text" id="chezhuxingming" style='border:solid 1px #000000; color:#666666' size="12" />  ���չ�˾���ƣ�<input name="baoxiangongsimingcheng" type="text" id="baoxiangongsimingcheng" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='baoxianxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>���ƺ�</td>    <td bgcolor='#CCFFFF'>Ʒ���ͺ�</td>    <td bgcolor='#CCFFFF'>��������</td>    <td bgcolor='#CCFFFF'>��ϵ�绰</td>    <td bgcolor='#CCFFFF'>��������</td>    <td bgcolor='#CCFFFF'>���չ�˾����</td>    <td bgcolor='#CCFFFF'>���ѽ��</td>    <td bgcolor='#CCFFFF' width='65' align='center'>���յ���ʱ��</td>        
	
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
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
    <td width="60" align="center"><a href="baoxianxinxi_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="baoxianxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="baoxianxinxi_detail.jsp?id=<%=map.get("id")%>">��ϸ</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
���Ʊ��ѽ��:<%=baofeijinez%>��  
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
var popH=parseInt(MsgPop.style.height);//������ĸ߶�ת��Ϊ���� 
if (popH==0){ 
MsgPop.style.display="block";//��ʾ���صĴ��� 
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
MsgPop.style.display="none"; //����DIV 
} 
} 
} 
window.onload=function(){ //���� 
document.getElementById('winpop').style.height='0px'; 
setTimeout("tips_pop()",500); //3������tips_pop()������� 
} 
</script> <div id="silu"> 
<body>
</div> 
<div id="winpop"> 
<div class="title">ϵͳ���ѣ� <span class="close" onClick="tips_pop()">X </span> </div> 
<div class="con">��ǰ��<%=baoxiandaoqishijiantx%>�����յ���ʱ��ֵ��¼С��15��лл��</div>
<%
}
%>
  </body>
</html>

