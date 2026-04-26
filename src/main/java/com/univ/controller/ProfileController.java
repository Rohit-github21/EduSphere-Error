package com.univ.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.univ.dao.StudentDao;
import com.univ.pojo.Student;

@Controller
public class ProfileController {
	
	
    @Autowired
    private StudentDao studentDao;

    /* ================= PROFILE PAGE ================= */
    @RequestMapping("/profile")
    public String profile(HttpSession session, Model model) {

        // email session se
        Student student = (Student) session.getAttribute("loggedInStudent");

        if (student== null) {
            return "redirect:/login";
        }

//        Student student = studentDao.getStudentByEmail(email);
        model.addAttribute("student", student);

        return "profile";
    }

    /* ================= PROFILE IMAGE UPLOAD ================= */
    @PostMapping("/uploadProfileImage")
    public String uploadProfileImage(
            @RequestParam("profileImage") MultipartFile file,
            HttpSession session) {

        Student student = (Student) session.getAttribute("loggedInStudent");

        if (student == null || file.isEmpty()) {
            return "redirect:/profile";
        }

        String email = student.getEmail();  // 🔥 correct source

        // Clean filename (recommended)
        String extension = file.getOriginalFilename()
                .substring(file.getOriginalFilename().lastIndexOf("."));

        String fileName = email.replaceAll("[^a-zA-Z0-9]", "_") + extension;

        String uploadPath = session.getServletContext()
                .getRealPath("/resources/images/profile/");

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        try {
            file.transferTo(new File(uploadPath + fileName));

            // DB update
            studentDao.updateProfileImage(email, fileName);

            // 🔥 session update (very important)
            student.setProfileImage(fileName);
            session.setAttribute("loggedInStudent", student);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/profile";
    }
 
    @Autowired
 private  StudentDao studentService;
    
 @PostMapping("/updateProfile")
 public String updateProfile(@ModelAttribute Student student,
                             HttpSession session,
                             Model model) {

     Student existingStudent =
             (Student) session.getAttribute("loggedInStudent");

     // Only update editable fields
     existingStudent.setMobile(student.getMobile());
     existingStudent.setDob(student.getDob());
     existingStudent.setGender(student.getGender());
     existingStudent.setEducation(student.getEducation());

     studentService.updateStudent(existingStudent);

     session.setAttribute("loggedInStudent", existingStudent);

     model.addAttribute("student", existingStudent);
     model.addAttribute("successMsg", "Profile Updated Successfully!");

     return "profile";
 }



//	@RequestMapping("/profile")
//	public String profile() {
//		return "profile";
//	}
	
	
}
