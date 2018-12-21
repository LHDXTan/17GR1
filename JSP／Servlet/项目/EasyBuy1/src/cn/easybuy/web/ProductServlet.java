package cn.easybuy.web;

import cn.easybuy.entity.Product;
import cn.easybuy.service.ProductCategoryService;
import cn.easybuy.service.ProductService;
import cn.easybuy.service.Impl.ProductCategoryServiceImpl;
import cn.easybuy.service.Impl.ProductServiceImpl;
import cn.easybuy.utils.EmptyUtils;
import cn.easybuy.utils.Pager;
import cn.easybuy.utils.ProductCategoryVo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
 
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = -3478976276225280337L;
	private ProductService productService;
	private ProductCategoryService productCategoryService;

	public void init() throws ServletException {
		productService = new ProductServiceImpl();
		productCategoryService = new ProductCategoryServiceImpl();
	}

	/**
	 * 查询商品列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public String queryProductList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		String levelStr = request.getParameter("level");
		String currentPageStr = request.getParameter("currentPage");
		String keyWord = request.getParameter("keyWord");
		// 获取页大小
		String pageSizeStr = request.getParameter("pageSize");
		int rowPerPage = EmptyUtils.isEmpty(pageSizeStr) ? 20 : Integer
				.parseInt(pageSizeStr);
		int currentPage = EmptyUtils.isEmpty(currentPageStr) ? 1 : Integer
				.parseInt(currentPageStr);
		int level = EmptyUtils.isNotEmpty(levelStr) ? Integer
				.parseInt(levelStr) : 0;
		int total = productService
				.count(keyWord,
						EmptyUtils.isEmpty(category) ? null : Integer
								.valueOf(category), level);
		Pager pager = new Pager(total, rowPerPage, currentPage);
		pager.setUrl("/Product?action=queryProductList&level=" + level
				+ "&category=" + (EmptyUtils.isEmpty(category) ? "" : category));
		List<ProductCategoryVo> productCategoryVoList = productCategoryService
				.queryAllProductCategoryList();
		List<Product> productList = productService.getProductList(currentPage,
				rowPerPage, keyWord, EmptyUtils.isEmpty(category) ? null
						: Integer.valueOf(category), level);
		request.setAttribute("productList", productList);
		request.setAttribute("pager", pager);
		request.setAttribute("total", total);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("productCategoryVoList", productCategoryVoList);
		return "/queryProductList";
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public String queryProductDeatil(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		Product product = productService.getProductById(Integer.valueOf(id));
		List<ProductCategoryVo> productCategoryVoList = productCategoryService
				.queryAllProductCategoryList();
		request.setAttribute("product", product);
		request.setAttribute("productCategoryVoList", productCategoryVoList);
		addRecentProduct(request, product);
		return "/productDeatil";
	}

	/**
	 * 查询最近商品
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private List<Product> queryRecentProducts(HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		List<Product> recentProducts = (List<Product>) session
				.getAttribute("recentProducts");
		if (EmptyUtils.isEmpty(recentProducts)) {
			recentProducts = new ArrayList<Product>();
		}
		return recentProducts;
	}

	/**
	 * 添加最近浏览商品
	 * 
	 */
	private void addRecentProduct(HttpServletRequest request, Product product)
			throws Exception {
		HttpSession session = request.getSession();
		List<Product> recentProducts = queryRecentProducts(request);
		// 判断是否满了
		if (recentProducts.size() > 0 && recentProducts.size() == 10) {
			recentProducts.remove(0);
		}
		recentProducts.add(recentProducts.size(), product);
		session.setAttribute("recentProducts", recentProducts);
	}

}
