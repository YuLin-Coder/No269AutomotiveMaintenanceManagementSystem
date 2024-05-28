<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>车主信息</title>
	
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
	document.location.href="chezhuxinxi_add.jsp?id=<%=id%>";
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
new CommDAO().insert(request,response,"chezhuxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="chezhuxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加车主信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">车牌号：</td><td><input name='chepaihao' type='text' id='chepaihao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelchepaihao' /></td></tr>		<tr><td  width="200">密码：</td><td><input name='mima' type='text' id='mima' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelmima' /></td></tr>		<tr><td  width="200">品牌型号：</td><td><input name='pinpaixinghao' type='text' id='pinpaixinghao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelpinpaixinghao' /></td></tr>		<tr><td>颜色：</td><td><select name='yanse' id='yanse'><option value="红">红</option><option value="黑">黑</option><option value="白">白</option><option value="棕">棕</option><option value="黄">黄</option><option value="粉红">粉红</option><option value="香槟">香槟</option><option value="绿">绿</option><option value="紫">紫</option></select></td></tr>		<tr><td width="200">首次上牌日期：</td><td><input name='shoucishangpairiqi' type='text' id='shoucishangpairiqi' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>		<tr><td  width="200">车主姓名：</td><td><input name='chezhuxingming' type='text' id='chezhuxingming' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelchezhuxingming' /></td></tr>		<tr><td>性别：</td><td><select name='xingbie' id='xingbie'><option value="男">男</option><option value="女">女</option></select></td></tr>		<tr><td  width="200">联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabellianxidianhua' />必需手机格式</td></tr>		<tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
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
 
	var chepaihaoobj = document.getElementById("chepaihao"); if(chepaihaoobj.value==""){document.getElementById("clabelchepaihao").innerHTML="&nbsp;&nbsp;<font color=red>请输入车牌号</font>";return false;}else{document.getElementById("clabelchepaihao").innerHTML="  "; } 	var chepaihaoobj = document.getElementById("chepaihao");  
if(chepaihaoobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=chezhuxinxi&col=chepaihao&value="+chepaihaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelchepaihao").innerHTML="&nbsp;&nbsp;<font color=red>车牌号已存在</font>";  
return false;
}else{document.getElementById("clabelchepaihao").innerHTML="  ";  
}  
} 	var mimaobj = document.getElementById("mima"); if(mimaobj.value==""){document.getElementById("clabelmima").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";return false;}else{document.getElementById("clabelmima").innerHTML="  "; } 	var pinpaixinghaoobj = document.getElementById("pinpaixinghao"); if(pinpaixinghaoobj.value==""){document.getElementById("clabelpinpaixinghao").innerHTML="&nbsp;&nbsp;<font color=red>请输入品牌型号</font>";return false;}else{document.getElementById("clabelpinpaixinghao").innerHTML="  "; } 	var chezhuxingmingobj = document.getElementById("chezhuxingming"); if(chezhuxingmingobj.value==""){document.getElementById("clabelchezhuxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入车主姓名</font>";return false;}else{document.getElementById("clabelchezhuxingming").innerHTML="  "; } 	var lianxidianhuaobj = document.getElementById("lianxidianhua"); if(lianxidianhuaobj.value!=""){ if(/^1[3|4|5|8][0-9]\d{4,8}$/.test(lianxidianhuaobj.value)){document.getElementById("clabellianxidianhua").innerHTML=""; }else{document.getElementById("clabellianxidianhua").innerHTML="&nbsp;&nbsp;<font color=red>必需手机格式</font>"; return false;}}      


return true;   
}   
popheight=450;
</script>  


