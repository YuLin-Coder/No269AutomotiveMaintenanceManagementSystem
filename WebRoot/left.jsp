<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ർ��</title>
<head>
<link rel="stylesheet" type="text/css" href="images/index.css">
<style type="text/css">
body{margin:0;padding:0;overflow-x:hidden;}
html, body{height:100%;}
img{border:none;}
*{font-family:'΢���ź�';font-size:12px;color:#626262;}
dl,dt,dd{display:block;margin:0;}
a{text-decoration:none;}

#bg{background-image:url(images/content/dotted.png);}
.container{width:100%;height:100%;margin:auto;}

/*left*/
.leftsidebar_box{width:160px;height:auto !important;overflow:visible !important;position:fixed;height:100% !important;background-color:#339999;}
.line{height:2px;width:100%;background-image:url(images/left/line_bg.png);background-repeat:repeat-x;}
.leftsidebar_box dt{padding-left:40px;padding-right:10px;background-repeat:no-repeat;background-position:10px center;color:#f5f5f5;font-size:14px;position:relative;line-height:48px;cursor:pointer;}
.leftsidebar_box dd{background-color:#339999;padding-left:40px;}
.leftsidebar_box dd a{color:#f5f5f5;line-height:20px;}
.leftsidebar_box dt img{position:absolute;right:10px;top:20px;}
.system_log dt{background-image:url(images/left/system.png)}
.custom dt{background-image:url(images/left/custom.png)}
.channel dt{background-image:url(images/left/channel.png)}
.app dt{background-image:url(images/left/app.png)}
.cloud dt{background-image:url(images/left/cloud.png)}
.syetem_management dt{background-image:url(images/left/syetem_management.png)}
.source dt{background-image:url(images/left/source.png)}
.statistics dt{background-image:url(images/left/statistics.png)}
.leftsidebar_box dl dd:last-child{padding-bottom:10px;}
</style>
</head>

<body id="bg">

<div class="container">
   
	<div class="leftsidebar_box">
	
		<dl class="system_log">
			<dt onClick="changeImage()">ϵͳ�û�����<img src="images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="yhzhgl.jsp" target="rightFrame">����Ա�ʻ�����</a></dd>
		
			<dd><a href="mod.jsp" target="rightFrame">�޸�����</a></dd>
		</dl>
	
		<dl class="custom">
			<dt onClick="changeImage()">������Ϣ����<img src="images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="chezhuxinxi_add.jsp" target="rightFrame">������Ϣ���</a></dd>
			<dd><a href="chezhuxinxi_list.jsp" target="rightFrame">������Ϣ��ѯ</a></dd>

		</dl>
	
		<dl class="channel">
			<dt onClick="changeImage()">��������<img src="images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="baoyangxiangmuxinxi_add.jsp" target="rightFrame">������Ŀ���</a></dd>
			<dd><a href="baoyangxiangmuxinxi_list.jsp" target="rightFrame">������Ŀ��ѯ</a></dd>
			<dd class="first_dd"><a href="baoyangxinxi_add.jsp" target="rightFrame">������Ϣ���</a></dd>
			<dd><a href="baoyangxinxi_list.jsp" target="rightFrame">������Ϣ��ѯ</a></dd>
		</dl>
	
		<dl class="app">
			<dt onClick="changeImage()">ά�޹���<img src="images/left/select_xl01.png"></dt>
			
				<dd class="first_dd"><a href="weixiuxiangmuxinxi_add.jsp" target="rightFrame">ά����Ŀ���</a></dd>
			<dd><a href="weixiuxiangmuxinxi_list.jsp" target="rightFrame">ά����Ŀ��ѯ</a></dd>
			
			<dd class="first_dd"><a href="weixiuxinxi_add.jsp" target="rightFrame">ά����Ϣ���</a></dd>
			<dd><a href="weixiuxinxi_list.jsp" target="rightFrame">ά����Ϣ��ѯ</a></dd>
		</dl>
	
		<dl class="cloud">
			<dt onClick="changeImage()">��챣�չ���<img src="images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="nianjianxinxi_add.jsp" target="rightFrame">�����Ϣ���</a></dd>
			<dd><a href="nianjianxinxi_list.jsp" target="rightFrame">�����Ϣ��ѯ</a></dd>
			
			
			<dd class="first_dd"><a href="baoxianxinxi_add.jsp" target="rightFrame">������Ϣ���</a></dd>
			<dd><a href="baoxianxinxi_list.jsp" target="rightFrame">������Ϣ��ѯ</a></dd>
			
		</dl>
	
		<dl class="syetem_management">
			<dt onClick="changeImage()">�������Թ���<img src="images/left/select_xl01.png"></dt>
			
			<dd><a href="liuyanxinxi_list.jsp" target="rightFrame">���Բ�ѯ�ظ�</a></dd>
		</dl>
	
		<dl class="source">
			<dt onClick="changeImage()">ԤԼ��Ϣ����<img src="images/left/select_xl01.png"></dt>
		
			<dd><a href="yuyuexinxi_list.jsp" target="rightFrame">ԤԼ��ѯ���</a></dd>
		</dl>
	
		<dl class="statistics">
			<dt>ϵͳ����<img src="images/left/select_xl01.png"></dt>
		
			
			<dd><a href="databack.jsp" target="rightFrame">���ݱ���</a></dd>
		</dl>
	
	</div>

</div>

<script type="text/javascript" src="images/jquery.js"></script>
<script type="text/javascript">
$(".leftsidebar_box dt").css({"background-color":"#339999"});
$(".leftsidebar_box dt img").attr("src","images/left/select_xl01.png");
$(function(){
	$(".leftsidebar_box dd").hide();
	$(".leftsidebar_box dt").click(function(){
		$(".leftsidebar_box dt").css({"background-color":"#339999"})
		$(this).css({"background-color": "#339999"});
		$(this).parent().find('dd').removeClass("menu_chioce");
		$(".leftsidebar_box dt img").attr("src","images/left/select_xl01.png");
		$(this).parent().find('img').attr("src","images/left/select_xl.png");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("menu_chioce");
	});
})
</script>


</body>
</html>

