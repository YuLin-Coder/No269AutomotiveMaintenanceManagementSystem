<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>年检信息</title>
	
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
	document.location.href="nianjianxinxi_add.jsp?id=<%=id%>&chepaihao="+document.form1.chepaihao.value;
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
new CommDAO().insert(request,response,"nianjianxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="nianjianxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加年检信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td>车牌号：</td><td><%=Info.getselectsl("chepaihao","chezhuxinxi","chepaihao")%>&nbsp;*<label id='clabelchepaihao' /></td></tr>		<tr><td  width="200">品牌型号：</td><td><input name='pinpaixinghao' type='text' id='pinpaixinghao' style='border:solid 1px #000000; color:#666666' >&nbsp;*<label id='clabelpinpaixinghao' /></td></tr>		<tr><td  width="200">车主姓名：</td><td><input name='chezhuxingming' type='text' id='chezhuxingming' style='border:solid 1px #000000; color:#666666' >&nbsp;*<label id='clabelchezhuxingming' /></td></tr>		<tr><td  width="200">联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' style='border:solid 1px #000000; color:#666666' ></td></tr>		<tr><td width="200">下次年检日期：</td><td><input name='xiacinianjianriqi' type='text' id='xiacinianjianriqi' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelxiacinianjianriqi' /></td></tr>		<tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		
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
 
	var chepaihaoobj = document.getElementById("chepaihao"); if(chepaihaoobj.value==""){document.getElementById("clabelchepaihao").innerHTML="&nbsp;&nbsp;<font color=red>请输入车牌号</font>";return false;}else{document.getElementById("clabelchepaihao").innerHTML="  "; } 	var pinpaixinghaoobj = document.getElementById("pinpaixinghao"); if(pinpaixinghaoobj.value==""){document.getElementById("clabelpinpaixinghao").innerHTML="&nbsp;&nbsp;<font color=red>请输入品牌型号</font>";return false;}else{document.getElementById("clabelpinpaixinghao").innerHTML="  "; } 	var chezhuxingmingobj = document.getElementById("chezhuxingming"); if(chezhuxingmingobj.value==""){document.getElementById("clabelchezhuxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入车主姓名</font>";return false;}else{document.getElementById("clabelchezhuxingming").innerHTML="  "; } 	var xiacinianjianriqiobj = document.getElementById("xiacinianjianriqi"); if(xiacinianjianriqiobj.value==""){document.getElementById("clabelxiacinianjianriqi").innerHTML="&nbsp;&nbsp;<font color=red>请输入下次年检日期</font>";return false;}else{document.getElementById("clabelxiacinianjianriqi").innerHTML="  "; } 	


return true;   
}   
popheight=450;
</script>  


