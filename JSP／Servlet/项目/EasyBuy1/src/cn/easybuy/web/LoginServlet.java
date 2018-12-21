package cn.easybuy.web;

import java.io.IOException;
import java.io.PrintWriter;

import cn.easybuy.entity.User;
import cn.easybuy.service.UserService;
import cn.easybuy.service.Impl.UserServiceImpl;
import cn.easybuy.utils.EmptyUtils;
import cn.easybuy.utils.ReturnResult;
import cn.easybuy.utils.SecurityUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = -3987324199550351278L;
	// 注入用户业务类
	private UserService userService;

	public void init() throws ServletException {
		userService = new UserServiceImpl();
	}

	/**
	 * 跳转到登陆界面
	 * 登陆
	 * 注销
	 * @throws IOException 
	 * 
	 */
	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		ReturnResult result = new ReturnResult();
		PrintWriter out = response.getWriter();
		// 参数获取
		String act = request.getParameter("action");
		if("toLogin".equals(act)){
			response.sendRedirect("login.jsp");
		}
		if("loginOut".equals(act)){
			try {
				request.getSession().removeAttribute("loginUser");
				// 清除购物车
				request.getSession().removeAttribute("cart");
				request.getSession().removeAttribute("cart2");
			} catch (Exception e) {
				e.printStackTrace();
			}
			result.returnSuccess("注销成功");
			response.sendRedirect("login.jsp");
		}
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		User user = userService.getUser(null, loginName);
		if (EmptyUtils.isEmpty(user)) {
			out.print(result.returnFail("用户不存在"));
		} else {
			if (user.getPassword().equals(SecurityUtils.md5Hex(password))) {
				// 登陆成功
				request.getSession().setAttribute("loginUser", user);
				out.print(result.returnSuccess("登陆成功"));
			} else {
				out.print(result.returnFail("密码错误"));
			}
		}
		
	}
}
