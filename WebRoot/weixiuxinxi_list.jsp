<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>ά����Ϣ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>����ά����Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ���ƺţ�<input name="chepaihao" type="text" id="chepaihao" style='border:solid 1px #000000; color:#666666' size="12" />  Ʒ���ͺţ�<input name="pinpaixinghao" type="text" id="pinpaixinghao" style='border:solid 1px #000000; color:#666666' size="12" />  ����������<input name="chezhuxingming" type="text" id="chezhuxingming" style='border:solid 1px #000000; color:#666666' size="12" />  ά����Ŀ��<%=Info.getselect("weixiuxiangmu","weixiuxiangmuxinxi","weixiuxiangmu"," 1=1 ")%>  ά�����ڣ�<input name="weixiuriqi1" type="text" id="weixiuriqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="weixiuriqi2" type="text" id="weixiuriqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='weixiuxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>���ƺ�</td>    <td bgcolor='#CCFFFF'>Ʒ���ͺ�</td>    <td bgcolor='#CCFFFF'>��������</td>    <td bgcolor='#CCFFFF'>��ϵ�绰</td>    <td bgcolor='#CCFFFF'>ά����Ŀ</td>    <td bgcolor='#CCFFFF'>ά������</td>    <td bgcolor='#CCFFFF'>ά�޷���</td>    <td bgcolor='#CCFFFF' width='65' align='center'>ά������</td>        
	
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <% 
  	double weixiufeiyongz=0;


  	 new CommDAO().delete(request,"weixiuxinxi"); 
    String url = "weixiuxinxi_list.jsp?1=1"; 
    String sql =  "select * from weixiuxinxi where 1=1";
	if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}if(request.getParameter("pinpaixinghao")=="" ||request.getParameter("pinpaixinghao")==null ){}else{sql=sql+" and pinpaixinghao like '%"+request.getParameter("pinpaixinghao")+"%'";}if(request.getParameter("chezhuxingming")=="" ||request.getParameter("chezhuxingming")==null ){}else{sql=sql+" and chezhuxingming like '%"+request.getParameter("chezhuxingming")+"%'";}if(request.getParameter("weixiuxiangmu")=="" ||request.getParameter("weixiuxiangmu")==null ){}else{sql=sql+" and weixiuxiangmu like '%"+request.getParameter("weixiuxiangmu")+"%'";}if (request.getParameter("weixiuriqi1")==""  ||request.getParameter("weixiuriqi1")==null ) {}else{sql=sql+" and weixiuriqi >= '"+request.getParameter("weixiuriqi1")+"'";}if (request.getParameter("weixiuriqi2")==""  ||request.getParameter("weixiuriqi2")==null ) {}else {sql=sql+" and weixiuriqi <= '"+request.getParameter("weixiuriqi2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	weixiufeiyongz=weixiufeiyongz+Float.valueOf((String)map.get("weixiufeiyong")).floatValue();


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("chepaihao") %></td>    <td><%=map.get("pinpaixinghao") %></td>    <td><%=map.get("chezhuxingming") %></td>    <td><%=map.get("lianxidianhua") %></td>    <td><%=map.get("weixiuxiangmu") %></td>    <td><%=map.get("weixiuneirong") %></td>    <td><%=map.get("weixiufeiyong") %></td>    <td><%=map.get("weixiuriqi") %></td>        
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="weixiuxinxi_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="weixiuxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="weixiuxinxi_detail.jsp?id=<%=map.get("id")%>">��ϸ</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
����ά�޷���:<%=weixiufeiyongz%>��  
${page.info }


  </body>
</html>

