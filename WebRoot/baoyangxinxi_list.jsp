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
   ����:  ���ƺţ�<input name="chepaihao" type="text" id="chepaihao" style='border:solid 1px #000000; color:#666666' size="12" />  Ʒ���ͺţ�<input name="pinpaixinghao" type="text" id="pinpaixinghao" style='border:solid 1px #000000; color:#666666' size="12" />  ����������<input name="chezhuxingming" type="text" id="chezhuxingming" style='border:solid 1px #000000; color:#666666' size="12" />  ������Ŀ��<%=Info.getselect("baoyangxiangmu","baoyangxiangmuxinxi","baoyangxiangmu"," 1=1 ")%>  �������ڣ�<input name="baoyangriqi1" type="text" id="baoyangriqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="baoyangriqi2" type="text" id="baoyangriqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='baoyangxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>���ƺ�</td>    <td bgcolor='#CCFFFF'>Ʒ���ͺ�</td>    <td bgcolor='#CCFFFF'>��������</td>    <td bgcolor='#CCFFFF'>��ϵ�绰</td>    <td bgcolor='#CCFFFF'>������Ŀ</td>    <td bgcolor='#CCFFFF'>��������</td>    <td bgcolor='#CCFFFF'>��������</td>    <td bgcolor='#CCFFFF' width='65' align='center'>��������</td>        
	
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <% 
  	double baoyangfeiyongz=0;


  	 new CommDAO().delete(request,"baoyangxinxi"); 
    String url = "baoyangxinxi_list.jsp?1=1"; 
    String sql =  "select * from baoyangxinxi where 1=1";
	if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}if(request.getParameter("pinpaixinghao")=="" ||request.getParameter("pinpaixinghao")==null ){}else{sql=sql+" and pinpaixinghao like '%"+request.getParameter("pinpaixinghao")+"%'";}if(request.getParameter("chezhuxingming")=="" ||request.getParameter("chezhuxingming")==null ){}else{sql=sql+" and chezhuxingming like '%"+request.getParameter("chezhuxingming")+"%'";}if(request.getParameter("baoyangxiangmu")=="" ||request.getParameter("baoyangxiangmu")==null ){}else{sql=sql+" and baoyangxiangmu like '%"+request.getParameter("baoyangxiangmu")+"%'";}if (request.getParameter("baoyangriqi1")==""  ||request.getParameter("baoyangriqi1")==null ) {}else{sql=sql+" and baoyangriqi >= '"+request.getParameter("baoyangriqi1")+"'";}if (request.getParameter("baoyangriqi2")==""  ||request.getParameter("baoyangriqi2")==null ) {}else {sql=sql+" and baoyangriqi <= '"+request.getParameter("baoyangriqi2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	baoyangfeiyongz=baoyangfeiyongz+Float.valueOf((String)map.get("baoyangfeiyong")).floatValue();


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("chepaihao") %></td>    <td><%=map.get("pinpaixinghao") %></td>    <td><%=map.get("chezhuxingming") %></td>    <td><%=map.get("lianxidianhua") %></td>    <td><%=map.get("baoyangxiangmu") %></td>    <td><%=map.get("baoyangneirong") %></td>    <td><%=map.get("baoyangfeiyong") %></td>    <td><%=map.get("baoyangriqi") %></td>        
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="baoyangxinxi_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="baoyangxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="baoyangxinxi_detail.jsp?id=<%=map.get("id")%>">��ϸ</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
���Ʊ�������:<%=baoyangfeiyongz%>��  
${page.info }


  </body>
</html>

