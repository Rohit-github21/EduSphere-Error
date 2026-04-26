package com.univ.controller;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.stereotype.Component;

@Component
public class MailSender {

    public void sendMail(String toEmail, String password) {

        final String fromEmail = "rohityadav789838@gmail.com";   
        final String appPassword = "wsih cmgz bfbj xoqc"; 

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, appPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(fromEmail, "EduSphere"));
;
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail)
            );

            message.setSubject("🎓 Welcome to EduSphere – Your Learning Journey Begins!");


            String msg =
            	    "<div style='font-family: Arial, sans-serif; background-color:#0f172a; padding:30px; color:#f1f5f9;'>"

            	  + "<div style='max-width:600px; margin:auto; background:#1e293b; padding:30px; border-radius:10px;'>"

            	  + "<h2 style='color:#6366f1; text-align:center;'>Welcome to EduSphere 🚀</h2>"

            	  + "<p style='font-size:16px;'>Hi there,</p>"

            	  + "<p style='font-size:15px; line-height:1.6;'>"
            	  + "Your registration was successful! 🎉<br>"
            	  + "We're excited to have you join the EduSphere community."
            	  + "</p>"

            	  + "<div style='background:#0f172a; padding:15px; border-radius:8px; margin:20px 0;'>"
            	  + "<p><strong>Email:</strong> " + toEmail + "</p>"
            	  + "<p><strong>Password:</strong> " + password + "</p>"
            	  + "</div>"

            	  + "<p style='font-size:15px;'>"
            	  + "Start exploring courses, take quizzes, and track your progress like never before."
            	  + "</p>"

							/*
							 * + "<div style='text-align:center; margin-top:25px;'>" +
							 * "<a href='http://localhost:8080/EduSphere/login' " +
							 * "style='background:#6366f1; color:white; padding:10px 20px; " +
							 * "text-decoration:none; border-radius:5px;'>Login to Your Account</a>" +
							 * "</div>"
							 * 
							 * + "<p style='margin-top:30px; font-size:13px; color:#94a3b8;'>" +
							 * "If you did not create this account, please ignore this email." + "</p>"
							 */

            	  + "<p style='margin-top:20px;'>"
            	  + "Happy Learning,<br><b>The EduSphere Team</b>"
            	  + "</p>"

            	  + "</div></div>";


            message.setContent(msg, "text/html");

            Transport.send(message);
            System.out.println("✅ Mail sent successfully");

        } catch (Exception e) {
            e.printStackTrace(); 
        }
    }
}