<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - EduSphere</title>
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages.css">
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />
    
    <!-- Contact Page -->
    <main class="contact-page">
        <div class="contact-container">
            <div class="contact-intro">
                <h1>Get In Touch</h1>
                <p>
                    Have questions or feedback? We'd love to hear from you. 
                    Fill out the form below and our team will get back to you as soon as possible.
                </p>
            </div>
            
            <!-- Side-by-Side Forms -->
            <div class="contact-forms">
                <!-- Feedback Form -->
                <div class="contact-form-card">
                    <div class="form-card-header">
                        <div class="form-card-icon">💬</div>
                        <h2>Feedback Form</h2>
                        <p>Share your thoughts and suggestions</p>
                    </div>
                    <form id="feedback-form" onsubmit="return EduSphere.handleContactForm(event, 'feedback')">
                        <div class="form-group">
                            <label for="feedback-name" class="form-label">Your Name</label>
                            <input type="text" id="feedback-name" name="name" class="form-input" placeholder="Enter your name" required>
                        </div>
                        <div class="form-group">
                            <label for="feedback-email" class="form-label">Email Address</label>
                            <input type="email" id="feedback-email" name="email" class="form-input" placeholder="your@email.com" required>
                        </div>
                        <div class="form-group">
                            <label for="feedback-message" class="form-label">Your Feedback</label>
                            <textarea id="feedback-message" name="message" class="form-input" rows="5" placeholder="Tell us what you think..." required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" style="width: 100%;">Submit Feedback</button>
                    </form>
                </div>
                
                <!-- Support/Query Form -->
                <div class="contact-form-card">
                    <div class="form-card-header">
                        <div class="form-card-icon">🎧</div>
                        <h2>Support / Query</h2>
                        <p>Need help? Ask us anything</p>
                    </div>
                    <form id="support-form" onsubmit="return EduSphere.handleContactForm(event, 'support query')">
                        <div class="form-group">
                            <label for="support-name" class="form-label">Your Name</label>
                            <input type="text" id="support-name" name="name" class="form-input" placeholder="Enter your name" required>
                        </div>
                        <div class="form-group">
                            <label for="support-email" class="form-label">Email Address</label>
                            <input type="email" id="support-email" name="email" class="form-input" placeholder="your@email.com" required>
                        </div>
                        <div class="form-group">
                            <label for="support-subject" class="form-label">Subject</label>
                            <input type="text" id="support-subject" name="subject" class="form-input" placeholder="What is this about?" required>
                        </div>
                        <div class="form-group">
                            <label for="support-message" class="form-label">Message</label>
                            <textarea id="support-message" name="message" class="form-input" rows="4" placeholder="Describe your query..." required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" style="width: 100%;">Send Message</button>
                    </form>
                </div>
            </div>
            
            <!-- Contact Information -->
            <div class="contact-info">
                <div class="section-title text-center">
                    <h2>Other Ways to Reach Us</h2>
                    <p>Choose your preferred method of communication</p>
                </div>
                <div class="contact-info-grid">
                    <div class="contact-info-item">
                        <div class="contact-info-icon">📧</div>
                        <h4>Email Us</h4>
                        <p>support@edusphere.com</p>
                        <p>info@edusphere.com</p>
                    </div>
                    <div class="contact-info-item">
                        <div class="contact-info-icon">📞</div>
                        <h4>Call Us</h4>
                        <p>+1 (555) 123-4567</p>
                        <p>Mon-Fri, 9AM - 6PM EST</p>
                    </div>
                    <div class="contact-info-item">
                        <div class="contact-info-icon">📍</div>
                        <h4>Visit Us</h4>
                        <p>123 Education Street</p>
                        <p>Learning City, LC 12345</p>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />
    
    <!-- JavaScript Files -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>