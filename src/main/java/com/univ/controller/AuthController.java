package com.univ.controller;


import java.time.LocalDate;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.univ.dao.StudentDao;
import com.univ.pojo.Student;

@Controller
public class AuthController {

    @Autowired
    private StudentDao studentDao;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

	/*
	 * @RequestMapping("/home") public String home(HttpSession session) { if
	 * (session.getAttribute("user") == null) { return "redirect:/login"; } return
	 * "home"; }
	 */

    @PostMapping("/googleLogin")
    @ResponseBody
    public String googleLogin(@RequestBody Map<String, String> body,
                              HttpSession session) {
        try {
            String token = body.get("idToken");

            FirebaseToken decodedToken =
                    FirebaseAuth.getInstance().verifyIdToken(token);

            String email = decodedToken.getEmail();
            String name  = decodedToken.getName();

            Student student = studentDao.findByEmail(email);

            if (student == null) {
                student = new Student();

                // 🔹 REQUIRED / IMPORTANT
                student.setEmail(email);
                student.setFirst(name != null ? name : "GoogleUser");
                student.setLast("USER");

                // 🔹 DEFAULT VALUES (to avoid DB errors)
                student.setDob(LocalDate.of(2000, 1, 1));   // default DOB
                student.setGender("UNKNOWN");
                student.setEducation("NA");
                student.setMobile("0");
                student.setPassword("GOOGLE_AUTH");         // dummy password
                student.setProfileImage(null);             // optional

                studentDao.save(student);
            }

            // 🔑 SESSION SET
            session.setAttribute("loggedInStudent", student);

            return "success";

        } catch (Exception e) {
            e.printStackTrace();
            return "failed";
        }
    }


}
