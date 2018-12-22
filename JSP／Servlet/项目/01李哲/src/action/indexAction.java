package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.news.util.ProductCategoryVo;

import Dao.NewsDao;
import Dao.ProductCategoryDao;
import Dao.ProductDao;
import Dao.UserDao;
import DaoImp.NewsDaoImp;
import DaoImp.ProductCategoryDaoImp;
import DaoImp.ProductDaoImp;
import DaoImp.UserDaoImp;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import entity.News;
import entity.Product;
import entity.User;

public class indexAction extends HttpServlet {

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
	UserDao userd = new UserDaoImp();
	NewsDao newd = new NewsDaoImp();
	ProductCategoryDao prod = new  ProductCategoryDaoImp();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置编码格式
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charSet=UTF-8");
		String org = request.getParameter("org");
		System.out.println(org);
		PrintWriter out = response.getWriter();

		if(org!=null){

			if(org.equals("zhuxiao")){
				request.removeAttribute("userName");
				response.sendRedirect("login.jsp");
			}else if(org.equals("sanji")){
			
		
			
				//
				List<ProductCategoryVo> provo = prod.getProvo();
				/*for (ProductCategoryVo vo : provo) {
					System.out.print(vo.getProductCategory().getName()+"************");
					List<ProductCategoryVo> vo2 = vo.getProductCategoryVoList();
					for (ProductCategoryVo vo3 : vo2) {
						System.out.print(vo3.getProductCategory().getName()+"***********");
						List<ProductCategoryVo> vo4 = vo3.getProductCategoryVoList();
						for (ProductCategoryVo vo5 : vo4) {
							System.out.print(vo5.getProductCategory().getName());

						}
					}
					System.out.println();
				}*/
				String pro = JSON.toJSONString(provo,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteNullNumberAsZero);
				out.print(pro);
			}else if(org.equals("news")){
				List<News> newsAll = newd.getNewsAll();
				/*for (News news : newsAll) {
					System.out.println(news.getTitle());
				}*/
				String pro = JSON.toJSONString(newsAll,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteNullNumberAsZero);
				out.print(pro);
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
	@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//设置编码格式
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charSet=UTF-8");
		System.out.println("post");
		String org = request.getParameter("org");
		PrintWriter out = response.getWriter();
		System.out.println(org);
		if(org!=null){

			if(org.equals("denglu")){
				String pass = (String)request.getParameter("pass");
				String loginName = (String)request.getParameter("loginName");
				User user = userd.denglu(loginName,pass);
				if(user!=null){
					System.out.println(user.getType());
					//request.getSession().setMaxInactiveInterval(5);
					//request.getSession().setAttribute("uid",user.getId());
					request.getSession().setAttribute("user", user);
					response.sendRedirect("index.jsp");
				}else{

					response.sendRedirect("login.jsp?count=0");
				}
			}else if(org.equals("regist")){
				String password = (String)request.getParameter("password");
				String sex = (String)request.getParameter("sex");
				String loginName = (String)request.getParameter("loginName");
				String email = (String)request.getParameter("email");
				String mobile = (String)request.getParameter("mobile");
				String userName = (String)request.getParameter("userName");
				String identityCode = (String)request.getParameter("identityCode");
				User user=new  User();
				/*Date format=null;
			try {
				format = new SimpleDateFormat("yyyy-MM-dd").parse(identityCode);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
				user.setEmail(email);		
				user.setIdentityCode(identityCode);
				user.setType(1);
				user.setUserName(userName);
				user.setPassword(password);
				user.setLoginName(loginName);
				user.setMobile(mobile);
				user.setSex(sex);

				User users=userd.selectName(user.getLoginName());
				if(users==null){
					int count=userd.regist(user);
					System.out.println(count);
					if(count>0){
						response.sendRedirect("login.jsp");
					}else{
						response.sendRedirect("regist.jsp?count=1");

					}

				}else{

					response.sendRedirect("regist.jsp?count=0");
				}
			}
		}
		out.flush();
		out.close();
	}

}
