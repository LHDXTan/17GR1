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

import org.news.util.DianDan;
import org.news.util.GouWuche;
import org.news.util.MyUTF;
import org.news.util.NameSan;
import org.news.util.Page;
import org.news.util.PageD;
import org.news.util.PageU;
import org.news.util.ProductVO;

import Dao.DetailDao;
import Dao.NewsDao;
import Dao.OrderDao;
import Dao.ProductCategoryDao;
import Dao.ProductDao;
import Dao.UserDao;
import DaoImp.DetailDaoImp;
import DaoImp.NewsDaoImp;
import DaoImp.OrderDaoImp;
import DaoImp.ProductCategoryDaoImp;
import DaoImp.ProductDaoImp;
import DaoImp.UserDaoImp;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import entity.Detail;
import entity.News;
import entity.Order;
import entity.Product;
import entity.ProductCategory;
import entity.User;
import entity.proDeta;

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
	UserDao userd = new UserDaoImp();
	NewsDao newd = new NewsDaoImp();
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
				Order ods=null;
				while(t){
					d=random.nextInt(10000000);
					if(1000000<d){
						ods=orderd.selectId(d+"");
						if(ods==null){

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
				//商品查询
			}else if(org.equals("productlist")){
				String indexs=request.getParameter("index");
				int index=0;
				if(indexs==null){
					index=0;
				}else {
					indexs=MyUTF.getNewString(indexs);
					index=Integer.parseInt(indexs);
				}
				Page page = new Page();
				page.setZongtcount(prods.selectProductCount());
				System.out.println("总条数"+page.getZongtcount());
				int zongye=0;
				page.setSize(5);

				page.setIndex(index);



				if(page.getZongtcount()%page.getSize()==0){
					zongye=page.getZongtcount()/page.getSize();
				}else {
					zongye=(page.getZongtcount()/page.getSize())+1;

				}
				page.setZongye(zongye);
				System.out.println(page.getZongye());

				page.setList(prods.selectProductList(page.getIndex(),page.getSize()));
				request.getSession().setAttribute("pageProduct",page);
				System.out.println("s");
				response.sendRedirect("product1.jsp");
				//删除商品
			}else if(org.equals("deleteProduct")){
				String ids = request.getParameter("id");
				int count =0;
				if(ids!=null){
					ids = MyUTF.getNewString(ids);
					count=Integer.parseInt(ids);

				}
				int delectProduct = prods.delectProduct(count);
				System.out.println(delectProduct);
				response.sendRedirect("ProductAction?org=productlist");
				//查询我的订单
			}else if(org.equals("selectMyDian")){
				List<DianDan> listDianDan=new ArrayList<DianDan>();

				User user = (User)request.getSession().getAttribute("user");
				List<Order> listOrder=orderd.selectList(user.getId());
				for (Order order : listOrder) {
					DianDan dianDan = new DianDan();
					dianDan.setOrder(order);

					List<proDeta> listProduct=new ArrayList<proDeta>();

					List<Detail> details=detailD.selectDetail(order.getId());
					for (Detail detail2 : details) {
						Product pro=prods.selectProductID(detail2.getProductId());
						proDeta proDeta = new proDeta();
						proDeta.setCount(detail2.getQuantity());
						proDeta.setFilename(pro.getFileName());
						proDeta.setPrice(detail2.getCost());
						proDeta.setName(pro.getName());
						listProduct.add(proDeta);
					}
					dianDan.setList(listProduct);
					listDianDan.add(dianDan);

				}
				for (DianDan s : listDianDan) {
					System.out.println(s.getOrder().getLoginName());
				}
				PageD page = new PageD();
				String indexs=request.getParameter("index");
				int index=0;
				if(indexs==null){
					index=0;
				}else {
					indexs=MyUTF.getNewString(indexs);
					index=Integer.parseInt(indexs);
				}
				page.setIndex(index);
				page.setSize(3);
				page.setZongtcount(listDianDan.size());
				int zongye=0;
				if(page.getZongtcount()%page.getSize()==0){
					zongye=page.getZongtcount()/page.getSize();
				}else {
					zongye=(page.getZongtcount()/page.getSize())+1;

				}
				page.setZongye(zongye);
				List<DianDan> list = new ArrayList<DianDan>();
				
				for (int i=0;i<page.getSize();i++) {
					if((page.getSize()*page.getIndex()+i)<page.getZongtcount()){
						
						list.add(listDianDan.get((page.getSize()*page.getIndex())+i));
					}else {
						break;
					}
				}
				page.setList(list);
				request.getSession().removeAttribute("PageOrderList");
				request.getSession().setAttribute("listOrder", page);
				response.sendRedirect("order.jsp");
				//查询所有订单信息
			}else if(org.equals("selectDetailAll")){
				//存储所有订单信息
				List<DianDan> listDianDan=new ArrayList<DianDan>();
				//查询所有订单
				List<Order> listOrder=orderd.selectList();
				//遍历所有订单
				for (Order order : listOrder) {
					//dianDan对象一个就是一个订单
					DianDan dianDan = new DianDan();
					dianDan.setOrder(order);
					//查询所有的订单Detail表
					List<Detail> listDetail = detailD.selectDetail(order.getId());
					//创建方商品 信息加上detail的信息
					ArrayList<proDeta> list = new ArrayList<proDeta>();
					//便利所有的detail
					for (Detail detail : listDetail) {
						//创建对象
						proDeta proDeta = new proDeta();
						proDeta.setCount(detail.getQuantity());
						proDeta.setPrice(detail.getCost());
						//查询对应商品id的商品
						Product pr = prods.selectProductID(detail.getProductId());
						proDeta.setFilename(pr.getFileName());
						proDeta.setName(pr.getName());
						list.add(proDeta);
					}
					dianDan.setList(list);
					listDianDan.add(dianDan);
				}
				
				
				PageD page = new PageD();
				String indexs=request.getParameter("index");
				int index=0;
				if(indexs==null){
					index=0;
				}else {
					indexs=MyUTF.getNewString(indexs);
					index=Integer.parseInt(indexs);
				}
				page.setIndex(index);
				page.setSize(3);
				page.setZongtcount(listDianDan.size());
				int zongye=0;
				if(page.getZongtcount()%page.getSize()==0){
					zongye=page.getZongtcount()/page.getSize();
				}else {
					zongye=(page.getZongtcount()/page.getSize())+1;

				}
				page.setZongye(zongye);
				List<DianDan> list = new ArrayList<DianDan>();
				
				for (int i=0;i<page.getSize();i++) {
					if((page.getSize()*page.getIndex()+i)<page.getZongtcount()){
						
						list.add(listDianDan.get((page.getSize()*page.getIndex())+i));
					}else {
						break;
					}
				}
				page.setList(list);
				request.getSession().setAttribute("listOrder", page);
				
				
				request.getSession().setAttribute("PageOrderList", 1);
				response.sendRedirect("order.jsp");
				
				//查询所有用户
			}else if(org.equals("selectUserList")){
				
				List<User> lists=userd.selectUserAll();
				request.getSession().setAttribute("listUser", lists);
				
				
				response.sendRedirect("userlist.jsp");
				//删除用户
			}else if(org.equals("deleteUser")){
				String idd = request.getParameter("id");
				int id=0;
				if(idd!=null){
					 idd = MyUTF.getNewString(idd);
					 id=Integer.parseInt(idd);
				}
				System.out.println("用户id： "+id);
				int count =userd.deleteUser(id);
				if(count>0){
					request.getSession().setAttribute("count", count);
					response.sendRedirect("ProductAction?org=selectUserList");
				}
				//查询新闻
			}else if(org.equals("selectNewList")){
				PageU<News> page = new PageU<News>();
				String indexs=request.getParameter("index");
				int index=0;
				if(indexs==null){
					index=0;
				}else {
					indexs=MyUTF.getNewString(indexs);
					index=Integer.parseInt(indexs);
					
				}
				page.setIndex(index);
				page.setSize(10);
				//查询总条数
				//新闻总条数
				page.setZongtcount(newd.selectNewCount());
				System.out.println("总条数： "+page.getZongtcount());
				int zongye=0;
				if(page.getZongtcount()%page.getSize()==0){
					zongye=page.getZongtcount()/page.getSize();
				}else {
					zongye=(page.getZongtcount()/page.getSize())+1;

				}
				if(page.getIndex()>page.getZongye()){
					page.setIndex(page.getZongye());
				}
				//总页数
				page.setZongye(zongye);
				page.setList(newd.getNewsAllPage(page));
				request.getSession().setAttribute("pageNewList", page);
				response.sendRedirect("news.jsp");
				//分类管理
			}else if(org.equals("selectProductCategory")){
				PageU<ProductCategory> page = new PageU<ProductCategory>();
				String indexs=request.getParameter("index");
				int index=0;
				if(indexs==null){
					index=0;
				}else {
					indexs=MyUTF.getNewString(indexs);
					index=Integer.parseInt(indexs);
					
				}
				page.setIndex(index);
				page.setSize(10);
				//列表总条数
				page.setZongtcount(prod.getProductCategpryCount());
				
				int zongye=0;
				if(page.getZongtcount()%page.getSize()==0){
					zongye=page.getZongtcount()/page.getSize();
				}else {
					zongye=(page.getZongtcount()/page.getSize())+1;

				}
				page.setZongye(zongye);
				if(page.getIndex()>page.getZongye()){
					page.setIndex(page.getZongye());
				}
				/*System.out.println("第"+page.getIndex()+"也");
				System.out.println("列表总条数  "+page.getZongtcount());*/
				page.setList(prod.getProductCategpryLimit(page));
				request.getSession().setAttribute("pageProductCategpryLimit", page);
				response.sendRedirect("productCategory.jsp");
				
				//商品上架
			}else if(org.equals("selectProductShangjia")){
				
				//商品上架中三级查询
			}else if(org.equals("selectFenlei")){
				List<ProductCategory> list = null;
				String idd = request.getParameter("id");
				if(idd==null){
					list=prod.getProductCategory(0);
				}else {
					int id=Integer.parseInt(idd);
					list=prod.getProductCategory(id);
				}
				String json = JSON.toJSONString(list,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteNullNumberAsZero,SerializerFeature.WriteMapNullValue);
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
