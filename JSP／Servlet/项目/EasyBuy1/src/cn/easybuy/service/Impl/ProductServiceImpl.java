package cn.easybuy.service.Impl;

import java.sql.Connection;
import java.util.List;

import cn.easybuy.dao.ProductDao;
import cn.easybuy.dao.Impl.ProductDaoImpl;
import cn.easybuy.service.ProductService;
import cn.easybuy.utils.DataSourceUtil;
import cn.easybuy.entity.Product;

/**
 * 商品的业务类
 */
public class ProductServiceImpl implements ProductService {

	@SuppressWarnings("finally")
	@Override
	public boolean add(Product product) {
		Connection connection = null;
		Integer count = 0;
		try {
			connection = DataSourceUtil.openConnection();
			ProductDao productDao = new ProductDaoImpl(connection);
			count = productDao.add(product);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return count > 0;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public boolean update(Product product) {
		Connection connection = null;
		Integer count = 0;
		try {
			connection = DataSourceUtil.openConnection();
			ProductDao productDao = new ProductDaoImpl(connection);
			count = productDao.update(product);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return count > 0;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public boolean deleteProductById(Integer productId) {
		Connection connection = null;
		Integer count = 0;
		try {
			connection = DataSourceUtil.openConnection();
			ProductDao productDao = new ProductDaoImpl(connection);
			count = productDao.deleteProductById(productId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return count > 0;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Product getProductById(Integer productId) {
		Connection connection = null;
		Product product = null;
		try {
			connection = DataSourceUtil.openConnection();
			ProductDao productDao = new ProductDaoImpl(connection);
			product = productDao.getProductById(productId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return product;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public List<Product> getProductList(Integer currentPageNo,
			Integer pageSize, String proName, Integer categoryId, Integer level) {
		Connection connection = null;
		List<Product> productList = null;
		try {
			connection = DataSourceUtil.openConnection();
			ProductDao productDao = new ProductDaoImpl(connection);
			productList = productDao.getProductList(currentPageNo, pageSize,
					proName, categoryId, level);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return productList;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public int count(String proName, Integer categoryId, Integer level) {
		Connection connection = null;
		Integer count = 0;
		try {
			connection = DataSourceUtil.openConnection();
			ProductDao productDao = new ProductDaoImpl(connection);
			count = productDao.queryProductCount(proName, categoryId, level);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return count;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public boolean updateStock(Integer productId, Integer stock) {
		Connection connection = null;
		Integer count = 0;
		try {
			connection = DataSourceUtil.openConnection();
			ProductDao productDao = new ProductDaoImpl(connection);
			count = productDao.updateStock(productId, stock);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeConnection(connection);
			return count > 0;
		}
	}

}
