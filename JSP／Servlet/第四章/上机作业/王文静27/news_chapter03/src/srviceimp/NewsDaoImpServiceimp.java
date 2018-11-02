package srviceimp;
import org.jbit.news.dao.BaseDao;
import org.jbit.news.dao.impl.NewsDaoImpl;
import srvice.NewsDaoImpService;
public class NewsDaoImpServiceimp extends BaseDao implements NewsDaoImpService{
	public String DeleteNewsDao(int id) {
		NewsDaoImpl newsDaoImpl = new NewsDaoImpl();
		int deleanewDao = newsDaoImpl.deleanewDao(id);
		String jishaun="";
		if(deleanewDao==1){
			jishaun="删除成功";
			return jishaun;
			
		}else{
			jishaun="删除失败";
		}
		return jishaun;
	}
/////
	
}
