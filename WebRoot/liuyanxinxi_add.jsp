<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>������Ϣ</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  
 

 HashMap mssdq = new CommDAO().getmaps("chepaihao",(String)request.getSession().getAttribute("username"),"chezhuxinxi");
 String chepaihao="";  	String pinpaixinghao="";  	String chezhuxingming="";  	String lianxidianhua="";  	
 chepaihao=(String)mssdq.get("chepaihao");  	pinpaixinghao=(String)mssdq.get("pinpaixinghao");  	chezhuxingming=(String)mssdq.get("chezhuxingming");  	lianxidianhua=(String)mssdq.get("lianxidianhua");  	
   %>
<script language="javascript">

function gow()
{
	document.location.href="liuyanxinxi_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"��", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"��";
	}
}
</script>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){






}
new CommDAO().insert(request,response,"liuyanxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="liuyanxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  ���������Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">���ƺţ�</td><td><input name='chepaihao' type='text' id='chepaihao' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabelchepaihao' /></td></tr><script language="javascript">document.form1.chepaihao.value='<%=chepaihao%>';document.form1.chepaihao.setAttribute("readOnly",'true');</script>		<tr><td  width="200">Ʒ���ͺţ�</td><td><input name='pinpaixinghao' type='text' id='pinpaixinghao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelpinpaixinghao' /></td></tr><script language="javascript">document.form1.pinpaixinghao.value='<%=pinpaixinghao%>';document.form1.pinpaixinghao.setAttribute("readOnly",'true');</script>		<tr><td  width="200">����������</td><td><input name='chezhuxingming' type='text' id='chezhuxingming' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelchezhuxingming' /></td></tr><script language="javascript">document.form1.chezhuxingming.value='<%=chezhuxingming%>';document.form1.chezhuxingming.setAttribute("readOnly",'true');</script>		<tr><td  width="200">��ϵ�绰��</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr><script language="javascript">document.form1.lianxidianhua.value='<%=lianxidianhua%>';document.form1.lianxidianhua.setAttribute("readOnly",'true');</script>		<tr><td  width="200">�������ݣ�</td><td><input name='liuyanneirong' type='text' id='liuyanneirong' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr style='display:none'><td  width="200">�ظ���</td><td><input name='huifu' type='text' id='huifu' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr><td  width="200">��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>




<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var chepaihaoobj = document.getElementById("chepaihao"); if(chepaihaoobj.value==""){document.getElementById("clabelchepaihao").innerHTML="&nbsp;&nbsp;<font color=red>�����복�ƺ�</font>";return false;}else{document.getElementById("clabelchepaihao").innerHTML="  "; } 	var pinpaixinghaoobj = document.getElementById("pinpaixinghao"); if(pinpaixinghaoobj.value==""){document.getElementById("clabelpinpaixinghao").innerHTML="&nbsp;&nbsp;<font color=red>������Ʒ���ͺ�</font>";return false;}else{document.getElementById("clabelpinpaixinghao").innerHTML="  "; } 	var chezhuxingmingobj = document.getElementById("chezhuxingming"); if(chezhuxingmingobj.value==""){document.getElementById("clabelchezhuxingming").innerHTML="&nbsp;&nbsp;<font color=red>�����복������</font>";return false;}else{document.getElementById("clabelchezhuxingming").innerHTML="  "; } 	


return true;   
}   
popheight=450;
</script>  


