package com.univ.pojo;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "quiz_result")
public class QuizResult {

	 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int id;

	    @ManyToOne
	    @JoinColumn(name = "student_id", nullable = false)
	    private Student student;

	    @Column(nullable = false)
	    private int score;

	    @Column(name = "total_questions", nullable = false)
	    private int totalQuestions;

	    @Column(name = "exam_date")
	    private LocalDateTime examDate;

	public QuizResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QuizResult(int id, Student student, int score, int totalQuestions, LocalDateTime examDate) {
		super();
		this.id = id;
		this.student = student;
		this.score = score;
		this.totalQuestions = totalQuestions;
		this.examDate = examDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getTotalQuestions() {
		return totalQuestions;
	}

	public void setTotalQuestions(int totalQuestions) {
		this.totalQuestions = totalQuestions;
	}

	public LocalDateTime getExamDate() {
		return examDate;
	}

	public void setExamDate(LocalDateTime examDate) {
		this.examDate = examDate;
	}



    
    
}

