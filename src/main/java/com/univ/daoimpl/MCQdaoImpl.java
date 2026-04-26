package com.univ.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.univ.dao.MCQdao;
import com.univ.pojo.MCQs;

@Repository
@Transactional
public class MCQdaoImpl implements MCQdao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    // INSERT
    @Override
    public boolean insert(MCQs m) {
        try {
            hibernateTemplate.save(m);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // UPDATE
    @Override
    public boolean update(MCQs m) {
        try {
            hibernateTemplate.update(m);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE (by object)
    @Override
    public boolean delete(MCQs m) {
        try {
            hibernateTemplate.delete(m);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // GET ALL MCQs
    @SuppressWarnings("unchecked")
    @Override
    public List<MCQs> getAllMcq() {
        return (List<MCQs>) hibernateTemplate.find("from MCQs");
    }

    // GET MCQ BY ID
    @Override
    public MCQs getMcqById(int id) {
        return hibernateTemplate.get(MCQs.class, id);
    }
    
    @Override
    public Long getQuizCount() {

        String hql = "select count(m) from MCQs m";
        List<Long> list = (List<Long>) hibernateTemplate.find(hql);

        return (list != null && !list.isEmpty()) ? list.get(0) : 0L;
    }

//    @Override
//    public Long getAttemptCount() {
//
//        String hql = "select count(a) from QuizAttempt a";
//        List<Long> list = (List<Long>) hibernateTemplate.find(hql);
//
//        return (list != null && !list.isEmpty()) ? list.get(0) : 0L;
//    }

    @Override
    public List<MCQs> getMcqByCourse(String course) {

        String hql = "from MCQs where course = :course";

        return (List<MCQs>) hibernateTemplate.findByNamedParam( hql, "course", course);
    }
    
}
