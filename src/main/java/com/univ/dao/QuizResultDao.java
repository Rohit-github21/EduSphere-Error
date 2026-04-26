package com.univ.dao;

import java.util.List;

import com.univ.pojo.QuizResult;
import com.univ.pojo.Student;

public interface QuizResultDao {

    void save(QuizResult result);

    List<QuizResult> findByStudent(Student student);

    int getAttemptCount(Student student);

    int getHighestScore(Student student);
}
