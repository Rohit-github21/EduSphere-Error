<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Footer Component -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-content">
            <!-- About Section -->
            <div class="footer-section footer-about">
                <div class="footer-logo">
                    <div class="footer-logo-icon">E</div>
                    <span>EduSphere</span>
                </div>
                <p>
                    Premium e-learning platform offering comprehensive quiz systems, 
                    personalized course recommendations, and advanced learning analytics 
                    to help you achieve your educational goals.
                </p>
                <div class="footer-social">
                    <a href="#" class="social-icon" title="Facebook">📘</a>
                    <a href="#" class="social-icon" title="Twitter">🐦</a>
                    <a href="#" class="social-icon" title="LinkedIn">💼</a>
                    <a href="#" class="social-icon" title="Instagram">📷</a>
                </div>
            </div>
            
            <!-- Quick Links -->
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/services.jsp">Services</a></li>
                    <li><a href="${pageContext.request.contextPath}/courses.jsp">My Courses</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
                </ul>
            </div>
            
            <!-- Services -->
            <div class="footer-section">
                <h3>Services</h3>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/services.jsp">Online Quiz</a></li>
                    <li><a href="${pageContext.request.contextPath}/services.jsp">Quiz History</a></li>
                    <li><a href="${pageContext.request.contextPath}/services.jsp">Course Recommendation</a></li>
                    <li><a href="${pageContext.request.contextPath}/services.jsp">Questionnaire</a></li>
                    <li><a href="${pageContext.request.contextPath}/student-dashboard.jsp">Dashboard</a></li>
                </ul>
            </div>
            
            <!-- Contact Info -->
            <div class="footer-section">
                <h3>Contact Us</h3>
                <div class="footer-contact">
                    <div class="contact-item">
                        <span class="contact-icon">📧</span>
                        <span>support@edusphere.com</span>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">📞</span>
                        <span>+1 (555) 123-4567</span>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">📍</span>
                        <span>123 Education St, Learning City</span>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">🕐</span>
                        <span>Mon - Fri: 9AM - 6PM</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Footer Bottom -->
        <div class="footer-bottom">
            <p>
                &copy; 2026 <a href="${pageContext.request.contextPath}/home.jsp">EduSphere</a>. All rights reserved. 
                | Designed with ❤️ for learning
            </p>
        </div>
    </div>
</footer>