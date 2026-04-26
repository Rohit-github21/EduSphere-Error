package com.univ.controller;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.univ.dao.PurchasedCourseDao;
import com.univ.dao.StudentDao;
import com.univ.pojo.PurchasedCourse;
import com.univ.pojo.Student;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class PaymentController {

    private static final String KEY_ID = "rzp_test_SFYLjoCGxfFhpx";
    private static final String KEY_SECRET = "YYxjifhqPMyCWSzd8ahrMAoH";

    @Autowired
private StudentDao studentDao;
    

    @Autowired
    private PurchasedCourseDao purchasedCourseDao;
    // ==============================
    // 1️⃣ Subscription Plans Page
    // ==============================
    @GetMapping("/subscription-plans")
    public String subscriptionPlans() {
        return "subscription-plans";
    }


    // ==============================
    // 2️⃣ Payment Gateway Page
    // ==============================
    @GetMapping("/payment-gateway")
    public String paymentGateway(@RequestParam String plan,
                                 @RequestParam String course,
                                 Map<String, Object> model) {

        model.put("selectedPlan", plan);
        model.put("courseName", course);

        return "payment-gateway";
    }


    

    // ==============================
    // 3️⃣ Create Razorpay Order
    // ==============================
    @PostMapping("/create-order")
    @ResponseBody
    public Map<String, Object> createOrder(@RequestParam String plan,
                                           @RequestParam String course,
                                           HttpSession session) throws Exception {

        session.setAttribute("selectedCourse", course);

        Map<String, Object> response = new HashMap<>();

        if ("free".equalsIgnoreCase(plan)) {
            response.put("free", true);
            return response;
        }

        int amount = 499900;

        RazorpayClient client = new RazorpayClient(KEY_ID, KEY_SECRET);

        JSONObject options = new JSONObject();
        options.put("amount", amount);
        options.put("currency", "INR");
        options.put("receipt", "txn_" + System.currentTimeMillis());

        Order order = client.orders.create(options);

        response.put("orderId", order.get("id"));
        response.put("amount", order.get("amount"));
        response.put("currency", order.get("currency"));
        response.put("key", KEY_ID);

        return response;
    }



    // ==============================
    // 4️⃣ Payment Success Page
    // ==============================
  
   
       
        
     
    @GetMapping("/payment-success")
    public String paymentSuccess(@RequestParam String plan,
                                 @RequestParam(required = false) String course,
                                 @RequestParam(required = false) String razorpay_payment_id,
                                 HttpSession session,
                                 Map<String, Object> model) {

        Student student = (Student) session.getAttribute("loggedInStudent");

        if (student == null) {
            return "redirect:/login";
        }

        if ("premium".equalsIgnoreCase(plan)) {

            boolean alreadyPurchased =
                    purchasedCourseDao.existsByStudentAndCourseName(student, course);

            if (!alreadyPurchased) {

                PurchasedCourse pc = new PurchasedCourse();
                pc.setCourseName(course);
                pc.setStudent(student);

                purchasedCourseDao.save(pc);
            }
        }

        model.put("course", course);
        model.put("plan", plan);
        model.put("paymentId", razorpay_payment_id);

        return "payment-success";
    }

    
   



}
