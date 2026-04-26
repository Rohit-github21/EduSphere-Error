package com.univ.dao;

import com.univ.pojo.Student;

public interface StudentDao {

  boolean addStudent(Student s);
  
  Student checkStudent(String email, String password);

 
  Student getStudentByEmail(String email);
  
  public void updateProfileImage(String email, String profileInages);
  
  
  Student findByEmail(String email);
  
  void save(Student student);
  
  public Long getStudentCount();
  
  public void updateStudent(Student student);
  
}