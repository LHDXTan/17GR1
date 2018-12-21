package DaoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.news.util.ProductCategoryVo;

import Dao.BaseDao;
import Dao.UserDao;
import entity.ProductCategory;
import entity.User;

public  class UserDaoImp extends BaseDao implements UserDao{
  //验证用户名和密码
	public  User denglu(Object...use){
		String sql="select * from user where loginName=? and password=?";
		ResultSet rs = super.executeQuery(sql, use);
		User user=null;
		try {
			if(rs!=null){
				
			while(rs.next()){
				user=new User();
				user.setEmail(rs.getString("email"));
				user.setId(rs.getInt("id"));
				user.setIdentityCode(rs.getString("identityCode"));
				user.setLoginName(rs.getString("loginName"));
				user.setMobile(rs.getString("mobile"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getString("sex"));
				user.setType(rs.getInt("type"));
				user.setUserName(rs.getString("userName"));
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		
	}

	@Override
	public int regist(User user) {
		String sql="insert into user(loginName,userName,password,sex,email,mobile,identityCode,type) values(?,?,?,?,?,?,?,?)";
		Object[] ob={user.getLoginName(),user.getUserName(),user.getPassword(),user.getSex(),user.getEmail(),user.getMobile(),user.getIdentityCode(),user.getType()};
		return super.executeUpdate(sql, ob);
	}

	@Override
	public User selectName(String loginName) {
		String sql="select * from user where loginName=?";
		ResultSet rs = super.executeQuery(sql, loginName);
		User user=null;
		try {
			if(rs!=null){
				
			while(rs.next()){
				user=new User();
				user.setEmail(rs.getString("email"));
				user.setId(rs.getInt("id"));
				user.setIdentityCode(rs.getString("identityCode"));
				user.setLoginName(rs.getString("loginName"));
				user.setMobile(rs.getString("mobile"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getString("sex"));
				user.setType(rs.getInt("type"));
				user.setUserName(rs.getString("userName"));
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<User> selectUserAll() {
		String sql="select * from user";
		ResultSet rs = super.executeQuery(sql);
		List<User> list=new ArrayList<User>();
		User user=null;
		try {
			if(rs!=null){
				
			while(rs.next()){
				user=new User();
				user.setEmail(rs.getString("email"));
				user.setId(rs.getInt("id"));
				user.setIdentityCode(rs.getString("identityCode"));
				user.setLoginName(rs.getString("loginName"));
				user.setMobile(rs.getString("mobile"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getString("sex"));
				user.setType(rs.getInt("type"));
				user.setUserName(rs.getString("userName"));
				list.add(user);
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteUser(Object id) {
		String sql="delete from user where id=?";
		Object[] params={id};
		return super.executeUpdate(sql, params);
	};
	 
	
	
	
	
	
	/*public List<ProductCategoryVo> queryAllProductCategoryList() {
	        //查询一级分类的列表
	        List<ProductCategoryVo> productCategory1VoList = new ArrayList<ProductCategoryVo>();
	        //查询一级分类
	        List<ProductCategory> productCategory1List = getProductCategories(null);//查出来 全部一级的
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

	private List<ProductCategory> getProductCategories(Object object) {
		// TODO Auto-generated method stub
		return null;
	}*/
}
