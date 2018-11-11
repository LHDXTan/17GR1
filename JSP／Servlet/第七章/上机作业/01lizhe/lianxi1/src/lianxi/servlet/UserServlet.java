package lianxi.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserServlet extends HttpServlet {
	public UserServlet() {
		super();
	}

	// 初始化
	public void init() throws ServletException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String uName = request.getParameter("userName");
		String pwd = request.getParameter("pwd");
		if ("admin".equals(uName) && "admin".equals(pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("login", uName);
			response.sendRedirect("MyJsp.jsp");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('用户名或密码错误，请重新输入！');location.href='index.jsp';</script>");
			out.close();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	// 销毁
	public void destroy() {
		super.destroy();
	}
}
