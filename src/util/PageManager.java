

package util;

import dao.CommDAO;

import javax.servlet.http.HttpServletRequest;
import java.util.*;



public class PageManager {
	private PageManager() {

	}


	// 默认一页最大记录数
	public static final int DEFAULTPAGESIZE = 20;

	// 分页段
	public static final int segment = 10;

	// 当前页数
	protected int currentPage;

	// 一页长度
	protected int pageSize;

	// 总页数
	protected long pageNumber;

	// 总记录数
	protected long count;

	// 数据
	protected Collection collection;

	// 数据查询对象
	protected CommDAO dao = new CommDAO();

	// 表现层代码
	protected String info;

	// 请求路径
	protected String path;

	// 服务器请求对象
	protected HttpServletRequest request;

	/*
	 * 仅仅只是加到路径中去
	 */
	protected String parameter = "";

	/**
	 * 
	 * @param 下一页的分页链接
	 * @param 一页最大记录数
	 * @param 当前HttpServletRequest对象
	 * @param 数据库操作对象
	 */
	protected PageManager(String path, int pageSize, HttpServletRequest request) {
		// 任意一个dao都行
		this.currentPage = 1;
		this.pageNumber = 1;
		this.count = 0;
		this.pageSize = pageSize <= 0 ? DEFAULTPAGESIZE : pageSize;
		this.request = request;
		this.path = path;

		request.setAttribute("page", this);

		try {
			this.currentPage = Integer.parseInt(request
					.getParameter("currentPage")) <= 0 ? 1 : Integer
					.parseInt(request.getParameter("currentPage"));

		} catch (Exception e) {

			try {
				this.currentPage = Integer.parseInt((String) request
						.getSession().getAttribute("currentPage"));

			} catch (Exception e1) {
				this.currentPage = 1;

			}

		}

	}
	
	
	
	

	
	

	/**
	 * 
	 * @param 下一页的分页链接
	 * @param 一页最大记录数
	 * @param 当前HttpServletRequest对象
	 * @param 数据库操作对象
	 */
	public static PageManager getPage(String path, int pageSize,
			HttpServletRequest request) {
		return new PageManager(path, pageSize, request);

	}

	/**
	 * 
	 * 
	 * @param hql语句
	 * 
	 */
	public void doList(String hql) {
        
		this.count = this.dao.select(hql).size();
		if (this.count != 0) {
			this.pageNumber = count % this.pageSize == 0 ? this.count
					/ this.pageSize : this.count / this.pageSize + 1;
			if (this.currentPage > this.pageNumber)
				this.currentPage = (int) this.pageNumber;

		}
		this.request.getSession().setAttribute("currentPage",
				String.valueOf(this.currentPage));
		this.collection = this.dao.select(hql,
				this.currentPage , this.pageSize);

		this.refreshUrl();
	}

	/**
	 * 
	 * @param 查询条件集合
	 *            如没有条件只是列表就不使用这个方法
	 */
	public void addParameter(List parameter) {

		StringBuffer para = new StringBuffer("");
		if (parameter != null && parameter.size() != 0) {
			Iterator iterator = parameter.iterator();
			while (iterator.hasNext()) {
				para.append("&").append(iterator.next().toString());
			}
		}
		this.parameter = para.toString();

	}

	/**
	 * 刷新分页路径
	 * 
	 */
	protected void refreshUrl() {
		StringBuffer buf = new StringBuffer();
		buf.append("<font color='#1157B7'>共").append(count);
		buf.append("条");
		buf.append("&nbsp;&nbsp;");
		buf.append("第").append(this.currentPage).append("/").append(
				this.pageNumber).append("页");
		buf.append("&nbsp;&nbsp;&nbsp;&nbsp;");
		if (this.currentPage == 1)
			buf.append("首页");
		else
			buf.append("<a href='").append(this.path).append("&currentPage=1")
					.append(parameter)
					.append("' class='ls'>").append("首页")
					.append("</a>");
		// ////////////////////////#1157B7
		buf.append("&nbsp;&nbsp;&nbsp;&nbsp;");

		if (this.currentPage > 1) {
			buf.append("<a href='").append(this.path).append("&currentPage=")
					.append(currentPage - 1).append(parameter).append(
							"' class='ls'>").append("上页")
					.append("</a>");
		} else {
			buf.append("上页");

		}
		buf.append("&nbsp;&nbsp;");

		int currentSegment = this.currentPage % segment == 0 ? this.currentPage
				/ segment : this.currentPage / segment + 1;

		/*for (int i = 1; i <= this.pageNumber; i++) {
			if (this.currentPage == i)
				buf.append("<font color='red'>").append(i).append("</font>");

			else
				buf.append("<a href='").append(this.path).append(
						"&currentPage=").append(i).append(parameter).append(
						"' class='ls'>[").append(i).append(
						"]</a>");
		}*/

		buf.append("&nbsp;&nbsp;");
		if (this.currentPage < this.pageNumber) {
			buf.append("<a href='").append(this.path).append("&currentPage=")
					.append(currentPage + 1).append(parameter).append(
							"' class='ls'>").append("下页")
					.append("</a>");
		} else {

			buf.append("下页");

		}

		buf.append("&nbsp;&nbsp;&nbsp;&nbsp;");
		if (this.currentPage == this.pageNumber)
			buf.append("末页&nbsp;&nbsp;");
		else
			buf.append("<a href='").append(this.path).append("&currentPage=")
					.append(this.pageNumber).append(parameter).append(
							"' class='ls'>").append("末页")
					.append("</a></font>&nbsp;&nbsp;");
		// ////////////////////
		// for (int i = 0; i < this.pageNumber; i++) {
		// if (this.currentPage == i + 1) {
		// buf.append("<font color=red>[" + (i + 1) + "]</font>").append(
		// "&nbsp;");
		// } else {
		// buf.append("<a href='").append(this.path).append(
		// "&currentPage=").append(i + 1).append(parameter)
		// .append("' style='TEXT-DECORATION:none'>").append(
		// "[" + (i + 1) + "]").append("</a>&nbsp;");
		// }

		// }
		buf.append("<select onchange=\"javascript:window.location='").append(
				this.path).append("&currentPage='+").append(
				"this.options[this.selectedIndex].value").append(parameter)
				.append("\">");
		for (int i = 0; i < this.pageNumber; i++) {
			if (this.currentPage == i + 1)
				buf.append("<option value=" + (i + 1)
						+ " selected=\"selected\">" + (i + 1) + "</option>");
			else
				buf.append("<option value=" + (i + 1) + ">" + (i + 1)
						+ "</option>");

		}
		buf.append("</select>");
		this.info = buf.toString();
		
	}

	public Collection getCollection() {
		return collection;
	}

	public long getCount() {
		return count;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public long getPageNumber() {
		return pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public String getInfo() {
		return info;
	}
	
	public static ArrayList<HashMap> getPages(String url,int pagesize,String sql,HttpServletRequest request )
	{
	     
		PageManager pageManager = PageManager.getPage(url, pagesize, request);
		  pageManager.doList(sql);
		  PageManager bean = (PageManager) request.getAttribute("page");
		 
		  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
		  return nlist;
	}

 
}
