package cn.easybuy.web;

import cn.easybuy.service.Impl.UserAddressServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
 
public class UserAdressServlet extends HttpServlet {

	private static final long serialVersionUID = -313182065116371983L;
	public void init() throws ServletException {
        new UserAddressServiceImpl();
    }

}
