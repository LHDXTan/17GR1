package com.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.BaseDao;
import com.dao.ProductDao;
import com.entity.Product;
import com.entity.Product_category;

public class ProductDaoImp extends BaseDao implements ProductDao {

	@Override
	public List<Product_category> yiji_fenlei() {
		// TODO Auto-generated method stub
		Connection lianjie = super.lianjie();
		String sql="select * from easybuy_product_category where type='1'";
		PreparedStatement pr=null;
		ResultSet re=null;
		List<Product_category> list=new ArrayList<Product_category>();
		try {
			pr = lianjie.prepareStatement(sql);
			re = pr.executeQuery();
			while(re.next()){
			Product_category pc=new Product_category(re.getInt(1),re.getString(2),re.getInt(3),re.getInt(4));
			list.add(pc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.guanbi(re, pr, lianjie);
		return list;
	}

	@Override
	public List<Product_category> parentId_fenlei(int id) {
		// TODO Auto-generated method stub
		
		Connection lianjie = super.lianjie();
		String sql="select * from easybuy_product_category where parentId=?";
		PreparedStatement pr=null;
		ResultSet re=null;
		List<Product_category> list=new ArrayList<Product_category>();
		try {
			pr=lianjie.prepareStatement(sql);
			pr.setInt(1, id);
			re = pr.executeQuery();
			while(re.next()){
				Product_category pc=new Product_category(re.getInt(1),re.getString(2),re.getInt(3),re.getInt(4));
				list.add(pc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.guanbi(re, pr, lianjie);
		return list;
	}

	@Override
	public List<Product> sjid_select(int id) {
		// TODO Auto-generated method stub
		List<Product> list=new ArrayList<Product>();
		Connection lianjie = super.lianjie();
		String sql="select * from easybuy_product where categoryLevel3=?";
		PreparedStatement pr=null;
		ResultSet re=null;
		try {
			pr=lianjie.prepareStatement(sql);
			pr.setInt(1, id);
			re = pr.executeQuery();
			while(re.next()){
				Product p=new Product(re.getInt(1), re.getString(2), re.getString(3), re.getFloat(4), re.getInt(5), re.getInt(6), re.getInt(7), re.getInt(8), re.getString(9), re.getInt(10));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		super.guanbi(re, pr, lianjie);
		return list;
	}

	@Override
	public Product id_select_shangpin(int id) {
		// TODO Auto-generated method stub
		Connection lianjie = super.lianjie();
		String sql="select * from easybuy_product where id=?";
		PreparedStatement pr=null;
		ResultSet re=null;
		Product p=null;
		try {
			pr=lianjie.prepareStatement(sql);
			pr.setInt(1, id);
			re = pr.executeQuery();
			while(re.next()){
				p=new Product(re.getInt(1), re.getString(2), re.getString(3), re.getFloat(4), re.getInt(5), re.getInt(6), re.getInt(7), re.getInt(8), re.getString(9), re.getInt(10));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.guanbi(re, pr, lianjie);
		return p;
	}
	
	

}
