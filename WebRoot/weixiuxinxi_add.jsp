<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>维修信息</title>
	
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="weixiuxinxi_add.jsp?id=<%=id%>&chepaihao="+document.form1.chepaihao.value;
}
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

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){






}
new CommDAO().insert(request,response,"weixiuxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="weixiuxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加维修信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td>车牌号：</td><td><%=Info.getselectsl("chepaihao","chezhuxinxi","chepaihao")%>&nbsp;*<label id='clabelchepaihao' /></td></tr>		<tr><td  width="200">品牌型号：</td><td><input name='pinpaixinghao' type='text' id='pinpaixinghao' style='border:solid 1px #000000; color:#666666' >&nbsp;*<label id='clabelpinpaixinghao' /></td></tr>		<tr><td  width="200">车主姓名：</td><td><input name='chezhuxingming' type='text' id='chezhuxingming' style='border:solid 1px #000000; color:#666666' >&nbsp;*<label id='clabelchezhuxingming' /></td></tr>		<tr><td  width="200">联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' style='border:solid 1px #000000; color:#666666' ></td></tr>		<tr><td>维修项目：</td><td><%=Info.getselect("weixiuxiangmu","weixiuxiangmuxinxi","weixiuxiangmu")%></td></tr>		<tr><td  width="200">维修内容：</td><td><input name='weixiuneirong' type='text' id='weixiuneirong' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr><td  width="200">维修费用：</td><td><input name='weixiufeiyong' type='text' id='weixiufeiyong' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelweixiufeiyong' /></td></tr>		<tr><td width="200">维修日期：</td><td><input name='weixiuriqi' type='text' id='weixiuriqi' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>		<tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

<%
if(request.getParameter("chepaihao")==null || request.getParameter("chepaihao").equals("")){}else{

HashMap mmm = new CommDAO().getmaps("chepaihao",request.getParameter("chepaihao"),"chezhuxinxi"); 
%>
<script language="javascript">
document.form1.chepaihao.value="<%=mmm.get("chepaihao")%>";document.form1.pinpaixinghao.value="<%=mmm.get("pinpaixinghao")%>";document.form1.chezhuxingming.value="<%=mmm.get("chezhuxingming")%>";document.form1.lianxidianhua.value="<%=mmm.get("lianxidianhua")%>";//suilafuzhi

</script>
<%
}
%>


<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var chepaihaoobj = document.getElementById("chepaihao"); if(chepaihaoobj.value==""){document.getElementById("clabelchepaihao").innerHTML="&nbsp;&nbsp;<font color=red>请输入车牌号</font>";return false;}else{document.getElementById("clabelchepaihao").innerHTML="  "; } 	var pinpaixinghaoobj = document.getElementById("pinpaixinghao"); if(pinpaixinghaoobj.value==""){document.getElementById("clabelpinpaixinghao").innerHTML="&nbsp;&nbsp;<font color=red>请输入品牌型号</font>";return false;}else{document.getElementById("clabelpinpaixinghao").innerHTML="  "; } 	var chezhuxingmingobj = document.getElementById("chezhuxingming"); if(chezhuxingmingobj.value==""){document.getElementById("clabelchezhuxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入车主姓名</font>";return false;}else{document.getElementById("clabelchezhuxingming").innerHTML="  "; } 	var weixiufeiyongobj = document.getElementById("weixiufeiyong"); if(weixiufeiyongobj.value==""){document.getElementById("clabelweixiufeiyong").innerHTML="&nbsp;&nbsp;<font color=red>请输入维修费用</font>";return false;}else{document.getElementById("clabelweixiufeiyong").innerHTML="  "; } 	var weixiufeiyongobj = document.getElementById("weixiufeiyong"); if(weixiufeiyongobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(weixiufeiyongobj.value)){document.getElementById("clabelweixiufeiyong").innerHTML=""; }else{document.getElementById("clabelweixiufeiyong").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}      


return true;   
}   
popheight=450;
</script>  


