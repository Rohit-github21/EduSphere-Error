package com.univ.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mcqs")
public class MCQs {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(nullable = false)
	private String question;
	@Column(nullable = false)
	private String a;
	@Column(nullable = false)
	private String b;
	@Column(nullable = false)
	private String c;
	@Column(nullable = false)
	private String d;
	@Column(nullable = false)
	private String correctAnswer;
	@Column(nullable = false)
	private String course;
	
	
	
	
	
	public MCQs(int id, String question, String a, String b, String c, String d, String correctAnswer,String course) {
		super();
		this.id = id;
		this.question = question;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.correctAnswer = correctAnswer;
		this.course=course;
	}


	public MCQs() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getQuestion() {
		return question;
	}


	public void setQuestion(String question) {
		this.question = question;
	}


	public String getA() {
		return a;
	}


	public void setA(String a) {
		this.a = a;
	}


	public String getB() {
		return b;
	}


	public void setB(String b) {
		this.b = b;
	}


	public String getC() {
		return c;
	}


	public void setC(String c) {
		this.c = c;
	}


	public String getD() {
		return d;
	}


	public void setD(String d) {
		this.d = d;
	}


	public String getCorrectAnswer() {
		return correctAnswer;
	}


	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}


	@Override
	public String toString() {
		return "MCQs [id=" + id + ", question=" + question + ", a=" + a + ", b=" + b + ", c=" + c + ", d=" + d
				+ ", correctAnswer=" + correctAnswer + "]";
	}


	public String getCourse() {
		return course;
	}


	public void setCourse(String course) {
		this.course = course;
	}
	
	
	

}
