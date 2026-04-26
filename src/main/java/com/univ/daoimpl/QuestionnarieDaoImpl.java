package com.univ.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.univ.dao.QuestionnaireDao;
import com.univ.pojo.Questionnaire;

@Repository
@Transactional
public class QuestionnarieDaoImpl implements QuestionnaireDao {


 
	
    @Autowired
    private HibernateTemplate hibernateTemplate;

    // 🔹 SAVE
    @Override
    public void save(Questionnaire q) {
        hibernateTemplate.save(q);
    }

    // 🔹 UPDATE
    @Override
    public void update(Questionnaire q) {
        hibernateTemplate.update(q);
    }

    // 🔹 DELETE
    @Override
    public void delete(int id) {
        Questionnaire q = hibernateTemplate.get(Questionnaire.class, id);
        if (q != null) {
            hibernateTemplate.delete(q);
        }
    }

    // 🔹 GET BY ID
    @Override
    public Questionnaire getById(int id) {
        return hibernateTemplate.get(Questionnaire.class, id);
    }

    // 🔹 GET ALL
    @SuppressWarnings("unchecked")
    @Override
    public List<Questionnaire> getAll() {
        return (List<Questionnaire>) hibernateTemplate.find("from Questionnaire");
    }
    
    @Override
    public Long getQuestionnaireCount() {

        String hql = "select count(q) from Questionnaire q";
        List<Long> list = (List<Long>) hibernateTemplate.find(hql);

        return (list != null && !list.isEmpty()) ? list.get(0) : 0L;
    }
    
//    @Override
//    public List<Questionnaire> getAllQuestions() {
//        return hibernateTemplate.loadAll(Questionnaire.class);
//    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Questionnaire> getByCourse(String course) {

        String hql = "from Questionnaire where lower(courses) = ?0 and status = 'ACTIVE'";

        return (List<Questionnaire>) hibernateTemplate.find(
                hql,
                course.toLowerCase().trim()
        );
    }





	@Override
	public List<Questionnaire> getAllQuestions() {
		// TODO Auto-generated method stub
		return null;
	}



}
