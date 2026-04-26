package com.univ.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "questionnaire")
public class Questionnaire {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    
    @Column(name = "title", columnDefinition = "TEXT")
    private String title;
    
    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "courses", nullable = false)
    private String courses;
    

    @Column(name = "status")
    private String status;

    // ======================
    // Constructors
    // ======================
    public Questionnaire() {
    }

	public Questionnaire(int id, String title, String content, String status,String courses) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.status = status;
		this.courses=courses;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCourses() {
		return courses;
	}

	public void setCourses(String courses) {
		this.courses = courses;
	}
	
	

	
	
   

}