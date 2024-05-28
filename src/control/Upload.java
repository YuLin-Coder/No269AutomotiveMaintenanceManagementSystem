package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Info;

public class Upload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Upload() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StringBuffer   sb   =   new   StringBuffer(50);   
		 response.setContentType("application/x-msdownload;charset=GB2312");   
        try {
			response.setHeader("Content-Disposition",   new   String(sb.toString()   
			         .getBytes(),   "ISO8859-1"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 String filename = request.getParameter("filename");
		  if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0){
		     try {
				filename = new String(filename.getBytes("gb2312"), "ISO8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		 else 
		      if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0){
		           try {
					filename = URLEncoder.encode(filename, "gb2312");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					 
				}
		      }
		 response.setContentType("text/plain");
		 response.setHeader("Location",filename);
		 response.reset();
		 response.setHeader("Cache-Control", "max-age=0" );
		 response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		   

		    try {
				       BufferedInputStream bis = null;
					   BufferedOutputStream bos = null;
					   OutputStream fos = null;
					  // File f = new File(request.getRealPath("/upfile/")+"/"+filename);
					   //System.out.println(f);
					   bis = new BufferedInputStream((InputStream)new FileInputStream(request.getRealPath("/upfile/")+"/"+filename));
					    fos = response.getOutputStream();
					    bos = new BufferedOutputStream(fos);

					    int bytesRead = 0;
					    byte[] buffer = new byte[5 * 1024];
					    while ((bytesRead = bis.read(buffer)) != -1) {
					     bos.write(buffer, 0, bytesRead);
					    }
					    bos.close();
					    bis.close();
					    fos.close();
				
		               new Info().delPic(request.getRealPath("/upfile/")+"/", filename);
		     } catch (Exception e) {
				 
			}finally{
			}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
