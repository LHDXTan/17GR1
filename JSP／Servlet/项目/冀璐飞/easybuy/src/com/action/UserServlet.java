package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoimp.UserDaoImp;
import com.entity.User;

public class UserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserServlet() {
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

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String pro = request.getParameter("pro");
		if(pro.equals("zuce")){
			String user = request.getParameter("user");
			String reuser = request.getParameter("zsuser");
			String ps = request.getParameter("ps");
			String email= request.getParameter("email");
			String sfzh= request.getParameter("sfzh");
			String shoujihao = request.getParameter("shoujihao");
			String xingbie = request.getParameter("xingbie");
			int leixing=1;
			if(user.equals("admin")){
				leixing=2;
			}
			if(xingbie.equals("男")){
				xingbie="1";
			}else if(xingbie.equals("女")){
				xingbie="0";
			}
			UserDaoImp u=new UserDaoImp();
			int num = u.add_User(user, reuser, ps, xingbie, sfzh, email, shoujihao, leixing);
			if(num==1){
				response.sendRedirect("../Login.jsp");
			}else{
				response.sendRedirect("../Regist.jsp");
			}
		}else if(pro.equals("zx")){
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("../Login.jsp");
		}else if(pro.equals("cunzaima")){
			UserDaoImp u=new UserDaoImp();
			String name = request.getParameter("name");
			User user = u.login(name);
			if(user==null&&name!=""){
				out.print("用户名可以使用");
			}else{
				out.print("用户名已存在");
			}
		}
		out.flush();
		out.close();
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String pro = request.getParameter("pro");
		if(pro.equals("denglu")){
			String yhm = request.getParameter("yhm");
			String mm = request.getParameter("mm");
			UserDaoImp u=new UserDaoImp();
			User user = u.login(yhm);
			if(user!=null){
				if(user.getPassword().equals(mm)){
					HttpSession session = request.getSession();
					session.setAttribute("name", user.getLoginName());
					response.sendRedirect("../Index.jsp");
				}else{
					response.sendRedirect("../Login.jsp");
				}
			}else{
				response.sendRedirect("../Login.jsp");
			}
			
		}
		out.flush();
		out.close();
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
