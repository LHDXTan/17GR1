package cn.jbit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InitParmServlet extends HttpServlet {
	private static final javax.servlet.jsp.JspFactory _jspxFactory =
	          javax.servlet.jsp.JspFactory.getDefaultFactory();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		String initParam = getInitParameter("initParam");	
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY><div align='center'>");
		out.print(initParam);		
		out.println("  </div></BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	

}
