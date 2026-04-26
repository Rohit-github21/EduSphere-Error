package com.univ.dao;



import java.util.List;
import com.univ.pojo.Questionnaire;

public interface QuestionnaireDao {

    void save(Questionnaire q);

    void update(Questionnaire q);

    void delete(int id);

    Questionnaire getById(int id);

    List<Questionnaire> getAll();
    
    Long getQuestionnaireCount();

    public List<Questionnaire> getAllQuestions(); 
    
    public List<Questionnaire> getByCourse(String course);
}

