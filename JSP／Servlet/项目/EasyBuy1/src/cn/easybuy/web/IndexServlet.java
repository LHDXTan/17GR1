package cn.easybuy.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.easybuy.entity.News;
import cn.easybuy.entity.Product;
import cn.easybuy.param.NewsParams;
import cn.easybuy.service.NewsService;
import cn.easybuy.service.ProductCategoryService;
import cn.easybuy.service.ProductService;
import cn.easybuy.service.Impl.NewsServiceImpl;
import cn.easybuy.service.Impl.ProductCategoryServiceImpl;
import cn.easybuy.service.Impl.ProductServiceImpl;
import cn.easybuy.utils.Pager;
import cn.easybuy.utils.ProductCategoryVo;

public class IndexServlet extends HttpServlet {

	private static final long serialVersionUID = -755747195313711142L;
	private ProductService productService;
    private NewsService newsService;
    private ProductCategoryService productCategoryService;

    public void init() throws ServletException {
        productService = new ProductServiceImpl();
        newsService = new NewsServiceImpl();
        productCategoryService = new ProductCategoryServiceImpl();
    }

    /**
     * @throws IOException 
     * 商城主页的方法
     * @throws  
     */
    public void index(HttpServletRequest request, HttpServletResponse response) throws IOException{
        //查询商品分裂
        List<ProductCategoryVo> productCategoryVoList = productCategoryService.queryAllProductCategoryList();
        Pager pager= new Pager(5, 5, 1);
        NewsParams params = new NewsParams();
        params.openPage((pager.getCurrentPage() - 1) * pager.getRowPerPage(),pager.getRowPerPage());
        List<News> news = newsService.queryNewsList(params);
        //查询一楼
        for (ProductCategoryVo vo : productCategoryVoList) {
            List<Product> productList = productService.getProductList(1, 8, null, vo.getProductCategory().getId(), 1);
            vo.setProductList(productList);
        }
        //封装
        request.getSession().setAttribute("productCategoryVoList", productCategoryVoList);
        request.getSession().setAttribute("news", news);
		
    }

}
