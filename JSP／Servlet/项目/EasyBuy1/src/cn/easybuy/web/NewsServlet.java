package cn.easybuy.web;

import cn.easybuy.service.Impl.NewsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewsServlet extends HttpServlet {

	private static final long serialVersionUID = -5843575423116721994L;

	public void init() throws ServletException {
		new NewsServiceImpl();
	}


	public String index(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return "/newsList";
	}

}
