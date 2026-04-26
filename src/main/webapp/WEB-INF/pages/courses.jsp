<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Courses - EduSphere</title>
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages.css">
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />
    
    <!-- Courses Page -->
    <main class="courses-page">
        <div class="container">
            <div class="page-header">
                <h1>My Courses</h1>
                <p>Continue your learning journey with our curated courses</p>
            </div>
            
            <!-- Course Filters -->
            <div class="courses-filter">
                <button class="filter-btn active" onclick="EduSphere.filterCourses('all')">All Courses</button>
                <button class="filter-btn" onclick="EduSphere.filterCourses('free')">Free</button>
                <button class="filter-btn" onclick="EduSphere.filterCourses('premium')">Premium</button>
                <button class="filter-btn" onclick="EduSphere.filterCourses('in-progress')">In Progress</button>
            </div>
            
            <!-- Courses Grid -->
            <div class="courses-grid">
                <!-- Course 1 - Free -->
                <div class="course-card" data-type="free">
                    <div class="course-image">
                        💻
                        <span class="course-badge badge badge-free">Free</span>
                    </div>
                    <div class="course-content">
                        <h3 class="course-title">Introduction to Programming</h3>
                        <p class="course-description">
                            Learn the fundamentals of programming with hands-on exercises and real-world examples.
                        </p>
                        <div class="course-meta">
                            <span class="course-meta-item">📚 12 Lessons</span>
                            <span class="course-meta-item">⏱️ 8 Hours</span>
                        </div>
                        <div class="course-progress">
                            <div class="progress-label">
                                <span>Progress</span>
                                <span>65%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-fill" style="width: 65%;"></div>
                            </div>
                        </div>
                        <div class="course-footer" style=text-align:center;>
                            <a href="${pageContext.request.contextPath}/quiz" class="btn btn-primary">Continue Learning</a>
                        </div>
                    </div>
                </div>
                
                <!-- Course 2 - Premium -->
                <div class="course-card" data-type="premium">
                    <div class="course-image" style="background: linear-gradient(135deg, #10B981, #059669);">
                        🎨
                        <span class="course-badge badge badge-premium">Premium</span>
                    </div>
                    <div class="course-content">
                        <h3 class="course-title">Java Full Stack </h3>
                        <p class="course-description">
                            Master modern web technologies including Spring boot and cloud deployment.
                        </p>
                        <div class="course-meta">
                            <span class="course-meta-item">📚 24 Lessons</span>
                            <span class="course-meta-item">⏱️ 16 Hours</span>
                        </div>
                        <div class="course-progress">
                            <div class="progress-label">
                                <span>Progress</span>
                                <span>32%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-fill" style="width: 32%;"></div>
                            </div>
                        </div>
                       <div class="course-footer" style="text-align:center;">
    <a href="<%=request.getContextPath()%>/premium?course=java"
       class="btn btn-primary">
       Continue Learning
    </a>
</div>

                    </div>
                </div>
                
                <!-- Course 3 - Free -->
                <div class="course-card" data-type="free">
                    <div class="course-image" style="background: linear-gradient(135deg, #F59E0B, #D97706);">
                        📊
                        <span class="course-badge badge badge-free">Free</span>
                    </div>
                    <div class="course-content">
                        <h3 class="course-title">Data Science Fundamentals</h3>
                        <p class="course-description">
                            Explore data analysis, visualization, and basic machine learning concepts.
                        </p>
                        <div class="course-meta">
                            <span class="course-meta-item">📚 15 Lessons</span>
                            <span class="course-meta-item">⏱️ 10 Hours</span>
                        </div>
                        <div class="course-progress">
                            <div class="progress-label">
                                <span>Progress</span>
                                <span>0%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-fill" style="width: 0%;"></div>
                            </div>
                        </div>
                        <div class="course-footer" style=text-align:center;>
                            <a href="${pageContext.request.contextPath}/quiz" class="btn btn-primary">Start Course</a>
                        </div>
                    </div>
                </div>
                
                <!-- Course 4 - Premium -->
                <div class="course-card" data-type="premium">
                    <div class="course-image" style="background: linear-gradient(135deg, #8B5CF6, #7C3AED);">
                        🤖
                        <span class="course-badge badge badge-premium">Premium</span>
                    </div>
                    <div class="course-content">
                        <h3 class="course-title">Python Full Stack </h3>
                        <p class="course-description">
                            Deep dive into AI algorithms, neural networks, and practical applications.
                        </p>
                        <div class="course-meta">
                            <span class="course-meta-item">📚 30 Lessons</span>
                            <span class="course-meta-item">⏱️ 20 Hours</span>
                        </div>
                        <div class="course-progress">
                            <div class="progress-label">
                                <span>Progress</span>
                                <span>78%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-fill" style="width: 78%;"></div>
                            </div>
                        </div>
                        <div class="course-footer" style=text-align:center;>
                            <a href="${pageContext.request.contextPath}/premium?course=python" class="btn btn-primary">Continue Learning</a>
                            
                        </div>
                    </div>
                </div>
                
                <!-- Course 5 - Free -->
                <div class="course-card" data-type="free">
                    <div class="course-image" style="background: linear-gradient(135deg, #3B82F6, #2563EB);">
                        🔐
                        <span class="course-badge badge badge-free">Free</span>
                    </div>
                    <div class="course-content">
                        <h3 class="course-title">Cybersecurity Basics</h3>
                        <p class="course-description">
                            Learn essential cybersecurity concepts and best practices for online safety.
                        </p>
                        <div class="course-meta">
                            <span class="course-meta-item">📚 10 Lessons</span>
                            <span class="course-meta-item">⏱️ 6 Hours</span>
                        </div>
                        <div class="course-progress">
                            <div class="progress-label">
                                <span>Progress</span>
                                <span>45%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-fill" style="width: 45%;"></div>
                            </div>
                        </div>
                        <div class="course-footer" style=text-align:center;>
                            <a href="${pageContext.request.contextPath}/quiz" class="btn btn-primary">Continue Learning</a>
                        </div>
                    </div>
                </div>
                
                <!-- Course 6 - Premium -->
                <div class="course-card" data-type="premium">
                    <div class="course-image" style="background: linear-gradient(135deg, #EC4899, #DB2777);">
                        📱
                        <span class="course-badge badge badge-premium">Premium</span>
                    </div>
                    <div class="course-content">
                        <h3 class="course-title">C++ Course With DSA</h3>
                        <p class="course-description">
                            Build cross-platform mobile apps using React Native and Flutter.
                        </p>
                        <div class="course-meta">
                            <span class="course-meta-item">📚 18 Lessons</span>
                            <span class="course-meta-item">⏱️ 14 Hours</span>
                        </div>
                        <div class="course-progress">
                            <div class="progress-label">
                                <span>Progress</span>
                                <span>0%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-fill" style="width: 0%;"></div>
                            </div>
                        </div>
                        <div class="course-footer" style=text-align:center;>
                            <a href="${pageContext.request.contextPath}/premium?course=cpp" class="btn btn-primary">Start Course</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />
    
    <!-- JavaScript Files -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
    <script>
function filterCourses(type) {
    const cards = document.querySelectorAll('.course-card');

    cards.forEach(card => {
        if (type === 'all') {
            card.style.display = 'block';
        } 
        else if (card.getAttribute('data-type') === type) {
            card.style.display = 'block';
        } 
        else {
            card.style.display = 'none';
        }
    });
}
</script>

    
</body>
</html>
