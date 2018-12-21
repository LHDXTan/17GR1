package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;

import Dao.UserDao;
import Daoimp.UserDaoImp;

public class RegistServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegistServlet() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");  
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		String parameter = request.getParameter("yonghuming");
		String mima = request.getParameter("mima");
		String youxiang = request.getParameter("youxiang");
		String shoujihao = request.getParameter("shoujihao");
		String parayouqingren = request.getParameter("yaoqingren");
		String yaoqingrenId = request.getParameter("yaoqingrenId");
		HttpSession session = request.getSession();
		UserDao daoImp = new UserDaoImp();
		User user=null;
		 user = daoImp.SelectName(parameter);
		if (user != null) {
			response.sendRedirect("Regist.jsp");
		} else {
			user =new User();
			user.setLoginName(parameter);
			user.setPassword(mima);
			user.setEmail(youxiang);
			user.setMobile(shoujihao);
			int selectUser = daoImp.SelectUser(user);
			//response.sendRedirect("index.jsp");
request.getRequestDispatcher("login.jsp").forward(request,response);
		

		}

	}

	private void out(String string) {
		// TODO Auto-generated method stub

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
