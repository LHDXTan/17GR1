package com.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void destroy() {
		super.destroy();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("pwd", request.getParameter("pwd"));
		String[] str=request.getParameterValues("cb");
		List<String> cb = new ArrayList<String>();
		for(int i=0;i<str.length;i++){
			cb.add(str[i]);
			request.setAttribute("cb",cb);
		}		
		request.getRequestDispatcher("MyJsp.jsp").forward(request, response);
		response.setContentType("text/html;charset=UTF-8");		
	}

}
