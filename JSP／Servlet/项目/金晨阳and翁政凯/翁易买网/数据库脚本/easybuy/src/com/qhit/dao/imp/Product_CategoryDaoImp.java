package com.qhit.dao.imp;
import java.security.AllPermission;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qhit.dao.BaseDao;
import com.qhit.dao.Product_CategoryDao;
import com.qhit.entity.Product;
import com.qhit.entity.Product_Category;

public class Product_CategoryDaoImp extends BaseDao implements Product_CategoryDao{
	//查询商品分类表-->一级商品
	public List<Product_Category> selectVo_Dao() {
		List<Product_Category> list = new ArrayList<Product_Category>();
		String sql = "select * from easybuy_product_category where type =?";
		ResultSet executeQuery = super.executeQuery(sql, 1);
		Product_Category pc = null;
		try {
			while(executeQuery.next()){
				pc = new Product_Category();
				pc.setId(executeQuery.getInt(1));
				pc.setName(executeQuery.getString(2));
				pc.setParentld(executeQuery.getInt(3));
				pc.setType(executeQuery.getInt(4));
				list.add(pc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return list;
	}
	
	//查询商品分类表-->二、三级商品
	public List<Product_Category> selectVo_Dao_er(int id) {
		List<Product_Category> list = new ArrayList<Product_Category>();
		String sql = "select * from easybuy_product_category where parentld =?";
		ResultSet executeQuery = super.executeQuery(sql, id);
		Product_Category pc = null;
		try {
			while(executeQuery.next()){
				pc = new Product_Category();
				pc.setId(executeQuery.getInt(1));
				pc.setName(executeQuery.getString(2));
				pc.setParentld(executeQuery.getInt(3));
				pc.setType(executeQuery.getInt(4));
				list.add(pc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return list;
	}
	
	//根据三级查询商品列表
	public List<Product> selectProductDao(int id) {
		List<Product> al = new ArrayList<Product>();
		String sql = "select * from easybuy_product where categorylevel3=?";
		ResultSet executeQuery = super.executeQuery(sql,id);
		try {
			while(executeQuery.next()){
				Product pr = new Product();
				pr.setId(executeQuery.getInt(1));
				pr.setName(executeQuery.getString(2));
				pr.setDesciption(executeQuery.getString(3));
				pr.setPrice(executeQuery.getFloat(4));
				pr.setStock(executeQuery.getInt(5));
				pr.setCategorylevel1(executeQuery.getInt(6));
				pr.setCategorylevel2(executeQuery.getInt(7));
				pr.setCategorylevel3(executeQuery.getString(8));
				pr.setFileName(executeQuery.getString(9));
				pr.setIsDelete(executeQuery.getInt(10));
				al.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
	
	//根据ID查询商品列表
	public List<Product> selectId_ProductDao(int id) {
		List<Product> al = new ArrayList<Product>();
		String sql = "select * from easybuy_product where id=?";
		ResultSet executeQuery = super.executeQuery(sql,id);
		try {
			while(executeQuery.next()){
				Product pr = new Product();
				pr.setId(executeQuery.getInt(1));
				pr.setName(executeQuery.getString(2));
				pr.setDesciption(executeQuery.getString(3));
				pr.setPrice(executeQuery.getFloat(4));
				pr.setStock(executeQuery.getInt(5));
				pr.setCategorylevel1(executeQuery.getInt(6));
				pr.setCategorylevel2(executeQuery.getInt(7));
				pr.setCategorylevel3(executeQuery.getString(8));
				pr.setFileName(executeQuery.getString(9));
				pr.setIsDelete(executeQuery.getInt(10));
				al.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
	//加入後無車
	public Product addProductDao(int id) {
		Product pr = new Product();
		String sql = "select * from easybuy_product where id=?";
		ResultSet executeQuery = super.executeQuery(sql,id);
		try {
			while(executeQuery.next()){
				pr.setId(executeQuery.getInt(1));
				pr.setName(executeQuery.getString(2));
				pr.setDesciption(executeQuery.getString(3));
				pr.setPrice(executeQuery.getFloat(4));
				pr.setStock(executeQuery.getInt(5));
				pr.setCategorylevel1(executeQuery.getInt(6));
				pr.setCategorylevel2(executeQuery.getInt(7));
				pr.setCategorylevel3(executeQuery.getString(8));
				pr.setFileName(executeQuery.getString(9));
				pr.setIsDelete(executeQuery.getInt(10));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pr;
	}
	//查询全部商品
	public List<Product> selectallProductDao() {
		List<Product> al = new ArrayList<Product>();
		String sql = "select * from easybuy_product";
		ResultSet executeQuery = super.executeQuery(sql);
		try {
			while(executeQuery.next()){
				Product pr = new Product();
				pr.setId(executeQuery.getInt(1));
				pr.setName(executeQuery.getString(2));
				pr.setDesciption(executeQuery.getString(3));
				pr.setPrice(executeQuery.getFloat(4));
				pr.setStock(executeQuery.getInt(5));
				pr.setCategorylevel1(executeQuery.getInt(6));
				pr.setCategorylevel2(executeQuery.getInt(7));
				pr.setCategorylevel3(executeQuery.getString(8));
				pr.setFileName(executeQuery.getString(9));
				pr.setIsDelete(executeQuery.getInt(10));
				al.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

	//查询三级商品
	public List<Product_Category> selectProduct_Category_Dao(int id) {
		List<Product_Category> list = new ArrayList<Product_Category>();
		String sql = "select * from easybuy_product_category where type =?";
		ResultSet executeQuery = super.executeQuery(sql, id);
		Product_Category pc = null;
		try {
			while(executeQuery.next()){
				pc = new Product_Category();
				pc.setId(executeQuery.getInt(1));
				pc.setName(executeQuery.getString(2));
				pc.setParentld(executeQuery.getInt(3));
				pc.setType(executeQuery.getInt(4));
				list.add(pc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return list;
	}

	//商品的添加
	public int insertProduct_Dao(Product product) {
		String sql ="insert into easybuy_product(name,desciption,price,stock,categorylevel1,categorylevel2,categorylevel3,fileName) values (?,?,?,?,?,?,?,?)";
		int executeUpdate = super.executeUpdate(sql, product.getName(),product.getDesciption(),product.getPrice(),product.getStock(),product.getCategorylevel1(),product.getCategorylevel2(),product.getCategorylevel3(),product.getFileName());
		return executeUpdate;
	}

	//查询全部商品分类列表
	public List<Product_Category> selectProduct_Category_Dao() {
		List<Product_Category> list = new ArrayList<Product_Category>();
		String sql = "select * from easybuy_product_category";
		ResultSet executeQuery = super.executeQuery(sql);
		Product_Category pc = null;
		try {
			while(executeQuery.next()){
				pc = new Product_Category();
				pc.setId(executeQuery.getInt(1));
				pc.setName(executeQuery.getString(2));
				pc.setParentld(executeQuery.getInt(3));
				pc.setType(executeQuery.getInt(4));
				list.add(pc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return list;
	}

	//删除分类商品
	public int deteleProduct_Category_Dao(int id) {
		System.out.println("dao\tid:\t"+id);
		String sql = "delete from easybuy_product_category where id=?";
		int executeUpdate = super.executeUpdate(sql,id);
		return executeUpdate;
	}

	//删除商品
	public int deteleProduct_Dao(int id) {
		String sql = "delete from easybuy_product where id=?";
		int executeUpdate = super.executeUpdate(sql,id);
		return executeUpdate;
	}
}
