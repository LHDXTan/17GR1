package com.qhit.action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.qhit.entity.User;
import com.qhit.server.imp.UserServerImp;

public class UserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserServerImp us = new UserServerImp();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("进入Serlvet");
		String parameter = request.getParameter("action");
		System.out.println(parameter);
		if(parameter.equals("deteleuser")){//注销
			request.getSession().removeAttribute("user");
			response.sendRedirect("Login.jsp");
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("进入Serlvet");
		String parameter = request.getParameter("action");
		System.out.println(parameter);
		if(parameter.equals("inseruser")){ //注册-->查询用户判断用户是否存在-->insert into
			String loginName = request.getParameter("loginName");//登陆用户名
			String pwd = request.getParameter("pwd");//密码
			String username = request.getParameter("username");//真实姓名
			String sk = request.getParameter("sex");//性别  1是男，0是女 String———>int
			int sex = Integer.parseInt(sk);
			String email = request.getParameter("email");//邮箱
			String mobile = request.getParameter("mobile");//手机号
			User selectUser_Server = us.selectUser_Server(loginName, pwd);//查询用户的方法。
			if(selectUser_Server == null){//用户不存在
				User user = new User();
				user.setLoginName(loginName);//登陆用户名
				user.setPassword(pwd);//密码
				user.setUserName(username);//真实姓名
				user.setSex(sex);//性别 
				user.setEmali(email);//邮箱
				user.setMobile(mobile);//手机号
				int inserUser_Server = us.inserUser_Server(user);//添加用户的方法.
				if(inserUser_Server >= 1){
					System.out.println("注册成功！");
					response.sendRedirect("Login.jsp");
				}else{
					System.out.println("注册失败！");
					response.sendRedirect("Regist.jsp");
				}
			}else{//用户存在。
				System.out.println("用户已存在，注册失败！");
				response.sendRedirect("Regist.jsp");
			}
		}if(parameter.equals("userlogin")){//登录
			String name = request.getParameter("login");//登陆用户名
			String password = request.getParameter("pwd");//密码
			System.out.println(name);
			System.out.println(password);
			User selectUser_Server = us.selectUser_Server(name, password);
			if(selectUser_Server!=null){//用户存在
				System.out.println("登陆成功！");
				request.getSession().setAttribute("user", selectUser_Server);
				System.out.println(selectUser_Server.getLoginName());
				response.sendRedirect("Index.jsp");
			}else{//用户不存在
				System.out.println("登陆失败！");
				response.sendRedirect("Login.jsp");
			}
		}
	}
}
