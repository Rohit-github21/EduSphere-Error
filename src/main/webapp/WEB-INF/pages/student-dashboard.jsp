<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <% String name = (String)request.getAttribute("student"); %> --%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - EduSphere</title>
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />
    
    <!-- Student Dashboard -->
    <main class="dashboard-container">
        <div class="container">
            <!-- Dashboard Header -->
            <div class="dashboard-header">
                <div class="dashboard-welcome">
                    <div class="welcome-text">
                        <h1>Welcome back, ${loggedInStudent.first} 👋</h1>

                        <p>Here's your learning progress and achievements</p>
                    </div>
                    <button onclick="window.location.href='${pageContext.request.contextPath}/profile'"  class="welcome-badge">
    Student
</button>
                </div>
            </div>
            
            <!-- Stats Grid -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-card-header">
                        <div class="stat-icon stat-icon-primary">📝</div>
                    </div>
                    <div class="stat-value">24</div>
                    <div class="stat-label">Registered Quizzes</div>
                    <div class="stat-change positive">↑ 3 new this week</div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-card-header">
                        <div class="stat-icon stat-icon-success">✓</div>
                    </div>
                    <div class="stat-value">156</div>
                    <div class="stat-label">Attempted Quizzes</div>
                    <div class="stat-change positive">↑ 12% from last month</div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-card-header">
                        <div class="stat-icon stat-icon-warning">⭐</div>
                    </div>
                    <div class="stat-value">87%</div>
                    <div class="stat-label">Average Score</div>
                    <div class="stat-change positive">↑ 5% improvement</div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-card-header">
                        <div class="stat-icon stat-icon-info">💎</div>
                    </div>
                    <div class="stat-value">Premium</div>
                    <div class="stat-label">Subscription Status</div>
                    <div class="stat-change" style="color: var(--text-tertiary);">Active until Dec 2026</div>
                </div>
            </div>
            
            <!-- Dashboard Grid -->
            <div class="dashboard-grid">
                <!-- Recent Activity -->
                <div class="dashboard-section">
                    <div class="section-header">
                        <h3 class="section-title">Recent Quizzes</h3>
                        <a href="${pageContext.request.contextPath}/quiz" class="section-action">View All →</a>
                    </div>
                    <div class="activity-list">
                        <div class="activity-item">
                            <div class="activity-icon">📝</div>
                            <div class="activity-content">
                                <div class="activity-title">Advanced JavaScript Quiz</div>
                                <div class="activity-description">Score: 92% • 18/20 correct</div>
                                <div class="activity-time">2 hours ago</div>
                            </div>
                        </div>
                        <div class="activity-item">
                            <div class="activity-icon" style="background: var(--emerald);">📝</div>
                            <div class="activity-content">
                                <div class="activity-title">Data Structures Fundamentals</div>
                                <div class="activity-description">Score: 85% • 17/20 correct</div>
                                <div class="activity-time">1 day ago</div>
                            </div>
                        </div>
                        <div class="activity-item">
                            <div class="activity-icon" style="background: #F59E0B;">📝</div>
                            <div class="activity-content">
                                <div class="activity-title">Web Development Basics</div>
                                <div class="activity-description">Score: 95% • 19/20 correct</div>
                                <div class="activity-time">3 days ago</div>
                            </div>
                        </div>
                        <div class="activity-item">
                            <div class="activity-icon" style="background: #8B5CF6;">📝</div>
                            <div class="activity-content">
                                <div class="activity-title">Python Programming</div>
                                <div class="activity-description">Score: 88% • 22/25 correct</div>
                                <div class="activity-time">5 days ago</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Quick Actions -->
                <div class="dashboard-section">
                    <div class="section-header">
                        <h3 class="section-title">Quick Actions</h3>
                    </div>
                    <div class="quick-actions">
                        <a href="${pageContext.request.contextPath}/quiz" class="quick-action-btn">
                            <div class="quick-action-icon">📝</div>
                            <div class="quick-action-content">
                                <h4>Take Quiz</h4>
                                <p>Start a new quiz</p>
                            </div>
                        </a>
                        <a href="${pageContext.request.contextPath}/student-dashboard" class="quick-action-btn">
                            <div class="quick-action-icon" style="background: linear-gradient(135deg, #10B981, #059669);">📊</div>
                            <div class="quick-action-content">
                                <h4>Quiz History</h4>
                                <p>View past results</p>
                            </div>
                        </a>
                        <a href="${pageContext.request.contextPath}/courses" class="quick-action-btn">
                            <div class="quick-action-icon" style="background: linear-gradient(135deg, #F59E0B, #D97706);">📚</div>
                            <div class="quick-action-content">
                                <h4>My Courses</h4>
                                <p>Continue learning</p>
                            </div>
                        </a>
                        <a href="${pageContext.request.contextPath}/questionnaire" class="quick-action-btn">
                            <div class="quick-action-icon" style="background: linear-gradient(135deg, #8B5CF6, #7C3AED);">📋</div>
                            <div class="quick-action-content">
                                <h4>Questionnaire</h4>
                                <p>Complete assessment</p>
                            </div>
                        </a>
                        <a href="${pageContext.request.contextPath}/profile" class="quick-action-btn">
                            <div class="quick-action-icon" style="background: linear-gradient(135deg, #EC4899, #DB2777);">👤</div>
                            <div class="quick-action-content">
                                <h4>Profile</h4>
                                <p>Update your info</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Performance Analysis -->
            <div class="dashboard-section" style="margin-top: 2rem;">
                <div class="section-header">
                    <h3 class="section-title">Performance Analysis</h3>
                    <span class="section-action">Last 30 days</span>
                </div>
                <div class="grid grid-3">
                    <div class="glass-card text-center">
                        <h4 style="color: var(--text-primary); margin-bottom: 1rem;">Subject Breakdown</h4>
                        <div style="margin: 1.5rem 0;">
                            <div style="margin-bottom: 1rem;">
                                <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem; font-size: 0.9rem;">
                                    <span>JavaScript</span>
                                    <span style="font-weight: 600;">92%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: 92%;"></div>
                                </div>
                            </div>
                            <div style="margin-bottom: 1rem;">
                                <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem; font-size: 0.9rem;">
                                    <span>Python</span>
                                    <span style="font-weight: 600;">88%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: 88%;"></div>
                                </div>
                            </div>
                            <div>
                                <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem; font-size: 0.9rem;">
                                    <span>Data Structures</span>
                                    <span style="font-weight: 600;">85%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: 85%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="glass-card text-center">
                        <h4 style="color: var(--text-primary); margin-bottom: 1rem;">Achievements</h4>
                        <div style="display: flex; flex-direction: column; gap: 0.75rem; margin-top: 1.5rem;">
                            <div style="display: flex; align-items: center; gap: 0.75rem; padding: 0.75rem; background: var(--bg-secondary); border-radius: 8px;">
                                <span style="font-size: 1.5rem;">🏆</span>
                                <div style="text-align: left; flex: 1;">
                                    <div style="font-size: 0.85rem; font-weight: 600; color: var(--text-primary);">Quiz Master</div>
                                    <div style="font-size: 0.75rem; color: var(--text-tertiary);">50+ quizzes completed</div>
                                </div>
                            </div>
                            <div style="display: flex; align-items: center; gap: 0.75rem; padding: 0.75rem; background: var(--bg-secondary); border-radius: 8px;">
                                <span style="font-size: 1.5rem;">⭐</span>
                                <div style="text-align: left; flex: 1;">
                                    <div style="font-size: 0.85rem; font-weight: 600; color: var(--text-primary);">High Scorer</div>
                                    <div style="font-size: 0.75rem; color: var(--text-tertiary);">Average 85%+</div>
                                </div>
                            </div>
                            <div style="display: flex; align-items: center; gap: 0.75rem; padding: 0.75rem; background: var(--bg-secondary); border-radius: 8px;">
                                <span style="font-size: 1.5rem;">🔥</span>
                                <div style="text-align: left; flex: 1;">
                                    <div style="font-size: 0.85rem; font-weight: 600; color: var(--text-primary);">7-Day Streak</div>
                                    <div style="font-size: 0.75rem; color: var(--text-tertiary);">Keep it up!</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="glass-card text-center">
                        <h4 style="color: var(--text-primary); margin-bottom: 1rem;">Study Time</h4>
                        <div style="margin: 1.5rem 0;">
                            <div style="font-size: 3rem; font-weight: 700; background: linear-gradient(135deg, var(--accent-primary), var(--accent-secondary)); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">24h</div>
                            <div style="font-size: 0.9rem; color: var(--text-tertiary); margin-bottom: 1.5rem;">This month</div>
                            <div style="font-size: 0.85rem; color: var(--emerald); display: flex; align-items: center; justify-content: center; gap: 0.25rem;">
                                <span>↑</span>
                                <span>15% more than last month</span>
                            </div>
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
</body>
</html>
