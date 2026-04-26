package com.univ.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.univ.dao.PurchasedCourseDao;
import com.univ.pojo.PurchasedCourse;
import com.univ.pojo.Student;

@Repository
@Transactional
public class PurchasedCourseDaoImpl implements PurchasedCourseDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public void save(PurchasedCourse purchasedCourse) {
        hibernateTemplate.save(purchasedCourse);
    }

    @Override
    public boolean existsByStudentAndCourseName(Student student, String courseName) {

        String hql = "from PurchasedCourse where student = :student and lower(courseName) = :course";

        List<PurchasedCourse> list = hibernateTemplate.execute(session ->
            session.createQuery(hql, PurchasedCourse.class)
                   .setParameter("student", student)
                   .setParameter("course", courseName.toLowerCase())
                   .getResultList()
        );

        return !list.isEmpty();
    }

}
