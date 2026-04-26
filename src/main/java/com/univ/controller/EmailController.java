package com.univ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmailController {

	@RequestMapping("/email-registration")
	public String emailRegistration(
			@RequestParam(required = false) String userName,
			@RequestParam(required = false) String email,
			@RequestParam(required = false) String fullName,
			Model model) {
		
		if (userName != null) model.addAttribute("userName", userName);
		if (email != null) model.addAttribute("email", email);
		if (fullName != null) model.addAttribute("fullName", fullName);
		
		return "email-registration";
	}
	
	@RequestMapping("/email-result")
	public String emailResult(
			@RequestParam(required = false) String userName,
			@RequestParam(required = false) String quizName,
			@RequestParam(required = false) String score,
			@RequestParam(required = false) String correctAnswers,
			@RequestParam(required = false) String totalQuestions,
			Model model) {
		
		if (userName != null) model.addAttribute("userName", userName);
		if (quizName != null) model.addAttribute("quizName", quizName);
		if (score != null) model.addAttribute("score", score);
		if (correctAnswers != null) model.addAttribute("correctAnswers", correctAnswers);
		if (totalQuestions != null) model.addAttribute("totalQuestions", totalQuestions);
		
		return "email-result";
	}
	
	@RequestMapping("/email-subscription")
	public String emailSubscription(
			@RequestParam(required = false) String userName,
			@RequestParam(required = false) String planName,
			@RequestParam(required = false) String amount,
			Model model) {
		
		if (userName != null) model.addAttribute("userName", userName);
		if (planName != null) model.addAttribute("planName", planName);
		if (amount != null) model.addAttribute("amount", amount);
		
		return "email-subscription";
	}
}
