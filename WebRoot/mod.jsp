<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<html>
  <head>
    
    <title>修改密码</title><link rel="stylesheet" href="css.css" type="text/css">
    

  </head>

<script>
function check()
{
	if(document.form1.ymm.value=="")
	{
		alert("请输入原密码");
		document.form1.ymm.focus();
		return false;
	}
	if(document.form1.xmm1.value=="")
	{
		alert("请输入新密码");
		document.form1.xmm1.focus();
		return false;
	}
	if(document.form1.xmm2.value=="")
	{
		alert("请输入确认密码");
		document.form1.xmm2.focus();
		return false;
	}
	if (document.form1.xmm1.value!=document.form1.xmm2.value)
	{
		alert("对不起，两次密码不一至，请重新输入");
		document.form1.xmm1.value="";
		document.form1.xmm2.value="";
		document.form1.xmm1.focus();
		return false;
	}
}

</script>
<script type="text/javascript">
<!--


<%
//out.print(Info.getadminUser(request).get("id").toString());
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 alert("原密码输入错误");
<%}%>


<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("修改成功");
<%}%>
 
 //-->
</script>
  <body >
    <form action="jspm?ac=adminuppass" name="form1" method="post">
    <table width="32%" height="126" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="9DC9FF" style="border-collapse:collapse">
    <tr>
      <td colspan="2"><div align="center">修改密码</div></td>
    </tr>
    <tr>
      <td>原密码：</td>
      <td><input name="ymm" type="text" id="ymm" /></td>
    </tr>
    <tr>
      <td>新密码：</td>
      <td><input name="xmm1" type="password" id="xmm1" /></td>
    </tr>
    <tr>
      <td>确认密码：</td>
      <td><input name="xmm2" type="password" id="xmm2" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input name="Submit" type="submit"  onClick="return check()" value="确定" />
        <input name="Submit2" type="reset" value="重置" /></td>
      </tr>
  </table>
  </form>
  </body>
</html>


