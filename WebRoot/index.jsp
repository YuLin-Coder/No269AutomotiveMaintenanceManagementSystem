<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ά�ޱ�������ϵͳ</title>

<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="images/style.css" tppabs="css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
body,td,th {
	font-size: 0.28em;
}
</style>
<script src="images/jquery.js"></script>
<script src="images/verificationNumbers.js" tppabs="images/verificationNumbers.js"></script>
<script src="images/Particleground.js" tppabs="images/Particleground.js"></script>
<script>
$(document).ready(function() {
  //���ӱ�����Ч
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //��֤��
  createCode();
  //�����ύ���Խӳ���ɾ������
  $(".submit_btn").click(function(){
	  location.href="javascrpt:;"/*tpa=http://***index.html*/;
	  });
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("�û������������");
 <%}%>
 
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("��֤�����");
 <%}%>
 
 popheight = 39;

function check()
{
	if(document.form1.username.value=="" || document.form1.pwd.value=="" || document.form1.rand.value=="")
	{
		alert('����������');
		return false;
	}
}

           function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 

           
           </script>  
<body>
<dl class="admin_login">
 <dt>
  <form name="form1" method="post" action="jspm?ac=adminlogin&a=a">
  <strong><font color=white>����ά�ޱ�������ϵͳ</font></strong>
  <em>Management System</em>
 </dt>
 <dd class="user_icon">
  <input type="text" placeholder="�˺�" class="login_txtbx" name="username" id="username"/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" placeholder="����" class="login_txtbx" name="pwd" id="pwd"/>
 </dd>
 <dd>
 <div style="padding-top:10px;">
  <font color=white>Ȩ�ޣ�</font><select name="cx" id="cx">
              <option value="����Ա">����Ա</option>
              <option value="����">����</option>
            </select>
	</div>	
 </dd>
 <dd class="val_icon">
  <div class="checkcode">
    <input type="text"  placeholder="��֤��" maxlength="4" class="login_txtbx" id="pagerandom" name="pagerandom">
   
  </div>
 &nbsp; <a href="javascript:loadimage();"><img alt="����������ң�" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle" style="padding-top:10px;"> </a>
 </dd>
 <dd>
  <input type="submit" value="������½" class="submit_btn"/> <input name="login" type="hidden" id="login" value="1">
 </dd>
 <dd>

 </dd>
 
 </form>
</dl>
</body>
</html>


