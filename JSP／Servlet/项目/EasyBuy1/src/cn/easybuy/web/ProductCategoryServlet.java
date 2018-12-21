package cn.easybuy.web;

import cn.easybuy.service.Impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class ProductCategoryServlet extends HttpServlet {

	private static final long serialVersionUID = 7797746409057052425L;

	public void init() throws ServletException {
		new ProductServiceImpl();
	}

}
