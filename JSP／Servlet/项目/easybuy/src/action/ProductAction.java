package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.news.util.GouWuche;
import org.news.util.MyUTF;
import org.news.util.NameSan;
import org.news.util.ProductVO;

import Dao.DetailDao;
import Dao.OrderDao;
import Dao.ProductCategoryDao;
import Dao.ProductDao;
import DaoImp.DetailDaoImp;
import DaoImp.OrderDaoImp;
import DaoImp.ProductCategoryDaoImp;
import DaoImp.ProductDaoImp;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import entity.Detail;
import entity.Order;
import entity.Product;
import entity.ProductCategory;
import entity.User;

public class ProductAction extends HttpServlet {
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	GouWuche gou = new GouWuche();
	ProductDao prods = new ProductDaoImp();
	ProductCategoryDao prod = new  ProductCategoryDaoImp();
	DetailDao detailD = new DetailDaoImp();
	OrderDao orderd=new OrderDaoImp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charSet=UTF-8");
		PrintWriter out = response.getWriter();
		String org = request.getParameter("org");
		System.out.println(org);
		if(org!=null){
			if(org.equals("product")){
				//承载工具
				List<ProductVO> proVOlist= new ArrayList<ProductVO>(); 
				//查询所有type=3 的ProductCategory
				List<ProductCategory> listPR = prod.getProductCategoryName();
				if(listPR!=null){
					for (ProductCategory productCategory : listPR) {
						ProductVO proVo = new  ProductVO();
						
						//查询name 为 productCategory.getName() 的商品
						List<Product> lisss = prods.getProductAll(productCategory.getName());
						proVo.setProductList(lisss);
						proVo.setPro(productCategory);
						proVOlist.add(proVo);
					}
				}
				String pro = JSON.toJSONString(proVOlist,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteMapNullValue);
				out.print(pro);
				//查找所有三级菜单下的商品
			}else if(org.equals("selectProduct")){
				String idd = request.getParameter("id");
				int id=0;
				if(idd!=null){
					id=Integer.parseInt(idd);
				}
				System.out.println(id);
				List<Product> list = prods.getProductId(id);
				if(list.size()>0){
					System.out.println(list.size());
					String pro = JSON.toJSONString(list,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteMapNullValue);
					out.print(pro);
				}else{
					out.print(1);
				}
			}else if(org.equals("selectProductId")){
				String idd = request.getParameter("id");
				int id=0;
				if(idd!=null){
					id=Integer.parseInt(idd);
				}
				Product pro=prods.selectProductID(id);
				ProductVO proVo = new ProductVO();
				proVo.setProduct(pro);
				NameSan names = new NameSan();
				names.setName1(prods.selectParentId(pro.getCaregoryLevel1()));
				names.setName2(prods.selectParentId(pro.getCaregoryLevel2()));
				names.setName3(prods.selectParentId(pro.getCaregoryLevel3()));
				proVo.setNames(names);
				/*System.out.println(names.getName1());
				System.out.println(names.getName2());
				System.out.println(names.getName3());
				System.out.println(pro.getName());*/
				String pro1 = JSON.toJSONString(proVo,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteMapNullValue);
				out.print(pro1);
			}else if(org.equals("gouwuche")){
				//id作为判断条件 为1时 存入购车数据 为2时 拿到数据
				String	cars = request.getParameter("cars");
				if(cars!=null){
					cars=MyUTF.getNewString(cars);
					gou.setCars(cars);
					System.out.println(cars);
					String cart=request.getParameter("cart");
					cart=MyUTF.getNewString(cart);
					gou.setCart(cart);
					System.out.println(cart);
					out.print(1);
				}else{
					String json = JSON.toJSONString(gou,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteMapNullValue);
					out.print(json);
					
				}
			}else if(org.equals("insertOrder")){
					Order od=new Order();
					String c=request.getParameter("cost");
					double cost=Double.parseDouble(c);
					String userAddress =request.getParameter("userAddress");
					System.out.println(cost);
					userAddress=MyUTF.getNewString(userAddress);
					System.out.println(userAddress);
					
					User user = (User)request.getSession().getAttribute("user");
					
					
					Random random = new Random();
					boolean t=true;
					int d=0;
					while(t){
						d=random.nextInt(10000000);
						if(1000000<d){
							od=orderd.selectId(d+"");
							if(od!=null){
								
								t=false;
							}
							
						}
					}
					od.setSerialNumber(d+"");
					od.setCost(cost);
					od.setCreateTime(new Date());
					od.setLoginName(user.getLoginName());
					od.setStatus(1);
					od.setType(1);
					od.setUserId(user.getId()+"");
					od.setUserAddress(userAddress);
					System.out.println(user.getId());
					System.out.println(user.getUserName());
					int count = orderd.InsertOrder(od);
					
					od=orderd.selectId(od.getSerialNumber());
					
					String json=JSON.toJSONString(od,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteMapNullValue);
					out.print(json);
					
			}else if(org.equals("insertDetail")){
				String orderid = request.getParameter("orderId");
				int orderId =Integer.parseInt(orderid);
				String productid = request.getParameter("productId");
				int productId =Integer.parseInt(productid);
				String quantitys = request.getParameter("quantity");
				int quantity= Integer.parseInt(quantitys);
				String costs = request.getParameter("cost");
				double cost=Double.parseDouble(costs);
				Detail detail = new Detail();
				detail.setCost(cost);
				detail.setOrderId(orderId);
				detail.setProductId(productId);
				detail.setQuantity(quantity);
				System.out.println(detail.getCost());
				
				int count =detailD.insertDetail(detail);
				String json=JSON.toJSONString(detail,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteMapNullValue);
				out.print(json);
			}

		}
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
