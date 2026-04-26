package com.univ.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.univ.dao.MCQdao;
import com.univ.dao.QuestionnaireDao;
import com.univ.dao.StudentDao;
import com.univ.pojo.Admin;
import com.univ.pojo.MCQs;

@Controller
public class AdminDashboardController {
	
	
	@Autowired
	private StudentDao studentDao;


    @Autowired
    private MCQdao mcqDao;

    @Autowired
    private QuestionnaireDao questionnaireDao;
    
    
    

    @GetMapping("/admin-dashboard")
    public String adminDashboard(HttpSession session, Model model) {

        // 🔐 1️⃣ Check admin login
        Admin admin = (Admin) session.getAttribute("loggedInAdmin");

        if (admin == null) {
            return "redirect:/login";
        }

        // 🔥 2️⃣ Always load fresh data from DB
        Long totalStudents = studentDao.getStudentCount();
        Long totalQuizzes = mcqDao.getQuizCount();
        Long totalQuestionnaires = questionnaireDao.getQuestionnaireCount();

        model.addAttribute("totalStudents", totalStudents);
        model.addAttribute("totalQuizzes", totalQuizzes);
        model.addAttribute("totalQuestionnaires", totalQuestionnaires);

        model.addAttribute("questionnaireList",
                questionnaireDao.getAll());
        
        return "admin-dashboard";
    }

    
    
        
}



