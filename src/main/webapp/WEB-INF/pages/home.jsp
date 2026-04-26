<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduSphere - Premium E-Learning Platform</title>
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />
    
                         <%-- Message Section --%>
<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
    <div class="alert alert-success" >
        <h3 style="text-align: center;color: orange ; margin-top: 10px">
        <%= msg %>
        </h3> 
    </div>
<%
    }
%>
      
    
    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <div class="hero-badge">🎓 Premium E-Learning Experience</div>
            <h1 class="hero-title">Master Your Skills with EduSphere</h1>
            <p class="hero-description">
                Transform your learning journey with our comprehensive quiz platform, 
                personalized course recommendations, and advanced analytics. 
                Join thousands of learners achieving their educational goals.
            </p>
            <div class="hero-actions">
                <a href="${pageContext.request.contextPath}/register.jsp" class="btn btn-primary btn-lg">Get Started Free</a>
                <a href="${pageContext.request.contextPath}/services.jsp" class="btn btn-outline btn-lg">Explore Services</a>
            </div>
        </div>
    </section>
    
    <!-- About Section -->
    <section class="about-section">
        <div class="container">
            <div class="about-content">
                <div class="about-text">
                    <h2>About EduSphere</h2>
                    <p>
                        EduSphere is a cutting-edge e-learning platform designed to revolutionize 
                        the way you learn and assess your knowledge. Our platform combines advanced 
                        quiz systems with intelligent course recommendations to provide a personalized 
                        learning experience.
                    </p>
                    <p>
                        Whether you're a student preparing for exams, a professional looking to upskill, 
                        or an educator creating engaging assessments, EduSphere provides all the tools 
                        you need to succeed.
                    </p>
                    <div class="about-stats">
                        <div class="stat-card">
                            <div class="stat-number">5K+</div>
                            <div class="stat-label">Active Users</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number">50+</div>
                            <div class="stat-label">Courses</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number">5K+</div>
                            <div class="stat-label">Quizzes Taken</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number">95%</div>
                            <div class="stat-label">Success Rate</div>
                        </div>
                    </div>
                </div>
                <div class="about-image">
                    <div class="about-image-container">
                        <div style="width: 100%; height: 300px; background: linear-gradient(135deg, #4F46E5, #3B82F6); border-radius: 12px; display: flex; align-items: center; justify-content: center; color: white; font-size: 4rem;">
                            📚
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Features Section -->
    <section class="features-section">
        <div class="container">
            <div class="section-title">
                <h2>Why Choose EduSphere?</h2>
                <p>Discover the features that make us the best e-learning platform</p>
            </div>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">📝</div>
                    <h3>Interactive Quizzes</h3>
                    <p>
                        Engage with dynamic quizzes across multiple subjects. 
                        Test your knowledge and track your progress in real-time.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">📊</div>
                    <h3>Detailed Analytics</h3>
                    <p>
                        Get comprehensive insights into your performance with 
                        advanced analytics and personalized recommendations.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🎯</div>
                    <h3>Personalized Learning</h3>
                    <p>
                        AI-powered course recommendations tailored to your 
                        learning style and goals.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">⏱️</div>
                    <h3>Timed Assessments</h3>
                    <p>
                        Practice with timed quizzes to improve your speed 
                        and accuracy for real exams.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🏆</div>
                    <h3>Achievement System</h3>
                    <p>
                        Earn badges and certificates as you complete courses 
                        and achieve learning milestones.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">💼</div>
                    <h3>Expert Content</h3>
                    <p>
                        Access high-quality content created by industry 
                        experts and experienced educators.
                    </p>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Quiz Benefits Section -->
    <section class="benefits-section">
        <div class="container">
            <div class="section-title">
                <h2>Quiz Platform Benefits</h2>
                <p>Maximize your learning potential with our advanced quiz system</p>
            </div>
            <div class="benefits-grid">
                <div class="benefit-item">
                    <div class="benefit-icon">✓</div>
                    <div class="benefit-content">
                        <h4>Instant Results</h4>
                        <p>Get immediate feedback on your quiz performance with detailed explanations</p>
                    </div>
                </div>
                <div class="benefit-item">
                    <div class="benefit-icon">✓</div>
                    <div class="benefit-content">
                        <h4>Progress Tracking</h4>
                        <p>Monitor your improvement over time with comprehensive history and analytics</p>
                    </div>
                </div>
                <div class="benefit-item">
                    <div class="benefit-icon">✓</div>
                    <div class="benefit-content">
                        <h4>Flexible Learning</h4>
                        <p>Study at your own pace with 24/7 access to all quiz materials</p>
                    </div>
                </div>
                <div class="benefit-item">
                    <div class="benefit-icon">✓</div>
                    <div class="benefit-content">
                        <h4>Multiple Question Types</h4>
                        <p>Practice with MCQs, true/false, and other question formats</p>
                    </div>
                </div>
                <div class="benefit-item">
                    <div class="benefit-icon">✓</div>
                    <div class="benefit-content">
                        <h4>Mobile Friendly</h4>
                        <p>Take quizzes on any device - desktop, tablet, or smartphone</p>
                    </div>
                </div>
                <div class="benefit-item">
                    <div class="benefit-icon">✓</div>
                    <div class="benefit-content">
                        <h4>Secure Platform</h4>
                        <p>Your data and progress are protected with enterprise-level security</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-container">
                <h2>Ready to Start Learning?</h2>
                <p>Join EduSphere today and take your education to the next level</p>
                <div class="hero-actions">
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-primary btn-lg">Create Free Account</a>
                    <a href="${pageContext.request.contextPath}/contact" class="btn btn-secondary btn-lg">Contact Us</a>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />
    
    <!-- JavaScript Files -->
    <script>
    setTimeout(function () {
        var msg = document.getElementById("msgBox");
        if (msg) {
            msg.style.display = "none";
        }
    }, 3000); // 3000 ms = 3 seconds
</script>
    
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
