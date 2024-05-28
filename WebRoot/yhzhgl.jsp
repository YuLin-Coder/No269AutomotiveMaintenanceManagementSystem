<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
if(request.getSession().getAttribute("username")==null )
{
	
	out.print("<script>javascript:alert('对不起，您已超时或未登陆,请在IE中重新打开登陆！');window.close();</script>");
	out.close();
}
else
{
	if(request.getSession().getAttribute("cx").equals("超级管理员"))
	{}
	else
	{
		
		out.print("<script>javascript:alert('对不起，您无权操作此模块！');history.back();</script>");
		out.close();
	}

}
%>
<html>
  <head>
    
    <title>管理员用户管理</title><link rel="stylesheet" href="css.css" type="text/css">
    

  </head>

<%
 new CommDAO().delete(request,"allusers"); 

HashMap ext = new HashMap(); 

ext.put("cx","普通管理员"); 
new CommDAO().insert(request,response,"allusers",ext,true,false,""); 
%>

  <body >
<form  action="yhzhgl.jsp?f=f"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
     <tr>
      <td width="200">用户名：</td>
      <td><input name="username" type="text" id="username" onblur='checkform()' /> <label id='clabelusername' />
      *</td>
    </tr>
    <tr>
      <td width="200">密码：</td>
      <td><input name="pwd" type="password" id="pwd" onblur='checkform()' /> <label id='clabelpwd' />
      *</td>
    </tr>
    <tr>
      <td width="200">确认密码：</td>
      <td><input name="pwd2" type="password" id="pwd2" onblur='checkform()' /> <label id='clabelpwd2' />
      *</td>
    </tr>
    <tr>
      <td width="200">&nbsp;</td>
      <td><input name="Submit" type="submit"   value="提交" />
      <input name="Submit2" type="reset"  value="重置" /></td>
    </tr>
  </table>
</form>
<p>已有管理员列表：</p>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td bgcolor="A4B6D7">序号</td>
    <td bgcolor="A4B6D7">用户名</td>
    <td bgcolor="A4B6D7">密码</td>
    <td bgcolor="A4B6D7">权限</td>
    <td bgcolor="A4B6D7">添加时间</td>
    <td bgcolor="A4B6D7">操作</td>
  </tr>
  <%
				int i=0;						
    for(HashMap map:new CommDAO().select("select * from allusers order by id desc ")){
	i++;
     %>
  <tr>
    <td><%=i %></td>
    <td><%=map.get("username") %></td>
    <td><%=map.get("pwd") %></td>
    <td><%=map.get("cx") %></td>
    <td><%=map.get("addtime") %></td>
    <td><a href="yhzhgl.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a></td>
  </tr>
  <%}%>
</table>
  </body>
</html>

<script language=javascript src='js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='js/popup.js'></script>
<script language=javascript src='js/ajax.js'></script>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<script language=javascript >  
 
 function checkform(){  
var usernameobj = document.getElementById("username");  
if(usernameobj.value==""){  
document.getElementById("clabelusername").innerHTML="&nbsp;&nbsp;<font color=red>请输入用户名</font>";  
return false;  
}else{
document.getElementById("clabelusername").innerHTML="  ";  
}  
  
var usernameobj = document.getElementById("username");  
if(usernameobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=allusers&col=username&value="+usernameobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelusername").innerHTML="&nbsp;&nbsp;<font color=red>用户名已存在</font>";  
return false;
}else{document.getElementById("clabelusername").innerHTML="  ";  
}  
}  
var pwdobj = document.getElementById("pwd");  
if(pwdobj.value==""){  
document.getElementById("clabelpwd").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";  
return false;  
}else{
document.getElementById("clabelpwd").innerHTML="  ";  
}  

var pwd2obj = document.getElementById("pwd2");  
if(pwd2obj.value==""){  
document.getElementById("clabelpwd2").innerHTML="&nbsp;&nbsp;<font color=red>请再次输入密码</font>";  
return false;  
}else{
document.getElementById("clabelpwd2").innerHTML="  ";  
}

if(pwd2obj.value!=pwdobj.value){  
document.getElementById("clabelpwd2").innerHTML="&nbsp;&nbsp;<font color=red>两次密码输入不一致</font>";  
return false;  
}else{
document.getElementById("clabelpwd2").innerHTML="  ";  
}
 
  



return true;   
}   
popheight=450;
</script>  


