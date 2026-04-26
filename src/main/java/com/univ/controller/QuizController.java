package com.univ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.univ.dao.MCQdao;
import com.univ.dao.QuizResultDao;   // ✅ ADD THIS
import com.univ.pojo.MCQs;
import com.univ.pojo.QuizResult;
import com.univ.pojo.Student;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class QuizController {

    @Autowired
    private MCQdao dao;

    // ✅ ADD THIS
    @Autowired
    private QuizResultDao quizResultDao;

    @GetMapping("/quiz")
    public String showAllQuiz(HttpSession session,
                              Model model) {

        Student student =
                (Student) session.getAttribute("loggedInStudent");

        if (student == null) {
            return "redirect:/login";
        }

        List<MCQs> questions = dao.getAllMcq();

        model.addAttribute("questions", questions);
        model.addAttribute("courseName", "All Courses");

        return "quiz";
    }



    @PostMapping("/submitQuiz")
    @Transactional
    public String submitQuiz(@RequestParam("course") String course,
                             HttpServletRequest request,
                             HttpSession session,
                             Model model) {

        Student student =
                (Student) session.getAttribute("loggedInStudent");

        if (student == null) {
            return "redirect:/login";
        }

        List<MCQs> questions;

        // ✅ Handle All Courses
        if ("All Courses".equalsIgnoreCase(course)) {
            questions = dao.getAllMcq();
        } else {
            questions = dao.getMcqByCourse(course);
        }

        int score = 0;

        for (MCQs q : questions) {
            String userAnswer = request.getParameter("question_" + q.getId());

            if (userAnswer != null &&
                userAnswer.equalsIgnoreCase(q.getCorrectAnswer())) {
                score++;
            }
        }

        int totalQuestions = questions.size();

        int percentage = totalQuestions == 0
                ? 0
                : (score * 100) / totalQuestions;

        // ✅ Save result
        QuizResult result = new QuizResult();
        result.setStudent(student);
        result.setScore(score);
        result.setTotalQuestions(totalQuestions);
        result.setExamDate(java.time.LocalDateTime.now());

        quizResultDao.save(result);

        // ✅ Format Date
        java.time.format.DateTimeFormatter formatter =
                java.time.format.DateTimeFormatter.ofPattern("dd MMM yyyy hh:mm a");

        String formattedDate =
                result.getExamDate().format(formatter);

        // ✅ VERY IMPORTANT — Add All Model Attributes
        model.addAttribute("score", score);
        model.addAttribute("total", totalQuestions);
        model.addAttribute("percentage", percentage);
        model.addAttribute("result", result);
        model.addAttribute("courseName", course);
        model.addAttribute("formattedDate", formattedDate);

        return "quiz-result";
    }


}
