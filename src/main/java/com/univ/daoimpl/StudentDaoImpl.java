package com.univ.daoimpl;

import org.hibernate.Query;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.univ.dao.StudentDao;
import com.univ.pojo.Student;
import java.util.List;

@Repository
@Transactional
public class StudentDaoImpl implements StudentDao {

    @Autowired
    private HibernateTemplate hTemplate;

    @Override
    public boolean addStudent(Student s) {
        try {
            Student existing = findByEmail(s.getEmail());
            if (existing != null) {
                return false; // email already exists
            }
            hTemplate.save(s);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


	
    @Override
    public Student checkStudent(String email, String password) {
        return hTemplate.execute(session -> {
            Query<Student> q = session.createQuery(
                "from Student where email = :email and password = :pass",
                Student.class
            );
            q.setParameter("email", email);
            q.setParameter("pass", password);
            return q.uniqueResult();
        });
    }

    
 // ✅ PROFILE PAGE DATA
    @Override
    public Student getStudentByEmail(String email) {
    	
        return hTemplate.get(Student.class, email);
        
    }

    // ✅ PROFILE IMAGE UPDATE
    @Override
    public void updateProfileImage(String email, String profileImage) {
        Student s = hTemplate.get(Student.class, email);
        if (s != null) {
            s.setProfileImage(profileImage);
            hTemplate.update(s);
        }
    
    }
    
    
    @Override
    public Student findByEmail(String email) {
        return hTemplate.execute(session -> {
            Query<Student> q = session.createQuery(
                    "from Student where email = :email", Student.class);
            q.setParameter("email", email);
            return q.uniqueResult();
        });
    }


    @Override
    public void save(Student student) {
        hTemplate.save(student);
    }

    @Override
    public Long getStudentCount() {
    	 String hql = "select count(s) from Student s";
         List<Long> list = (List<Long>) hTemplate.find(hql);

         return (list != null && !list.isEmpty()) ? list.get(0) : 0L;
    }
  
    @Transactional
    public void updateStudent(Student student) {
        hTemplate.update(student);
    }

	


}