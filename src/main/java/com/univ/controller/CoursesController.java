package com.univ.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.dao.PurchasedCourseDao;
import com.univ.dao.QuestionnaireDao;
import com.univ.pojo.Questionnaire;
import com.univ.pojo.Student;

@Controller
public class CoursesController {
	
	@Autowired
	private PurchasedCourseDao purchasedCourseDao;


    @GetMapping("/courses")
    public String courses() {
        return "courses";
    }

   
    @GetMapping("/premium")
    public String premiumPage(
            @RequestParam("course") String course,
            Model model,
            HttpSession session) {

        Student student = (Student) session.getAttribute("loggedInStudent");

        if (student == null) {
            return "redirect:/login";
        }

        // 🔐 CHECK FROM purchased_courses TABLE
        boolean isPurchased =
                purchasedCourseDao.existsByStudentAndCourseName(student, course);

        model.addAttribute("isPremiumUser", isPurchased);
        model.addAttribute("course", course);   // 🔥 IMPORTANT for JSP

        String videoLink = "";
        String title = "";
        String description = "";
        String[] features = null;

        switch(course.toLowerCase()) {

            case "java":
                title = "Java Premium Course";
                videoLink = "https://www.youtube.com/embed/7-lK9EpBS_Y";
                description = "Master Java including Core Java, OOP, JDBC, Servlets, JSP and Spring Boot.";
                features = new String[]{
                        "40+ Hours Detailed Content",
                        "Real-Time Industry Projects",
                        "Interview Preparation",
                        "Lifetime Access"
                };
                break;

            case "python":
                title = "Python Premium Course";
                videoLink = "https://www.youtube.com/embed/kqtD5dpn9C8";
                description = "Learn Python from basics to advanced.";
                features = new String[]{
                        "35+ Hours Training",
                        "Automation Projects",
                        "Data Science Basics",
                        "Lifetime Access"
                };
                break;

            case "cpp":
                title = "C++ Premium Course";
                videoLink = "https://www.youtube.com/embed/vLnPwxZdW4Y";
                description = "Master C++ including OOP and STL.";
                features = new String[]{
                        "30+ Hours Learning",
                        "DSA Focus",
                        "Competitive Programming",
                        "Lifetime Access"
                };
                break;

            default:
                return "redirect:/courses";
        }

        model.addAttribute("videoLink", videoLink);
        model.addAttribute("videoTitle", title);
        model.addAttribute("description", description);
        model.addAttribute("features", features);

        return "premium";
    }


    
    @Autowired
    private QuestionnaireDao questionnaire;

    @GetMapping("/questionnaireCourse")
    public String questionnaire(
            @RequestParam String course,
            Model model) {

        List<Questionnaire> list = questionnaire.getByCourse(course);

        model.addAttribute("questions", list);
        model.addAttribute("selectedCourse", course);

        return "questionnaire";
    }
   

}
