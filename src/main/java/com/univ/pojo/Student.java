package com.univ.pojo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;




@Entity
@Table(name = "student" )
public class Student {

	@Column(nullable = false)
	private String first;
	@Column(nullable = true)
	private String last;
	@Id
	private String email;
	@Column(nullable = true)
	private String mobile;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	@Column(nullable = true)
	private LocalDate dob;


	@Column(nullable = true)
	private String password;
	@Column(nullable = true)
	private String gender;
	@Column(nullable = true)
	private String education;
	
	@Column(name = "profile_image")
	private String profileImage;
	
	@OneToMany(mappedBy="student", cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	private List<PurchasedCourse> purchasedCourses = new ArrayList<>();;
	
	
	@OneToMany(mappedBy = "student",
	           cascade = CascadeType.ALL,
	           fetch = FetchType.LAZY)
	private List<QuizResult> quizResults;



	   
	


	public Student(String first, String last, String email, String mobile, LocalDate dob, String password,
			String gender, String education, String profileImage) {
		super();
		this.first = first;
		this.last = last;
		this.email = email;
		this.mobile = mobile;
		this.dob = dob;
		this.password = password;
		this.gender = gender;
		this.education = education;
		this.profileImage = profileImage;
	}




	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}




	public String getFirst() {
		return first;
	}




	public void setFirst(String first) {
		this.first = first;
	}




	public String getLast() {
		return last;
	}




	public void setLast(String last) {
		this.last = last;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getMobile() {
		return mobile;
	}




	public void setMobile(String mobile) {
		this.mobile = mobile;
	}




	public LocalDate getDob() {
		return dob;
	}




	public void setDob(LocalDate dob) {
		this.dob = dob;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getGender() {
		return gender;
	}




	public void setGender(String gender) {
		this.gender = gender;
	}




	public String getEducation() {
		return education;
	}




	public void setEducation(String education) {
		this.education = education;
	}




	public String getProfileImage() {
		return profileImage;
	}




	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}



	public List<PurchasedCourse> getPurchasedCourses() {
	    return purchasedCourses;
	}

	public void setPurchasedCourses(List<PurchasedCourse> purchasedCourses) {
	    this.purchasedCourses = purchasedCourses;
	}

	



	
	
}