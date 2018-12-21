package org.news.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.news.entity.News;
import org.news.entity.Topic;
import org.news.services.impl.topicServicesImpl;
import org.news.servicess.topicServices;

public class topicCao extends HttpServlet {

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
              topicServices topics = new topicServicesImpl();
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String org=request.getParameter("org");
		System.out.println(org);
		if(org!=null){
			if(org.equals("select")){
				
				
				List<Topic> list = topics.selectTopic();
				StringBuffer sb=new StringBuffer();
				int count=0;
				PrintWriter out = response.getWriter();
				System.out.println("11");
				sb.append("[");
				for (Topic news : list) {
					count++;
					sb.append("{");
					sb.append('"'+"name"+'"'+':'+'"'+news.getTname()+'"'+",");
					sb.append('"'+"id"+'"'+':'+news.getTid());
					if(count==list.size()){
						sb.append("}");
					}else{
						sb.append("},");
						
					}
				}
				sb.append("]");
				out.print(sb);
				 
				 
			}else if(org.equals("update")){
				
				int id =topics.updateTopic(request,response);
				
			}else if(org.equals("insert")){
				 int id =topics.insertTopic(request,response);
			}else if(org.equals("delete")){
				int id =topics.deleteTopic(request,response);
				
				
				
			}
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
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
