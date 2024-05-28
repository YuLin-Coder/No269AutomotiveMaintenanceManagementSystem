<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>预约信息</title>
	
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
	document.location.href="yuyuexinxi_add.jsp?id=<%=id%>";
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


ext.put("issh","否");



}
new CommDAO().insert(request,response,"yuyuexinxi",ext,true,false,""); 
%>

  <body >
 <form  action="yuyuexinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加预约信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">车牌号：</td><td><input name='chepaihao' type='text' id='chepaihao' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabelchepaihao' /></td></tr><script language="javascript">document.form1.chepaihao.value='<%=chepaihao%>';document.form1.chepaihao.setAttribute("readOnly",'true');</script>		<tr><td  width="200">品牌型号：</td><td><input name='pinpaixinghao' type='text' id='pinpaixinghao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelpinpaixinghao' /></td></tr><script language="javascript">document.form1.pinpaixinghao.value='<%=pinpaixinghao%>';document.form1.pinpaixinghao.setAttribute("readOnly",'true');</script>		<tr><td  width="200">车主姓名：</td><td><input name='chezhuxingming' type='text' id='chezhuxingming' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelchezhuxingming' /></td></tr><script language="javascript">document.form1.chezhuxingming.value='<%=chezhuxingming%>';document.form1.chezhuxingming.setAttribute("readOnly",'true');</script>		<tr><td  width="200">联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr><script language="javascript">document.form1.lianxidianhua.value='<%=lianxidianhua%>';document.form1.lianxidianhua.setAttribute("readOnly",'true');</script>		<tr><td>预约事项：</td><td><select name='yuyueshixiang' id='yuyueshixiang'><option value="车辆维修">车辆维修</option><option value="车辆保养">车辆保养</option><option value="车辆年检">车辆年检</option><option value="购买保养">购买保养</option></select></td></tr>		<tr><td width="200">预约时间：</td><td><input name='yuyueshijian' type='text' id='yuyueshijian' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelyuyueshijian' /></td></tr>		<tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		
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
 
	var chepaihaoobj = document.getElementById("chepaihao"); if(chepaihaoobj.value==""){document.getElementById("clabelchepaihao").innerHTML="&nbsp;&nbsp;<font color=red>请输入车牌号</font>";return false;}else{document.getElementById("clabelchepaihao").innerHTML="  "; } 	var pinpaixinghaoobj = document.getElementById("pinpaixinghao"); if(pinpaixinghaoobj.value==""){document.getElementById("clabelpinpaixinghao").innerHTML="&nbsp;&nbsp;<font color=red>请输入品牌型号</font>";return false;}else{document.getElementById("clabelpinpaixinghao").innerHTML="  "; } 	var chezhuxingmingobj = document.getElementById("chezhuxingming"); if(chezhuxingmingobj.value==""){document.getElementById("clabelchezhuxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入车主姓名</font>";return false;}else{document.getElementById("clabelchezhuxingming").innerHTML="  "; } 	var yuyueshijianobj = document.getElementById("yuyueshijian"); if(yuyueshijianobj.value==""){document.getElementById("clabelyuyueshijian").innerHTML="&nbsp;&nbsp;<font color=red>请输入预约时间</font>";return false;}else{document.getElementById("clabelyuyueshijian").innerHTML="  "; } 	


return true;   
}   
popheight=450;
</script>  


