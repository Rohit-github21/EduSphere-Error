package com.univ.dao;

import java.util.List;

import com.univ.pojo.MCQs;


public interface MCQdao {
	
	boolean insert(MCQs m);
	boolean update(MCQs m);
	boolean delete(MCQs m);
	List<MCQs> getAllMcq();
	
	MCQs getMcqById(int id);

	Long getQuizCount();
//	Long getAttemptCount();

	 List<MCQs> getMcqByCourse(String course);

}