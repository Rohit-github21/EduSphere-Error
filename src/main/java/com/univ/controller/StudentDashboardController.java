package com.univ.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.dao.QuestionnaireDao;
import com.univ.pojo.Questionnaire;
import com.univ.pojo.Student;

@Controller
public class StudentDashboardController {

	
	@GetMapping("/student-dashboard")
	public String studentDashboard(HttpSession session, Model model) {

	    Student student = (Student) session.getAttribute("loggedInStudent");

	    if (student == null) {
	        return "redirect:/login";
	    }

	    model.addAttribute("student", student);

	    return "student-dashboard";
	}
	
	


	
	
}

