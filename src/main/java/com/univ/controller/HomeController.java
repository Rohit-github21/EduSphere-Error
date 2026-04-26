package com.univ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.univ.dao.AdminDao;
import com.univ.dao.StudentDao;
import com.univ.pojo.Admin;
import com.univ.pojo.Student;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    private StudentDao studentDao;
    
    @Autowired
    private AdminDao admindao;
    
    @Autowired
    private MailSender msend;

    @GetMapping("/")
    public String index(HttpSession session) {

        if (session.getAttribute("loggedInStudent") != null
            || session.getAttribute("loggedInAdmin") != null) {

            return "redirect:/home";
        }

        return "redirect:/login";
    }


    @RequestMapping("/home")
    public String home(HttpSession session) {

        if (session.getAttribute("loggedInStudent") == null
            && session.getAttribute("loggedInAdmin") == null) {

            return "redirect:/login";
        }

        return "home";
    }


    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    
   
    
    // REGISTER
    @PostMapping("/addStudent")
    public ModelAndView userData(@ModelAttribute Student s) {

        boolean added = studentDao.addStudent(s);

        if (added) {
            msend.sendMail(s.getEmail(), s.getPassword());
            return new ModelAndView("login",
                    "msg", "Registration successful. Please login.");

        } else {
            return new ModelAndView("register",
                    "msg", "Email already registered");
        }
    }


    // LOGIN
    @PostMapping("/checkStudent")
    public ModelAndView checkStudent(@RequestParam String email,
                                     @RequestParam String password,
                                     HttpSession session) {

        Student stud = studentDao.checkStudent(email, password);

        if (stud != null) {

            session.setAttribute("loggedInStudent", stud);

            return new ModelAndView("student-dashboard",
                    "msg", "Student Login Successfully");

        } else {
            return new ModelAndView("login",
                    "msg", "Invalid Email Or Password");
        }
    }

    
    
    
    @PostMapping("/checkAdmin")
    public String checkAdmin(@ModelAttribute Admin a,
                             HttpSession session,
                             RedirectAttributes ra) {

        Admin ad = admindao.login(a);

        if (ad != null) {

            session.setAttribute("loggedInAdmin", ad);
            ra.addFlashAttribute("msg", "Admin Login Successfully");

            return "redirect:/admin-dashboard";
        } else {

            ra.addFlashAttribute("msg", "Invalid email and password");
            return "redirect:/login";
        }
    }


   
   @PostMapping("/register")
   public String registerStudent(Student student) {

       studentDao.save(student);

       return "redirect:/admin-dashboard";
   }



    // LOGOUT
   @GetMapping("/logout")
   public String logout(HttpSession session) {
       session.invalidate();
       return "redirect:/login"; // better UX
   }
}
    