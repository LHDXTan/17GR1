package cn.easybuy.service.product;

import cn.easybuy.dao.product.ProductCategoryDao;
import cn.easybuy.dao.product.ProductCategoryDaoImpl;
import cn.easybuy.entity.ProductCategory;
import cn.easybuy.param.ProductCategoryParam;
import cn.easybuy.utils.DataSourceUtil;
import cn.easybuy.utils.EmptyUtils;
import cn.easybuy.utils.Params;
import cn.easybuy.utils.ProductCategoryVo;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
/**
 * Created by bdqn on 2016/5/8.
 */
public class ProductCategoryServiceImpl implements ProductCategoryService {
    /**
     * @param id
     * @return
     */
    @Override
    public ProductCategory getById(Integer id) {
        Connection connection = null;
        ProductCategory productCategory = null;
        try {
            connection = DataSourceUtil.openConnection();
            ProductCategoryDao productCategoryDao = new ProductCategoryDaoImpl(connection);
            productCategory =productCategoryDao.queryProductCategoryById(id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataSourceUtil.closeConnection(connection);
        }
        return productCategory;
    }

    @Override
    public List<ProductCategory> queryProductCategoryList(ProductCategoryParam params) {
        Connection connection = null;
        List<ProductCategory> rtn = null;
        try {
            connection = DataSourceUtil.openConnection();
            ProductCategoryDao productCategoryDao = new ProductCategoryDaoImpl(connection);
            rtn = productCategoryDao.queryProductCategorylist(params);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataSourceUtil.closeConnection(connection);
        }
        return rtn;
    }

    @Override
    public int queryProductCategoryCount(ProductCategoryParam params) {
        Connection connection = null;
        int rtn = 0;
        try {
            connection = DataSourceUtil.openConnection();
            ProductCategoryDao productCategoryDao = new ProductCategoryDaoImpl(connection);
            rtn = productCategoryDao.queryProductCategoryCount(params);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataSourceUtil.closeConnection(connection);
        }
        return rtn;
    }

    @Override
    public void modifyProductCategory(ProductCategory productCategory) {
        Connection connection = null;
        try {
            connection = DataSourceUtil.openConnection();
            ProductCategoryDao productCategoryDao = new ProductCategoryDaoImpl(connection);
            productCategoryDao.update(productCategory);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataSourceUtil.closeConnection(connection);
        }
    }
    /**
     * 新增商品分类
     */
    @Override
    public void addProductCategory(ProductCategory productCategory) {
        Connection connection = null;
        try {
            connection = DataSourceUtil.openConnection();
            ProductCategoryDao productCategoryDao = new ProductCategoryDaoImpl(connection);
            productCategoryDao.add(productCategory);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataSourceUtil.closeConnection(connection);
        }
    }
    /**
     * 根据Id删除商品
     * @param id
     */
    @Override
    public void deleteById(Integer id) {
        Connection connection = null;
        try {
            connection = DataSourceUtil.openConnection();
            ProductCategoryDao productCategoryDao = new ProductCategoryDaoImpl(connection);
            productCategoryDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataSourceUtil.closeConnection(connection);
        }
    }
    /**
     * 查询全部的商品分类
     * @return
     */

    public List<ProductCategoryVo> queryAllProductCategoryList() {
        //查询一级分类的列表
        List<ProductCategoryVo> productCategory1VoList = new ArrayList<ProductCategoryVo>();
        //查询一级分类
        List<ProductCategory> productCategory1List = getProductCategories(null);
        //遍历以及分类,根据一级ID查询二级分类
        for (ProductCategory product1Category : productCategory1List) {
            //封装一级分类
            ProductCategoryVo productCategoryVo = new ProductCategoryVo();
            //把一级分类放进vo里
            productCategoryVo.setProductCategory(product1Category);
            //new一个list，把一级分类的孩子（二级）放进这个list
            List<ProductCategoryVo> productCategoryVo1ChildList = new ArrayList<ProductCategoryVo>();
            //根据一级分类查询二级分类
            List<ProductCategory> productCategory2List = getProductCategories(product1Category.getId());
            //遍历根据一级查询出来的二级
            for (ProductCategory productCategory2 : productCategory2List) {
                ProductCategoryVo productCategoryVo2 = new ProductCategoryVo();
                //把孩子（二级）放进list里面
                productCategoryVo1ChildList.add(productCategoryVo2);
                productCategoryVo2.setProductCategory(productCategory2);
                //new list 准备放二级的孩子（三级）
                List<ProductCategoryVo> productCategoryVo2ChildList = new ArrayList<ProductCategoryVo>();
                productCategoryVo2.setProductCategoryVoList(productCategoryVo2ChildList);
                //根据二级分类查询三级分类的列表
                List<ProductCategory> productCategory3List = getProductCategories(productCategory2.getId());
                for (ProductCategory productCategory3 : productCategory3List) {
                    ProductCategoryVo productCategoryVo3 = new ProductCategoryVo();
                    //把三级放进vo里
                    productCategoryVo3.setProductCategory(productCategory3);
                    //再把每一个vo都放进list里面
                    productCategoryVo2ChildList.add(productCategoryVo3);
                }
            }
            //把一级的孩子放进一级的vo
            productCategoryVo.setProductCategoryVoList(productCategoryVo1ChildList);
            //再把vo放进一级的list里面
            productCategory1VoList.add(productCategoryVo);
        }
        //返回一级的list
        return productCategory1VoList;
    }
    /**
     * 查询子分类
     * @param parentId
     * @return
     */
    private List<ProductCategory> getProductCategories(Integer parentId) {//根据父ID查询所有子商品分类
        Connection connection = null;
        List<ProductCategory> productCategoryList = null;
        try {
            connection = DataSourceUtil.openConnection();
            ProductCategoryDao productCategoryDao = new ProductCategoryDaoImpl(connection);
            ProductCategoryParam params = new ProductCategoryParam();
            if (EmptyUtils.isNotEmpty(parentId)) {
            	params.setParentId(parentId);
            } else {
            	params.setParentId(0);
            }
            productCategoryList = productCategoryDao.queryProductCategorylist(params);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DataSourceUtil.closeConnection(connection);
            return productCategoryList;
        }
    }
}
