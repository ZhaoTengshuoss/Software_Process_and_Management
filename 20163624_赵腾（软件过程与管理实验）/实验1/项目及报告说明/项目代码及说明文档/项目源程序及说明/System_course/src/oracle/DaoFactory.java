package oracle;

import Dao.UserDaoImpl;

public class DaoFactory {//���������
	
		public static UserDaoImpl  getDaoImpl()
		{
			return new UserDaoImpl();
		}

	}