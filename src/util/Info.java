package util;



import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommDAO;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;


public class Info {
	
	
	 
	
	
	//public static String popheight = "alliframe.height=document.body.clientHeight+";
	public static String popheight = "alliframe.style.height=document.body.scrollHeight+";
	
    public static HashMap getUser(HttpServletRequest request)
    {
    	HashMap map = (HashMap)(request.getSession().getAttribute("username")==null?request.getSession().getAttribute("user"):request.getSession().getAttribute("username"));
        return map;
    }
	
	
	public static int getBetweenDayNumber(String dateA, String dateB) {
		long dayNumber = 0;
		//1小时=60分钟=3600秒=3600000
		long mins = 60L * 1000L;
		//long day= 24L * 60L * 60L * 1000L;计算天数之差
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
		   java.util.Date d1 = df.parse(dateA);
		   java.util.Date d2 = df.parse(dateB);
		   dayNumber = (d2.getTime() - d1.getTime()) / mins;
		} catch (Exception e) {
		   e.printStackTrace();
		}
		return (int) dayNumber;
		}
	
	public static void main(String[] g )
	{
	System.out.print(Info.getBetweenDayNumber("2012-11-11 11:19", "2012-11-11 11:11"));
	}
	
	
	
	 public static String getselect(String name,String tablename,String zdname)
	 {
		 String select = "<select name=\""+name+"\" id=\""+name+"\" >";
		 for(HashMap permap:new CommDAO().select("select * from "+tablename+" order by id desc")){ 
			 select+="<option value=\""+permap.get(zdname)+"\">"+permap.get(zdname)+"</option>";
		 }
		 select+="</select>";
		 return select;
	 }
	  public static String getselectsl(String name,String tablename,String zdname)
	 {
		 String select = "<select name=\""+name+"\" id=\""+name+"\" onchange='gow();'>";
		 select+="<option value=''>请选择</option>";
		
		 for(HashMap permap:new CommDAO().select("select * from "+tablename+" order by id desc")){ 
			 select+="<option value=\""+permap.get(zdname)+"\">"+permap.get(zdname)+"</option>";
		 }
		 select+="</select>";
		 return select;
	 }
	 
	 public static String getselect(String name,String tablename,String zdname,String where)
	 {
		  
		 String select = "<select name=\""+name+"\" id=\""+name+"\" >";
		 select+="<option value=\"\">不限</option>";
		 for(HashMap permap:new CommDAO().select("select * from "+tablename+" where "+where+" order by id desc")){ 
			 String optionstr = "";
			
			 if(zdname.split(";").length==1){
			  
				 optionstr=permap.get(zdname.split("~")[0]).toString();

			  
			 }else{
				 for(String str:zdname.split(";"))
				 {
					 String zdstr = str.split("~")[0];
					 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
					 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
				 } 
			 }
			 
			 
			 
			 if(optionstr.indexOf(" - ")>-1)optionstr=optionstr.substring(0,optionstr.length()-3);
			 select+="<option value=\""+optionstr+"\">"+optionstr+"</option>";
		 }
		 select+="</select>";
		 return select;
	 }
	 
	 public static String getradio(String name,String tablename,String zdname,String where)
	 { 
		 String radio="";
		 int dxii = 0;
		 for(HashMap permap:new CommDAO().select("select * from "+tablename+" where  "+where+" order by id desc")){ 
			 String check="";
			 if(dxii==0)check="checked=checked";
			 
			 String optionstr = "";
			 for(String str:zdname.split(";"))
			 {
				 String zdstr = str.split("~")[0];
				 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
				 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
			 }
			 if(optionstr.length()>0)optionstr=optionstr.substring(0,optionstr.length()-3);
			 
			 radio+="<label><input type='radio' name='"+name+"' "+check+" value=\""+optionstr+"\">"+optionstr+"</label>\n";
			 dxii++;
		 }
		 return radio;
	 }
	 
	 
	 public static void writeExcel(String fileName,String prosstr,java.util.List<List> plist,HttpServletRequest request, HttpServletResponse response){    
	        WritableWorkbook  wwb = null;    
	        String cols = "";
	        for(String str:prosstr.split("@"))
	        {
	        	cols+=str.split("-")[0]+",";
	        }
	        cols = cols.substring(0,cols.length()-1);
	        String where = request.getAttribute("where")==null?"":request.getAttribute("where").toString();
	        List<List> mlist = new CommDAO().selectforlist("select "+cols+" from "+fileName+" "+where+"  order by id desc");
	        
	        fileName = request.getRealPath("/")+"/upfile/"+Info.generalFileName("a.xls");
	        String[] pros = prosstr.split("@");
	        try {    
	            //首先要使用Workbook类的工厂方法创建一个可写入的工作薄(Workbook)对象    
	            wwb = Workbook.createWorkbook(new File(fileName));    
	        } catch (IOException e) {    
	            e.printStackTrace();    
	        }    
	        if(wwb!=null){    
	            //创建一个可写入的工作表    
	            //Workbook的createSheet方法有两个参数，第一个是工作表的名称，第二个是工作表在工作薄中的位置    
	            WritableSheet ws = wwb.createSheet("sheet1", 0);    
	            ws.setColumnView(0,20);
	            ws.setColumnView(1,20);
	            ws.setColumnView(2,20);
	            ws.setColumnView(3,20);
	            ws.setColumnView(4,20);
	            ws.setColumnView(5,20);

	            try {
	            
	            	
	            for(int i=0;i<pros.length;i++)
	            {
	            Label label1 = new Label(i, 0,"");
	            
	            label1.setString(pros[i]);
	            ws.addCell(label1);
	            }
	            
	            } catch (RowsExceededException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (WriteException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}    
	             //下面开始添加单元格  
				int i=1;
	            for(List t:mlist){  
	            	try {
	            		
	            	Iterator it = t.iterator();
	            	int jj=0;
	            		while(it.hasNext())
	            		{
	            	Label label1 = new Label(jj, i,"");
	            	
	            	String a = it.next().toString();
		            label1.setString(a);
		            ws.addCell(label1);
		            jj++;
	            		}
		            
		            i++;
	            } catch (RowsExceededException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (WriteException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}    
	            }    
	   
	            try {    
	                //从内存中写入文件中    
	                wwb.write();    
	                //关闭资源，释放内存    
	                wwb.close();    
	            } catch (IOException e) {    
	                e.printStackTrace();    
	            } catch (Exception e) {    
	                e.printStackTrace();    
	            }    
	        }
	        
	        try {
				response.sendRedirect("upload?filename="+fileName.substring(fileName.lastIndexOf("/")+1));
			} catch (IOException e) {
				e.printStackTrace();
			}
	        
	    }    
	 
	 
	 public static String getcheckbox(String name,String tablename,String zdname,String where)
	 { 
		 String checkbox="";
		 for(HashMap permap:new CommDAO().select("select * from "+tablename+" where "+where+" order by id desc")){ 
			 
			 String optionstr = "";
			 for(String str:zdname.split(";"))
			 {
				 String zdstr = str.split("~")[0];
				 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
				 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
			 }
			 if(optionstr.length()>0)optionstr=optionstr.substring(0,optionstr.length()-3);
			 
			 checkbox+="<label><input type='checkbox' name='"+name+"' value=\""+optionstr+"\">"+optionstr+"</label>\n";
		 }
		 checkbox+="<input type=hidden name='"+name+"' value='' />";
		 return checkbox;
	 }
	 
	 
	 public static String getCombox(String tablename,String zdname,String where)
	 { 
		 String checkbox="";
		 for(HashMap permap:new CommDAO().select("select * from "+tablename+" where "+where+" order by id desc")){ 
			 
			 String optionstr = "'";
			 for(String str:zdname.split(";"))
			 {
				 if(str.indexOf("~")>-1){
				 String zdstr = str.split("~")[0];
				 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
				 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
				 }else{ 
					 optionstr+=permap.get(str); 
				 }
			 }
			 if(optionstr.length()>0)optionstr=optionstr.substring(0,optionstr.length()-3);
			 optionstr+="',";
			 checkbox+= optionstr;
		 }
		 if(checkbox.length()>0)checkbox=checkbox.substring(0,checkbox.length()-1);
		 
		 return checkbox;
	 }
	 
	 
	 
	 
	 public static String getcheckboxDk(String name,String tablename,String zdname,String nstr,String where)
	 { 
		 String checkbox="";
		 int i=0;
		 for(HashMap permap:new CommDAO().select("select * from "+tablename+" where "+where+" order by id desc")){ 
			 
			 String optionstr = "";
			 for(String str:zdname.split(";"))
			 {
				 String zdstr = str.split("~")[0];
				 String zdnamestr = str.split("~")[1].equals("无名")?"":(str.split("~")[1]+":");
				 optionstr+=zdnamestr+permap.get(zdstr)+" - ";
			 }
			 if(optionstr.length()>0)optionstr=optionstr.substring(0,optionstr.length()-3);
			 String nbs = "";
			 if(i>0)nbs="&nbsp;";
			 checkbox+="<label>"+nbs+"<input type='checkbox' name='"+name+"' value=\""+optionstr+"\">"+optionstr+"</label>&nbsp;&nbsp;\n";
			 checkbox+="<label>&nbsp;- "+nstr+" &nbsp;<input type='text' size='5' name='"+optionstr+"' value=\"\"></label><br />\n";
			 i++;
		 }
		 checkbox+="<input type=hidden name='"+name+"' value='' /><input type=hidden name='dk-"+name+"-value' value='"+nstr+"' />";
		 return checkbox;
	 }
	 

	 public static String getFileUpInfo()
		{
			String jscode = "";
			jscode+="<script src=js/popup.js></script>";
			jscode+="<font onclick=\"uploaddoc()\" src=\"js/nopic.jpg\" style='cursor:hand' id=txt >点击此处上传</font>";
			jscode+="&nbsp;&nbsp;<input type=text readonly style='border:0px' size=30  name=\"docname\" id=\"docname\" value=\"\" />";
			return jscode;
		}
	 
	 public static String getFileUpInfo2()
		{
			String jscode = "";
			jscode+="<script src=js/popup.js></script>";
			jscode+="<font onclick=\"uploaddoc2()\" src=\"js/nopic.jpg\" style='cursor:hand' id=filetxt2 >点击此处上传</font>";
			jscode+="&nbsp;&nbsp;<input type=text readonly style='border:0px' size=30  name=\"docname2\" id=\"docname2\" value=\"\" />";
			return jscode;
		}
	 
	 public static String getFileUpInfo3()
		{
			String jscode = "";
			jscode+="<script src=js/popup.js></script>";
			jscode+="<font onclick=\"uploaddoc3()\" src=\"js/nopic.jpg\" style='cursor:hand' id=filetxt3 >点击此处上传</font>";
			jscode+="&nbsp;&nbsp;<input type=text readonly style='border:0px' size=30  name=\"docname3\" id=\"docname3\" value=\"\" />";
			return jscode;
		}

	  public static String tform(HashMap map,String formname)
		{
	    	String jscode = "";
	    	try{
	    	jscode+="<script type=\"text/javascript\">\n";
	    	jscode+="function getPvalue()\n";
	    	jscode+="{\n";
	    	
	    	Set set = map.entrySet();
	    	 Iterator it = set.iterator();
	    	 while(it.hasNext())
	    	 {
	    	  String pm=((Object)it.next()).toString();
	    	  String str1 = "";
	    	  String str2 = "";
	    	  String[] strs = pm.split("=");
	    	  str1 = strs[0];
	    	  if(strs.length==1)str2="";
	    	  if(strs.length==2)str2=strs[1];
	    	  str2 = str2.replaceAll("\r\n", "---");
			 // str2 = str2.replaceAll("\"", "'");
	    	 
	    	  if(!str1.equals("content")){
	    	  
	    	  jscode+=" if(document.getElementsByName(\""+str1+"\").length>1)\n";
	    	  jscode+=" {\n";
	    	  jscode+=" var radios = document.getElementsByName(\""+str1+"\");\n";
	    	 
	    	  jscode+=" if(radios[0].type=='radio'){\n";
	    	  jscode+=" for(var i=0;i<radios.length;i++)\n";
	    	  jscode+=" {\n";
	    	  jscode+=" if(radios[i].value==\""+str2+"\")\n";
	    	  jscode+=" {\n";
	    	  jscode+=" radios[i].checked=\"checked\";\n";
	    	  jscode+=" }\n";
	    	  jscode+=" }\n";
	    	  jscode+=" }\n";
	    	   
	    	  
	    	  jscode+=" if(radios[0].type=='checkbox'){\n";
	    	  
	    	  
	    	  
	    	  jscode+=" for(var i=0;i<radios.length;i++)\n";
	    	  jscode+=" {\n"; 
	    	  jscode+=" if(\""+str2+"\".indexOf(radios[i].value)>-1&&radios[i].id.indexOf('choosebox')==-1)\n";
	    	  jscode+=" {\n";
	    	  
	    	  jscode+=" radios[i].checked=\"checked\";\n";
	    	  
	    	 
	    	  if(str2.indexOf(" - ")>-1){
	    		for(String strch:str2.split(" ~ ")){  
		    	  
	    		  String strchname = strch.substring(0,strch.lastIndexOf(" - "));
	    		  jscode+=" if(document.getElementsByName('"+strchname+"').length>0)\n";
		    	  jscode+=" {\n";
		    	  jscode+=" document.getElementsByName('"+strchname+"')[0].value='"+strch.substring(strch.lastIndexOf(":")+1)+"';\n";
		    	  jscode+=" }\n";
		    	  
		    	  
	    		}
	    	 }
	    	  
	    	  
	    	  jscode+=" }\n";
	    	  jscode+=" }\n";
	    	  jscode+=" }\n";
	    	  
	    	  jscode+=" if(radios.type=='select'){\n";
	    	  jscode+=" "+formname+"."+str1+".value=\""+str2+"\";\n";
	    	  jscode+=" }\n";
	    	  
	    	  
	    	  jscode+=" }else{\n";
	    	  jscode+=" if("+formname+"."+str1+")\n";
	    	  jscode+="{\n";
	    	  jscode+=""+formname+"."+str1+".value=\""+str2+"\";\n";
	    	  jscode+="}\n";
	    	  jscode+="}\n";
	    	  
	    	
	    	  jscode+="if(document.getElementById(\"txt\"))\n";
	    	  jscode+="{\n";
	    	  jscode+="document.getElementById(\"txt\").src=\"upfile/"+map.get("filename")+"\";\n";
	    	  jscode+="}\n";
	    	  
	    	  jscode+="if(document.getElementById(\"txt2\"))\n";
	    	  jscode+="{\n";
	    	  jscode+="document.getElementById(\"txt2\").src=\"upfile/"+map.get("filename2")+"\";\n";
	    	  jscode+="}\n";
	    	  
	    	  jscode+="if(document.getElementById(\"txt3\"))\n";
	    	  jscode+="{\n";
	    	  jscode+="document.getElementById(\"txt3\").src=\"upfile/"+map.get("filename3")+"\";\n";
	    	  jscode+="}\n";
	    	  
	    	  jscode+="if(document.getElementById(\"txt4\"))\n";
	    	  jscode+="{\n";
	    	  jscode+="document.getElementById(\"txt4\").src=\"upfile/"+map.get("filename4")+"\";\n";
	    	  jscode+="}\n";
	    	  
	    	  jscode+="if(document.getElementById(\"txt5\"))\n";
	    	  jscode+="{\n";
	    	  jscode+="document.getElementById(\"txt5\").src=\"upfile/"+map.get("filename5")+"\";\n";
	    	  jscode+="}\n";
	    	  
	    	  }
	    	 }
	    	  
	    	  jscode+="}\n";
	    	
	    	 
	    	 
	    jscode+=" getPvalue();\n";
	    jscode+="</script>\n";
	    	}catch (Exception e) {
				e.printStackTrace();
			}
	      return jscode;
		}
	    
	
	
	public static String generalFileName(String srcFileName) {
		try{
		   int index=srcFileName.lastIndexOf(".");
		   return StrUtil.generalSrid()+srcFileName.substring(index).toLowerCase();
		}catch(Exception e){
			return StrUtil.generalSrid();
		}
	}

	public synchronized static String getID() {
		
		Random random = new Random();
		StringBuffer ret = new StringBuffer(20);
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("MMddHHmmss", java.util.Locale.CHINA);
		ret.append(format.format(date));
		String rand = String.valueOf(Math.abs(random.nextInt()));
		//ret.append(getDateStr());
		ret.append(rand.substring(0,4));
		
		return ret.toString();
	} 
	
	


	
	public static String getImgUpInfo(int height)
	{
		String jscode = "";
		jscode+="<img style=\"cursor: pointer;margin:3px\" onclick=\"uploadimg()\" src=\"js/nopic.jpg\" id=txt height=\""+height+"\"/>";
		jscode+="<input type=hidden name=\"filename\" id=\"filename\" value=\"\" />";
		jscode+="<script type=\"text/javascript\"  src=\"js/popups.js\"></script>";
		return jscode;
	}
	
	
	
	public static String getImgUpInfo2(int height)
	{
		String jscode = "";
		jscode+="<img style=\"cursor: hand\" onclick=\"uploadimg2()\" src=\"js/nopic.jpg\" id=txt2 height=\""+height+"\"/>";
		jscode+="<input type=hidden name=\"filename2\" id=\"filename2\" value=\"\" />";
		jscode+="<script type=\"text/javascript\"  src=\"js/popup.js\"></script>";
		return jscode;
	}
	
	public static String getImgUpInfo3(int height)
	{
		String jscode = "";
		jscode+="<img style=\"cursor: hand\" onclick=\"uploadimg3()\" src=\"js/nopic.jpg\" id=txt3 height=\""+height+"\"/>";
		jscode+="<input type=hidden name=\"filename3\" id=\"filename3\" value=\"\" />";
		jscode+="<script type=\"text/javascript\"  src=\"js/popup.js\"></script>";
		return jscode;
	}
	
	public static String getImgUpInfo4(int height)
	{
		String jscode = "";
		jscode+="<img style=\"cursor: hand\" onclick=\"uploadimg4()\" src=\"js/nopic.jpg\" id=txt4 height=\""+height+"\"/>";
		jscode+="<input type=hidden name=\"filename4\" id=\"filename4\" value=\"\" />";
		jscode+="<script type=\"text/javascript\"  src=\"js/popup.js\"></script>";
		return jscode;
	}
	
	public static String getImgUpInfo5(int height)
	{
		String jscode = "";
		jscode+="<img style=\"cursor: hand\" onclick=\"uploadimg5()\" src=\"js/nopic.jpg\" id=txt5 height=\""+height+"\"/>";
		jscode+="<input type=hidden name=\"filename5\" id=\"filename5\" value=\"\" />";
		jscode+="<script type=\"text/javascript\"  src=\"js/popup.js\"></script>";
		return jscode;
	}
	
	public static String fck(int height,String content)
	{
		String jscode = "<TEXTAREA   name=\"content\" id=\"content\">"+content+"</TEXTAREA>";
		jscode+="<script type=\"text/javascript\"  src=\"fckeditor/fckeditor.js\"></script>";
		jscode+="<script language=\"javascript\">";
		jscode+="function fckinit()";
		jscode+="{";
		jscode+=" var of = new FCKeditor(\"content\");";
		jscode+="of.BasePath=\"fckeditor/\";";
		jscode+="of.Height = \""+height+"\";";
		jscode+="of.ToolbarSet=\"Default\";";
		jscode+="of.ReplaceTextarea();";
		jscode+="}";
		jscode+="fckinit();";
		jscode+="</script>";
		
		return jscode;
	}

	
	public synchronized static String subStr(String source,int length) {
		if(source.length()>length)
		{
			source=source.substring(0,length)+"...";
		}
		
		return source;
	} 
	
	
	public synchronized static String ensubStr(Object source,int length) {
		String msource = Info.filterStrIgnoreCase(source.toString(), "<", ">");
		if(msource.length()>length)
		{
			msource=msource.substring(0,length)+"...";
		} 
		return msource;
	} 
	
	

	public static String getDateStr(){
		String dateString="";
		try{//yyyyMMddHHmmss
		java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date currentTime_1=new java.util.Date();
		dateString=formatter.format(currentTime_1);
		}catch(Exception e){
		     }
		 return dateString;
		 } 
	
	


	
	 public static String getUTFStr(String str) {
		 if(str==null){
			 return "";
		 }
		 
		 try {
			str =  new String(str.getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	 }
	 
	 public static String getGBKStr(String str) throws UnsupportedEncodingException{
		 if(str==null){
			 return "";
		 }
		 return  new String(str.getBytes("ISO-8859-1"),"GBK");
	 }
	 
	 public static String getGB2312Str(String str) throws UnsupportedEncodingException{
		 if(str==null){
			 return "";
		 }
		 return  new String(str.getBytes("ISO-8859-1"),"gb2312");
	 }

	 
	 /**
		 *得到多少天之后之前的日期??
		 * @param String date
		 * @param int day
		 * @return
		 */
		public static String getDay(String date,int day) {
			String b = date.substring(0,10);
			String c = b.substring(0,4);
			String d = b.substring(5,7);
			String f = b.substring(8,10);
			String aa = c+"/"+d+"/"+f;
			String a = "";
			DateFormat dateFormat =  DateFormat.getDateInstance(DateFormat.MEDIUM);
				GregorianCalendar grc=new GregorianCalendar();
				grc.setTime(new Date(aa));
	            grc.add(GregorianCalendar.DAY_OF_MONTH,day);
	            String resu = dateFormat.format(grc.getTime());
	        String t[]= resu.split("-");
	        String sesuu = "";
	        for(int i=0;i<t.length;i++)
	        {
	        	if(t[i].length()==1)
	        	{
	        		t[i]="0"+t[i];
	        	}
	        	sesuu += t[i]+"-";
	        }
	        
			return sesuu.substring(0,10);
		}
		

	    
	    
	    /**
	 	 * 计算两个时期之间的天数
	 	 * 
	 	 */
	    public static int dayToday(String DATE1, String DATE2) {
	       int i = 0;
	       if(DATE1.indexOf(" ")>-1)
	       DATE1 = DATE1.substring(0,DATE1.indexOf(" "));
	       if(DATE2.indexOf(" ")>-1)
	       DATE2 = DATE2.substring(0,DATE2.indexOf(" "));
	       
	       String[] d1 = DATE1.split("-");
	       if(d1[1].length()==1)
	       {
	    	   DATE1 = d1[0]+"-0"+d1[1];
	       }else{
	    	   DATE1 = d1[0]+"-"+d1[1];
	       }
	       
	       if(d1[2].length()==1)
	       {
	    	   DATE1 = DATE1+"-0"+d1[2];
	       }else{
	    	   DATE1 = DATE1+"-"+d1[2];
	       }
	       
	       String[] d2 = DATE2.split("-");
	       if(d2[1].length()==1)
	       {
	    	   DATE2 = d2[0]+"-0"+d2[1];
	       }else{
	    	   DATE2 = d2[0]+"-"+d2[1];
	       }
	       
	       if(d2[2].length()==1)
	       {
	    	   DATE2 = DATE2+"-0"+d2[2];
	       }else{
	    	   DATE2 = DATE2+"-"+d2[2];
	       }
	       
	       
	       for(int j=0;j<10000;j++)
	       {
	    	i=j;
	    	String gday = Info.getDay(DATE1, j);
	    	if(gday.equals(DATE2))
	    	{
	    		break;
	    	}
	       }
	        return i;
	    }
	    
	   
	    

	    /**
	 	 * 比较时间大小
	 	 * 
	 	 */
	    public static String compare_datezq(String DATE1, String DATE2) {
	       DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date dt1 = df.parse(DATE1);
	            Date dt2 = df.parse(DATE2);
	            if (dt1.getTime() > dt2.getTime()) {
	               
	                return "big";
	            } else if (dt1.getTime() < dt2.getTime()) {
	              
	                return "small";
	            } else {
	                return "den";
	            }
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	        return "den";
	    }
	    
	    /**
	 	 * 过滤html代码
	 	 * 
	 	 */
	    public static String filterStrIgnoreCase(String source, String from, String to){
	        String sourceLowcase=source.toLowerCase();
	        String sub1,sub2,subLowcase1,subLowcase2;
	        sub1=sub2=subLowcase1=subLowcase2="";
	        int start=0,end;
	        boolean done=true;
	        if(source==null) return null;
	        if(from==null||from.equals("")||to==null||to.equals("")) 
	         return source;
	        while(done){
	         start=sourceLowcase.indexOf(from,start);
	         if(start==-1) {
	          break;
	         }
	         subLowcase1=sourceLowcase.substring(0,start);
	         sub1=source.substring(0,start);
	         end=sourceLowcase.indexOf(to,start);
	         if(end==-1){
	          end=sourceLowcase.indexOf("/>",start); 
	          if(end==-1) {
	           done=false;
	          }
	         }
	         else{
	          end=end+to.length();
	          subLowcase2=sourceLowcase.substring(end,source.length());
	          sub2=source.substring(end,source.length());
	          sourceLowcase=subLowcase1+subLowcase2;
	          source=sub1+sub2;
	         }
	         //System.out.println(start+" "+end);
	        }
	        return source;
	   }
	    
	   
	    public static void delPic(String path,String img)
		{
			 if(img!=null)
			 {
				 if(!img.equals(""))
				 {
			  File file1=new File(path + "/" + img); 
		       if(file1.exists() ) {
		    	file1.deleteOnExit();
		         file1.delete(); 
		       }}}
		}
	    
	    
	     

		
		
}

		

