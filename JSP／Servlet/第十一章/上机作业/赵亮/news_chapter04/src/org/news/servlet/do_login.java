package org.news.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.news.dao.NewsDao;
import org.news.dao.UserDao;
import org.news.dao.impl.NewsDaoImpl;
import org.news.dao.impl.UserDaoImpl;
import org.news.entity.News;
import org.news.entity.User;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeFilter;
import com.alibaba.fastjson.serializer.SerializerFeature;


public class do_login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public do_login() {
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

		//登录
				response.setContentType("text/html;charSet='utf-8'");
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
//					request.getSession().setAttribute("admin",name);
					NewsDao newsDao=new NewsDaoImpl();
					/*List<News> list=newsDao.getAllnews();
					StringBuffer sb=new StringBuffer();
					int count=0;
					System.out.println("11");
					sb.append("[");
					for (News news : list) {
						count++;
						sb.append("{");
						sb.append('"'+"name"+'"'+':'+'"'+news.getNtname()+'"'+",");
						sb.append('"'+"title"+'"'+':'+'"'+news.getNtitle()+'"'+",");
						sb.append('"'+"id"+'"'+':'+news.getNid()+",");
						sb.append('"'+"nauthor"+'"'+':'+'"'+news.getNauthor()+'"');
						if(count==list.size()){
							sb.append("}");
						}else{
							sb.append("},");
							
						}
					sb.append("]");
					}*/
					
					List<News> list=newsDao.getAllnews();
					String sb=JSON.toJSONString(list, SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteNullStringAsEmpty);
					
					PrintWriter out = response.getWriter();
					out.print(sb);
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
		//登录
		response.setContentType("text/html;charSet='utf-8'");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
//			request.getSession().setAttribute("admin",name);
			NewsDao newsDao=new NewsDaoImpl();
			/*List<News> list=newsDao.getAllnews();
			StringBuffer sb=new StringBuffer();
			int count=0;
			System.out.println("11");
			sb.append("[");
			for (News news : list) {
				count++;
				sb.append("{");
				sb.append('"'+"name"+'"'+':'+'"'+news.getNtname()+'"'+",");
				sb.append('"'+"title"+'"'+':'+'"'+news.getNtitle()+'"'+",");
				sb.append('"'+"id"+'"'+':'+news.getNid()+",");
				sb.append('"'+"nauthor"+'"'+':'+'"'+news.getNauthor()+'"');
				if(count==list.size()){
					sb.append("}");
				}else{
					sb.append("},");
					
				}
			sb.append("]");
			}*/
			
			List<News> list=newsDao.getAllnews();
			String sb=JSON.toJSONString(list, SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteNullStringAsEmpty);
			
			PrintWriter out = response.getWriter();
			out.print(sb);
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
