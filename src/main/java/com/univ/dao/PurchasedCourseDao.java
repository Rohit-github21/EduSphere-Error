package com.univ.dao;


import com.univ.pojo.PurchasedCourse;
import com.univ.pojo.Student;

public interface PurchasedCourseDao {
	

	public boolean existsByStudentAndCourseName(Student student , String course);

	 void save(PurchasedCourse purchasedCourse);
}
