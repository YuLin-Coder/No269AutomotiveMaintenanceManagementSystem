<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%> 
<%
String glb = request.getParameter("glb")==null?"":request.getParameter("glb");
String glzd = request.getParameter("glzd")==null?"":request.getParameter("glzd");
String value = request.getParameter("value")==null?"":request.getParameter("value"); 
String ctype = request.getParameter("ctype")==null?"":request.getParameter("ctype");
String jlzd = request.getParameter("jlzd")==null?"":request.getParameter("jlzd");
String jlzdb = request.getParameter("jlzdb")==null?"":request.getParameter("jlzdb");
String zd = request.getParameter("zd")==null?"":request.getParameter("zd");
System.out.println(ctype+"   ------------------------------------------");
glzd = Info.getGBKStr(glzd);
value = Info.getGBKStr(value);
String insql = value.replaceAll(" ","");
String insqld = "";
for(String str:insql.split("-"))
{
if(str.split(":").length==1){
insqld+=str.trim()+",";
}else{
insqld+=str.split(":")[1].trim()+",";
}
}
 
if(insqld.length()>0)insqld = insqld.substring(0,insqld.length()-1);
String likesql = "";
for(String str:insqld.split(","))
{
   if(!str.trim().equals(""))
   {
   if(jlzdb.equals("tglparentid")||jlzdb.equals("datashowname"))
   {
   likesql+= " or tglparentid in( select id from "+glb+" where datashowname like'%"+str+"%' ) ";
   }else{
   likesql+= " or "+jlzdb+" like'%"+str+"%' ";
   }
   }
   
   
}
String sql = "select * from "+glb+" where 1!=1 "+likesql; 
 
if(ctype.equals("select")){
String select = "@@@";
	for(HashMap permap:new CommDAO().select(sql)){ 
	String optionstr = "";
	if(glzd.split(";").length==1){
	optionstr=permap.get(glzd.split("~")[0]).toString();
	}else{
	for(String str:glzd.split(";"))
	{
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
	} 
	}
	if(optionstr.indexOf(" - ")>-1)optionstr=optionstr.substring(0,optionstr.length()-3);
	select+=optionstr+"@@@";
	}
 if(select.length()>3)select.substring(0,select.length()-3).trim();
 
out.print(select);
 }
 
 
 if(ctype.equals("text")){
String select = ""; 
	for(HashMap permap:new CommDAO().select(sql)){ 
	String optionstr = "";
	if(glzd.split(";").length==1){
	optionstr=permap.get(glzd.split("~")[0]).toString();
	}else{
	for(String str:glzd.split(";"))
	{
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
	} 
	}
	if(optionstr.indexOf(" - ")>-1)optionstr=optionstr.substring(0,optionstr.length()-3);
	select+=optionstr+" ";
	} 
 
out.print(select.trim());
 }
 
 
 
if(ctype.equals("radio")){
String radio = "";
    int dxii = 0;
	for(HashMap permap:new CommDAO().select(sql)){ 
	 String check="";
	 if(dxii==0)check="checked=checked";
	String optionstr = "";
	if(glzd.split(";").length==1){
	optionstr=permap.get(glzd.split("~")[0]).toString();
	}else{
	
	for(String str:glzd.split(";"))
	{
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
	} 
	}
	if(optionstr.indexOf(" - ")>-1)optionstr=optionstr.substring(0,optionstr.length()-3);
	radio+="<label><input type='radio' name='"+zd+"' "+check+" value=\""+optionstr+"\">"+optionstr+"</label>\n";
	 dxii++;
	}
 if(radio.length()>3)radio.substring(0,radio.length()-3).trim();
 
out.print(radio);
 }
 
 
if(ctype.equals("checkbox")){
String checkbox = "";
    int dxii = 0;
	for(HashMap permap:new CommDAO().select(sql)){ 
	 String check="";
	 if(dxii==0)check="checked=checked";
	String optionstr = "";
	System.out.println(glzd);
	if(glzd.split(";").length==1){
	optionstr=permap.get(glzd.split("~")[0]).toString();
	}else{
	
	for(String str:glzd.split(";"))
	{
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
	} 
	}
	if(optionstr.indexOf(" - ")>-1)optionstr=optionstr.substring(0,optionstr.length()-3);
	checkbox+="<label><input type='checkbox' name='"+zd+"' "+check+" value=\""+optionstr+"\">"+optionstr+"</label>\n";
	 dxii++;
	}
	checkbox+="<input type=hidden name='"+zd+"' value='' />";
 if(checkbox.length()>3)checkbox.substring(0,checkbox.length()-3).trim();
 
out.print(checkbox);
 }
 
 
if(ctype.equals("checkboxdk")){
String checkbox = "";
  int i=0;
for(HashMap permap:new CommDAO().select(sql)){ 
 
 String optionstr = "";
 for(String str:glzd.split(";"))
 {
	 String zdstr = str.split("~")[0];
	 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
	 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
 }
 if(optionstr.length()>0)optionstr=optionstr.substring(0,optionstr.length()-3);
 String nbs = "";
 if(i>0)nbs="&nbsp;";
 checkbox+="<label>"+nbs+"<input type='checkbox' name='"+zd+"' value=\""+optionstr+"\">"+optionstr+"</label>&nbsp;&nbsp;\n";
 checkbox+="<label>&nbsp;- 这里要改 &nbsp;<input type='text' size='5' name='"+optionstr+"' value=\"\"></label><br />\n";
 i++;
}
checkbox+="<input type=hidden name='"+zd+"' value='' /><input type=hidden name='dk-"+zd+"-value' value='这里要改' />";
 
out.print(checkbox);
 }
 
 
%>