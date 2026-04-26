package com.univ.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.univ.dao.AdminDao;
import com.univ.pojo.Admin;


@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private HibernateTemplate hTemplate;





	@Override
	public Admin login(Admin a) {
		
		return hTemplate.execute(new HibernateCallback<Admin>() {

			@Override
			public Admin doInHibernate(Session session) throws HibernateException {
				
				Query<Admin> q = session.createQuery("from Admin where email= :email and password= :pass",Admin.class);
				
				q.setParameter("email", a.getEmail());
				q.setParameter("pass", a.getPassword());
				
				List<Admin> list = q.getResultList();
				
				if(list.isEmpty()) {
					return null;
					
				}
				
				return list.get(0);
			}
			
			
		});
	}
	
	

    
    
    
}

