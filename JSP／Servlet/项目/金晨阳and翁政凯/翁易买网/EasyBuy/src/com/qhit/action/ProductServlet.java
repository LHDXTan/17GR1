package com.qhit.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.qhit.dao.imp.Product_CategoryDaoImp;
import com.qhit.entity.News;
import com.qhit.entity.Product;
import com.qhit.server.imp.NewsServerimp;
import com.qhit.server.imp.ProductServerImp;
import com.qhit.util.MemcachedUtils;
import com.qhit.util.ProductCategoryVo;

public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NewsServerimp ns = new NewsServerimp();
	ProductServerImp psi = new ProductServerImp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String parameter = request.getParameter("action");
		System.out.println(parameter);
		
		if(parameter.equals("selectnews")){//查询新闻列表
			List<News> selectNews_ser = ns.selectNews_ser();
			String jsonString = JSON.toJSONString(selectNews_ser);
			System.out.println(jsonString);
			out.print(jsonString);
			
		}else if(parameter.equals("slectvo")){//商品分类列表
			List<ProductCategoryVo> queryAllProductCategoryList = psi.queryAllProductCategoryList();
			String jsonString = JSON.toJSONString(queryAllProductCategoryList);
			System.out.println(jsonString);
			out.print(jsonString);
			
		}else if(parameter.equals("selectshot")){//商品列表
			String parameter2 = request.getParameter("id");
			int id = Integer.parseInt(parameter2);
			List<Product> selectProductSer = psi.selectProductSer(id);
			String jsonString = JSON.toJSONString(selectProductSer);
			System.out.println(jsonString);
			out.print(jsonString);
			for (Product product : selectProductSer) {
				System.out.println(product.getFileName());
				System.out.println(product.getPrice());
				System.out.println(product.getName());
			}
			
		}else if(parameter.equals("sellist")){ //商品详情表
			String parameter2 = request.getParameter("id");
			int id = Integer.parseInt(parameter2);
			System.out.println(id);
			List<Product> selectId_ProductSer = psi.selectId_ProductSer(id);
			String jsonString = JSON.toJSONString(selectId_ProductSer);
			System.out.println(jsonString);
			out.print(jsonString);
			
		}else if(parameter.equals("add")){ //商品详情表
			String parameter2 = request.getParameter("id");
			System.out.println(parameter2);
			int parseInt = Integer.parseInt(parameter2);
			Product addProductSer = psi.addProductSer(parseInt);
			System.out.println("servlet\t"+addProductSer);
			String jsonString = JSON.toJSONString(addProductSer);
			out.print(jsonString);
			
		}
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	}
}
