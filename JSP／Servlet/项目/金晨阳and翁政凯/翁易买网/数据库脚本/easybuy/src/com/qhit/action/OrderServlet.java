package com.qhit.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.qhit.dao.imp.NewsDaoimp;
import com.qhit.dao.imp.Product_CategoryDaoImp;
import com.qhit.dao.imp.UserDaoImp;
import com.qhit.entity.News;
import com.qhit.entity.Product;
import com.qhit.entity.Product_Category;
import com.qhit.entity.User;
import com.qhit.server.imp.ProductServerImp;
import com.qhit.util.ProductCategoryVo;

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String parameter = request.getParameter("action");
		System.out.println(parameter);
		if(parameter.equals("newlist")){//新闻资讯--资讯列表
			NewsDaoimp nss = new NewsDaoimp();
			List<News> selectNews_dao = nss.selectNews_dao();
			String jsonString = JSON.toJSONString(selectNews_dao);
			System.out.println(jsonString);
			out.print(jsonString);
			
		}else if(parameter.equals("sahngpinlist")){//商品管理列表
			Product_CategoryDaoImp pi = new Product_CategoryDaoImp();
			List<Product> selectallProductDao = pi.selectallProductDao();
			String jsonString = JSON.toJSONString(selectallProductDao);
			out.print(jsonString);
			
		}else if(parameter.equals("userlist")){//查询用户列表
			UserDaoImp ud = new UserDaoImp();
			List<User> selectallUser_Dao = ud.selectallUser_Dao();
			String jsonString = JSON.toJSONString(selectallUser_Dao);
			System.out.println(jsonString);
			out.print(jsonString);
			
		}else if(parameter.equals("user")){//查询用户。
			String st = request.getParameter("id");
			int id = Integer.parseInt(st);
			UserDaoImp ud = new UserDaoImp();
			User selectUserGetid_Dao = ud.selectUserGetid_Dao(id);
			String jsonString = JSON.toJSONString(selectUserGetid_Dao);
			System.out.println(jsonString);
			out.print(jsonString);
			
		}else if(parameter.equals("all")){//查询添加商品的三级
			Product_CategoryDaoImp pi = new Product_CategoryDaoImp();
			List<Product_Category> selectVo_Dao = pi.selectVo_Dao();
			List<Product_Category> selectProduct_Category_Dao = pi.selectProduct_Category_Dao(2);
			List<Product_Category> selectProduct_Category_Dao2 = pi.selectProduct_Category_Dao(3);
			request.getSession().setAttribute("productCategoryList1", selectVo_Dao);
			request.getSession().setAttribute("productCategoryList2", selectProduct_Category_Dao);
			request.getSession().setAttribute("productCategoryList3", selectProduct_Category_Dao2);
			response.sendRedirect("Member_Money.jsp");
			
		}else if(parameter.equals("fenlei")){
			Product_CategoryDaoImp pi = new Product_CategoryDaoImp();
			List<Product_Category> selectProduct_Category_Dao = pi.selectProduct_Category_Dao();
			request.getSession().setAttribute("productCategoryList", selectProduct_Category_Dao);
			response.sendRedirect("Member_Money_Pay.jsp");
		
		}else if(parameter.equals("detelefenlei")){
			System.out.println("dkjsahdjkahsdjkahjk");
			String parameter2 = request.getParameter("id");
			int id = Integer.parseInt(parameter2);
			Product_CategoryDaoImp pi = new Product_CategoryDaoImp();
			int deteleProduct_Category_Dao = pi.deteleProduct_Category_Dao(id);
			if(deteleProduct_Category_Dao>0){
				System.out.println("删除成功！");
				response.sendRedirect("Member_Money_Pay.jsp");
			}
			
		}else if(parameter.equals("deteleshangpin")){
			String parameter2 = request.getParameter("id");
			int id = Integer.parseInt(parameter2);
			Product_CategoryDaoImp pi = new Product_CategoryDaoImp();
			int deteleProduct_Dao = pi.deteleProduct_Dao(id);
			if(deteleProduct_Dao>0){
				System.out.println("删除成功！");
				response.sendRedirect("Member_Order.jsp");
			}
			
		}
		
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String parameter = request.getParameter("action");
		System.out.println(parameter);
		
		if(parameter.equals("addProduct")){//商品的添加
			String parameter2 = request.getParameter("categoryLevel1Id");
			String parameter3 = request.getParameter("categoryLevel2Id");
			String categorylevel3 = request.getParameter("categoryLevel3Id");
			String name = request.getParameter("name");
			String photo = request.getParameter("photo");
			String parseInt = request.getParameter("price");
			String parseInt1 = request.getParameter("stock");
			String description = request.getParameter("description");
			int categorylevel1 = Integer.parseInt(parameter2);
			int categorylevel2 = Integer.parseInt(parameter3);
			int price = Integer.parseInt(parseInt);
			int stock = Integer.parseInt(parseInt1);
			
			Product product = new Product();
			product.setCategorylevel1(categorylevel1);
			product.setCategorylevel2(categorylevel2);
			product.setCategorylevel3(categorylevel3);
			product.setName(name);
			product.setFileName(photo);
			product.setPrice(price);
			product.setStock(stock);
			product.setDesciption(description);
			Product_CategoryDaoImp pi = new Product_CategoryDaoImp();
			int insertProduct_Dao = pi.insertProduct_Dao(product);
			if(insertProduct_Dao>0){
				System.out.println("添加成功。");
				response.sendRedirect("Member_Order.jsp");
			}else{
				//response.sendRedirect("Member_Money.jsp");
				request.getRequestDispatcher("Member_Money.jsp").forward(request, response);
			}
		}
		out.flush();
		out.close();
	}

}
