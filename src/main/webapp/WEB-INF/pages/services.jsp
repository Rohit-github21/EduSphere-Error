<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services - EduSphere</title>
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages.css">
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />
    
    <!-- Services Page -->
    <main class="services-page">
        <div class="container">
            <div class="page-header">
                <h1>Our Services</h1>
                <p>Explore our comprehensive suite of e-learning tools designed to enhance your educational journey</p>
            </div>
            
            <div class="services-grid">
                <!-- Quiz Service -->
                <a href="${pageContext.request.contextPath}/quiz"
 class="service-card">
                    <div class="service-icon">📝</div>
                    <h3>Take Quiz</h3>
                    <p>
                        Challenge yourself with our extensive collection of quizzes across 
                        multiple subjects and difficulty levels.
                    </p>
                    <ul class="service-features">
                        <li>Multiple question formats</li>
                        <li>Timed assessments</li>
                        <li>Instant feedback</li>
                        <li>Detailed explanations</li>
                    </ul>
                    <div class="btn btn-primary">Start Quiz →</div>
                </a>
                
                <!-- Quiz History Service -->
                <a href="${pageContext.request.contextPath}/quiz-results" class="service-card">
                    <div class="service-icon">📊</div>
                    <h3>Quiz History</h3>
                    <p>
                        Track your progress and review your past quiz attempts with 
                        comprehensive analytics and insights.
                    </p>
                    <ul class="service-features">
                        <li>Complete attempt history</li>
                        <li>Score tracking</li>
                        <li>Performance graphs</li>
                        <li>Improvement suggestions</li>
                    </ul>
                    <div class="btn btn-primary">View History →</div>
                </a>
                
                <!-- Course Recommendation Service -->
                <a href="${pageContext.request.contextPath}/courses" class="service-card">
                    <div class="service-icon">🎯</div>
                    <h3>Course Recommendation</h3>
                    <p>
                        Get personalized course suggestions based on your learning goals, 
                        interests, and performance data.
                    </p>
                    <ul class="service-features">
                        <li>AI-powered recommendations</li>
                        <li>Skill-based matching</li>
                        <li>Career path alignment</li>
                        <li>Expert-curated content</li>
                    </ul>
                    <div class="btn btn-primary">Get Recommendations →</div>
                </a>
                
                <!-- Questionnaire Service -->
                <a href="${pageContext.request.contextPath}/questionnaire" class="service-card">
                    <div class="service-icon">📋</div>
                    <h3>Questionnaire</h3>
                    <p>
                        Complete detailed questionnaires to help us understand your learning 
                        preferences and customize your experience.
                    </p>
                    <ul class="service-features">
                        <li>Learning style assessment</li>
                        <li>Interest profiling</li>
                        <li>Goal setting</li>
                        <li>Personalization options</li>
                    </ul>
                    
                    <div class="btn btn-primary" 
                       onclick="window.location.href='${pageContext.request.contextPath}/questionnaire'"
                    >
                   Fill Questionnaire →
                    </div>
                  
                </a>
                  
            </div>
            
            <!-- Additional Services Info -->
            <div class="section" style="margin-top: 4rem;">
                <div class="section-title">
                    <h2>How It Works</h2>
                    <p>Simple steps to start your learning journey</p>
                </div>
                
                <div class="grid grid-3">
                    <div class="glass-card text-center">
                        <div style="width: 60px; height: 60px; margin: 0 auto 1rem; background: linear-gradient(135deg, #4F46E5, #3B82F6); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem; font-weight: 700;">1</div>
                        <h4>Sign Up</h4>
                        <p>Create your free account in less than a minute</p>
                    </div>
                    <div class="glass-card text-center">
                        <div style="width: 60px; height: 60px; margin: 0 auto 1rem; background: linear-gradient(135deg, #10B981, #059669); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem; font-weight: 700;">2</div>
                        <h4>Choose Service</h4>
                        <p>Select from our wide range of learning services</p>
                    </div>
                    <div class="glass-card text-center">
                        <div style="width: 60px; height: 60px; margin: 0 auto 1rem; background: linear-gradient(135deg, #8B5CF6, #7C3AED); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 1.5rem; font-weight: 700;">3</div>
                        <h4>Start Learning</h4>
                        <p>Begin your personalized learning journey</p>
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
