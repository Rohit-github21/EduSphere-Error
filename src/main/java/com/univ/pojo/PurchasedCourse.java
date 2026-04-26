package com.univ.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="purchased_courses")

public class PurchasedCourse {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String courseName;

	    @ManyToOne
	    @JoinColumn(name="student_email")
	    private Student student;

		public PurchasedCourse() {
			super();
			// TODO Auto-generated constructor stub
		}

		public PurchasedCourse(Long id, String courseName, Student student) {
			super();
			this.id = id;
			this.courseName = courseName;
			this.student = student;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getCourseName() {
			return courseName;
		}

		public void setCourseName(String courseName) {
			this.courseName = courseName;
		}

		public Student getStudent() {
			return student;
		}

		public void setStudent(Student student) {
			this.student = student;
		}


}

