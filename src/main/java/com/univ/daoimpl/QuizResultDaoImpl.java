package com.univ.daoimpl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.univ.dao.QuizResultDao;
import com.univ.pojo.QuizResult;
import com.univ.pojo.Student;

@Repository
@Transactional
public class QuizResultDaoImpl implements QuizResultDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    // 🔥 Save Result
    @Override
    public void save(QuizResult result) {
        hibernateTemplate.save(result);
    }

    // 🔥 Get All Results of Student
    @Override
    public List<QuizResult> findByStudent(Student student) {

        String hql = "FROM QuizResult qr WHERE qr.student = ?0 ORDER BY qr.examDate DESC";

        return (List<QuizResult>) hibernateTemplate.find(hql, student);
    }

    // 🔥 Attempt Count
    @Override
    public int getAttemptCount(Student student) {

        String hql = "SELECT COUNT(qr.id) FROM QuizResult qr WHERE qr.student = ?0";

        List<Long> list = (List<Long>) hibernateTemplate.find(hql, student);

        if (list != null && !list.isEmpty()) {
            return list.get(0).intValue();
        }

        return 0;
    }

    public int getHighestScore(Student student) {

        String hql = "SELECT MAX(qr.score) FROM QuizResult qr WHERE qr.student = ?0";

        List<Integer> list =
                (List<Integer>) hibernateTemplate.find(hql, student);

        if (list != null && !list.isEmpty() && list.get(0) != null) {
            return list.get(0);
        }

        return 0;
    }

}


