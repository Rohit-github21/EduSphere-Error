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
@RequestMapping("/admin")
public class QuestionnaireController {

    @Autowired
    private QuestionnaireDao dao;
    


    // 🔹 ADMIN DASHBOARD (LIST)
    @GetMapping
    public String adminDashboard(Model model) {
        model.addAttribute("list", dao.getAll());
        return "admin-dashboard";
    }

    // 🔹 ADD FORM
    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("questionnaire", new Questionnaire());
        model.addAttribute("mode", "create");
        return "questionnaire-form";
    }

    // 🔹 EDIT FORM
    @GetMapping("/edit")
    public String edit(@RequestParam("id") int id, Model model) {
        model.addAttribute("questionnaire", dao.getById(id));
        model.addAttribute("mode", "edit");
        return "admin-dashboard";
    }

    // 🔹 VIEW FORM
    @GetMapping("/view")
    public String view(@RequestParam("id") int id, Model model) {
        model.addAttribute("questionnaire", dao.getById(id));
        model.addAttribute("mode", "view");
        return "questionnaire-form";
    }

    // 🔹 SAVE / UPDATE
    @PostMapping("/save")
    public String save(@ModelAttribute Questionnaire q) {
        if (q.getId() == 0) {
            dao.save(q);
        } else {
            dao.update(q);
        }
        return "redirect:/admin";   // ✅ BACK TO ADMIN DASHBOARD
    }

    // 🔹 DELETE
    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id) {
        dao.delete(id);
        return "redirect:/admin";   // ✅ BACK TO ADMIN DASHBOARD
    }
    
   

   

    
    
	

}
