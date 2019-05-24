package oracle;

import Dao.UserDaoImpl;

public class DaoFactory {//½µµÍñîºÏÐÔ
	
		public static UserDaoImpl  getDaoImpl()
		{
			return new UserDaoImpl();
		}

	}