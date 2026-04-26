package com.univ.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import com.univ.dao.QuestionnaireDao;
import com.univ.pojo.Questionnaire;



@Controller
public class StudentQuestionnaireController {
	



    @Autowired
    private QuestionnaireDao dao;

	@GetMapping("/questionnaire")
	public String showQuestionnaire(
	        @RequestParam(defaultValue = "0") int page,
	        @RequestParam(defaultValue = "Java") String course,
	        Model model) {

	    int pageSize = 5;

	    List<Questionnaire> allQuestions = dao.getByCourse(course);

	    if (allQuestions == null) {
	        allQuestions = new ArrayList<>();
	    }

	    int totalQuestions = allQuestions.size();
	    int totalPages = (int) Math.ceil((double) totalQuestions / pageSize);

	    if (totalPages <= 0) totalPages = 1;
	    if (page >= totalPages) page = totalPages - 1;

	    int start = page * pageSize;
	    int end = Math.min(start + pageSize, totalQuestions);

	    List<Questionnaire> paginatedList =
	            totalQuestions > 0 ? allQuestions.subList(start, end)
	                               : new ArrayList<>();

	    model.addAttribute("questions", paginatedList);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("selectedCourse", course);

	    return "questionnaire";
	}

}
