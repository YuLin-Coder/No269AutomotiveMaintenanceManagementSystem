<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>ԤԼ��Ϣ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>����ԤԼ��Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ���ƺţ�<input name="chepaihao" type="text" id="chepaihao" style='border:solid 1px #000000; color:#666666' size="12" />  Ʒ���ͺţ�<input name="pinpaixinghao" type="text" id="pinpaixinghao" style='border:solid 1px #000000; color:#666666' size="12" />  ����������<input name="chezhuxingming" type="text" id="chezhuxingming" style='border:solid 1px #000000; color:#666666' size="12" /> ԤԼ���<select name='yuyueshixiang' id='yuyueshixiang' style='border:solid 1px #000000; color:#666666;'><option value="">����</option><option value="����ά��">����ά��</option><option value="��������">��������</option><option value="�������">�������</option><option value="������">������</option></select>
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>���ƺ�</td>
    <td bgcolor='#CCFFFF'>Ʒ���ͺ�</td>
    <td bgcolor='#CCFFFF'>��������</td>
    <td bgcolor='#CCFFFF'>��ϵ�绰</td>
    <td bgcolor='#CCFFFF'>ԤԼ����</td>
    <td bgcolor='#CCFFFF' width='65' align='center'>ԤԼʱ��</td>
    <td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
 <% 
  	

int yuyueshijiantx=0;
  	 new CommDAO().delete(request,"yuyuexinxi"); 
    String url = "yuyuexinxi_list2.jsp?1=1"; 
    String sql =  "select * from yuyuexinxi where chepaihao='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}
if(request.getParameter("pinpaixinghao")=="" ||request.getParameter("pinpaixinghao")==null ){}else{sql=sql+" and pinpaixinghao like '%"+request.getParameter("pinpaixinghao")+"%'";}
if(request.getParameter("chezhuxingming")=="" ||request.getParameter("chezhuxingming")==null ){}else{sql=sql+" and chezhuxingming like '%"+request.getParameter("chezhuxingming")+"%'";}
if(request.getParameter("yuyueshixiang")=="" ||request.getParameter("yuyueshixiang")==null ){}else{sql=sql+" and yuyueshixiang like '%"+request.getParameter("yuyueshixiang")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	
int yuyueshijiants=Info.getBetweenDayNumber((String)map.get("yuyueshijian")+" 00:00",Info.getDateStr())/24/60;if (yuyueshijiants<5){yuyueshijiantx=yuyueshijiantx+1;}


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("chepaihao") %></td>
 <td><%=map.get("pinpaixinghao") %></td>
 <td><%=map.get("chezhuxingming") %></td>
 <td><%=map.get("lianxidianhua") %></td>
 <td><%=map.get("yuyueshixiang") %></td>
 <td><%=map.get("yuyueshijian") %></td>
 
 <td width='80' align='center'><%=map.get("issh")%></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="yuyuexinxi_detail.jsp?id=<%=map.get("id")%>">��ϸ</a> </td>
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

