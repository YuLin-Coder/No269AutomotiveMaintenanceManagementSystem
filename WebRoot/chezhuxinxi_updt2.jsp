<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>������Ϣ</title>
	<!--bixanjxiqxi-->
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">

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

  <body >
<% 

String id = request.getParameter("id"); 
HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"chezhuxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmaps("chepaihao",(String)request.getSession().getAttribute("username"),"chezhuxinxi"); 
%>
  <form  action="chezhuxinxi_updt2.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸ĳ�����Ϣ:
  <br><br>
  <%
  
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
          <tr><td>���ƺţ�</td><td><input name='chepaihao' type='text' id='chepaihao' value='<%= mmm.get("chepaihao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>���룺</td><td><input name='mima' type='text' id='mima' value='<%= mmm.get("mima")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>Ʒ���ͺţ�</td><td><input name='pinpaixinghao' type='text' id='pinpaixinghao' value='<%= mmm.get("pinpaixinghao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>��ɫ��</td><td><select name='yanse' id='yanse'><option value="��">��</option><option value="��">��</option><option value="��">��</option><option value="��">��</option><option value="��">��</option><option value="�ۺ�">�ۺ�</option><option value="����">����</option><option value="��">��</option><option value="��">��</option></select></td></tr><script language="javascript">document.form1.yanse.value='<%=mmm.get("yanse")%>';</script>     <tr><td>�״��������ڣ�</td><td><input name='shoucishangpairiqi' type='text' id='shoucishangpairiqi' value='<%= mmm.get("shoucishangpairiqi")%>' onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" readonly='readonly'  /></td></tr>     <tr><td>����������</td><td><input name='chezhuxingming' type='text' id='chezhuxingming' value='<%= mmm.get("chezhuxingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>�Ա�</td><td><select name='xingbie' id='xingbie'><option value="��">��</option><option value="Ů">Ů</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=mmm.get("xingbie")%>';</script>     <tr><td>��ϵ�绰��</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='<%= mmm.get("lianxidianhua")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=mmm.get("beizhu")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return check();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


