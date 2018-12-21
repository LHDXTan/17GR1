package org.news.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.news.services.impl.indexCaoImp;
import org.news.servicess.indexCao;
import org.news.util.Page;
import org.news.entity.*;;

public class zhuCao extends HttpServlet {

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

		response.setContentType("text/html");
		
		
		request.setCharacterEncoding("utf-8");
		String org=request.getParameter("org");
		String orgn=request.getParameter("orgn");
		indexCao index = new indexCaoImp();
		if(org!=null){
			if(org.equals("selectNews")){
				String cur=request.getParameter("cur");
				int chaid=0;
				if(cur==null){
					chaid=1;
				}else{
					chaid=Integer.parseInt(cur);
				}         
				//标题初始化
				if(orgn!=null){
					if(orgn.equals("selectTopic")){
						List<Topic> list=(List<Topic>)index.selectTopic();
						  if(list!=null){
							  	System.out.println("selectTopicz");
							  	request.getSession().setAttribute("listTopic", list);
//							  	request.getRequestDispatcher("index.jsp").forward(request, response);
						  }
					}
				}
				Page page = new Page();
				
				  List<News> list=(List<News>)index.selectNewsLim(chaid,page);
				  if(list!=null){
					  request.getSession().setAttribute("idex", page.getCurrPageNo());
					  request.getSession().setAttribute("wei", page.getTotalPageCount());
					  	request.getSession().setAttribute("listNews", list);
//					  	request.getRequestDispatcher("index.jsp").forward(request, response);
					  	response.sendRedirect("index.jsp");
				  }
				  
				  
			}
			
		}
		
		
		//点击标题触发
		String id =request.getParameter("id");
		
		if(id!=null){
			int tid =Integer.parseInt(id);
			 List<News> list=(List<News>)index.selectNews(tid);
			/* if(request.getSession().getAttribute("listNews")!=null){
				 request.getSession().removeAttribute("listNews");
			 }*/
			
				 request.getSession().setAttribute("listNews", list);
		//	request.getRequestDispatcher("index.jsp?nid=1").forward(request, response);
				 response.sendRedirect("index.jsp?nid=1");
		}
		
		
		String newsnid =request.getParameter("newsnid");
		if(newsnid!=null){
			int tid =Integer.parseInt(newsnid);
				News news=index.findNews(tid);
				request.getSession().setAttribute("title", news.getNtitle());
				request.getSession().setAttribute("createdate", news.getNcreatedate());
				request.getSession().setAttribute("nauthor", news.getNauthor());
				request.getSession().setAttribute("content", news.getNcontent());
				response.sendRedirect("newspages/news_read.jsp");
		
//				request.getRequestDispatcher("newspages/news_read.jsp").forward(request, response);
		}
		
		
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

		response.setContentType("text/html");
		System.out.println("post");
	}

}
