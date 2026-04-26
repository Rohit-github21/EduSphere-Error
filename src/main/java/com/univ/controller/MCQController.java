package com.univ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.univ.dao.MCQdao;
import com.univ.pojo.MCQs;

@Controller
public class MCQController {

    @Autowired
    private MCQdao mcqDao;

    // ======================
    // ADD / UPDATE MCQ
    // ======================
    @PostMapping("/saveMcq")
    public String saveMcq(@ModelAttribute MCQs mcq,
                          RedirectAttributes ra) {

        if (mcq.getId() == 0) {
            mcqDao.insert(mcq);
            ra.addFlashAttribute("msg", "MCQ Added Successfully");
        } else {
            mcqDao.update(mcq);
            ra.addFlashAttribute("msg", "MCQ Updated Successfully");
        }

        return "redirect:/admin-dashboard";
    }

    // ======================
    // DELETE MCQ
    // ======================
    @GetMapping("/deleteMcq")
    public String deleteMcq(@RequestParam("id") int id,
                            RedirectAttributes ra) {

        MCQs mcq = mcqDao.getMcqById(id);
        if (mcq != null) {
            mcqDao.delete(mcq);
            ra.addFlashAttribute("msg", "MCQ Deleted Successfully");
        } else {
            ra.addFlashAttribute("msg", "MCQ Not Found");
        }

        return "redirect:/admin-dashboard";
    }
    
    @GetMapping("/editMcq")
    public String editMcq(@RequestParam("id") int id, Model model) {

        MCQs mcq = mcqDao.getMcqById(id);

        model.addAttribute("mcq", mcq);          // form fill ke liye
        model.addAttribute("mcqList", mcqDao.getAllMcq()); // table ke liye

        return "admin-dashboard"; // SAME PAGE
    }

}
