<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>维修信息</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"weixiuxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"weixiuxinxi"); 

%>
  <form  action="weixiuxinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改维修信息:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
          <tr><td>车牌号：</td><td><input name='chepaihao' type='text' id='chepaihao' value='<%= mmm.get("chepaihao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>品牌型号：</td><td><input name='pinpaixinghao' type='text' id='pinpaixinghao' value='<%= mmm.get("pinpaixinghao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>车主姓名：</td><td><input name='chezhuxingming' type='text' id='chezhuxingming' value='<%= mmm.get("chezhuxingming")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='<%= mmm.get("lianxidianhua")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>维修项目：</td><td><%=Info.getselect("weixiuxiangmu","weixiuxiangmuxinxi","weixiuxiangmu")%></td></tr><script language="javascript">document.form1.weixiuxiangmu.value='<%=mmm.get("weixiuxiangmu")%>';</script>     <tr><td>维修内容：</td><td><input name='weixiuneirong' type='text' id='weixiuneirong' size='50' value='<%=mmm.get("weixiuneirong")%>' style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>维修费用：</td><td><input name='weixiufeiyong' type='text' id='weixiufeiyong' value='<%= mmm.get("weixiufeiyong")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>维修日期：</td><td><input name='weixiuriqi' type='text' id='weixiuriqi' value='<%= mmm.get("weixiuriqi")%>' onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" readonly='readonly'  /></td></tr>     <tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=mmm.get("beizhu")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


