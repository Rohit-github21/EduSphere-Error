<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - EduSphere</title>
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/auth.css">
</head>
<body>
    <!-- Auth Page -->
    <div class="auth-page">
        <div class="auth-container">
            <!-- Tabs for Student/Admin Login -->
            <div class="auth-tabs">
                <button class="auth-tab active" data-tab="student" onclick="EduSphere.switchTab('student')">
                    Student Login
                </button>
                <button class="auth-tab" data-tab="admin" onclick="EduSphere.switchTab('admin')">
                    Admin Login
                </button>
            </div>
            
            <!-- Student Login Card -->
            <div id="student-tab" class="tab-content active">
                <div class="auth-card">
                    <div class="auth-header">
                        <div class="auth-logo">E</div>
                        <h2>Welcome Back, Student!</h2>
                        <p>Login to continue your learning journey</p>
                        
                           
                    <%
    if (request.getAttribute("msg") != null) {
%>
    <h5 style="color:red;text-align: center;margin-top: 5px">
        <%= request.getAttribute("msg") %>
    </h5>
<%
    }
%>
                        
                    </div>
                    
                    <form id="student-login-form"  action="checkStudent" method="post">
                        <div class="form-group">
                            <label for="student-email" class="form-label">Email Address</label>
                            <input type="email" id="student-email" name="email" class="form-input" placeholder="your@email.com" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="student-password" class="form-label">Password</label>
                            <input type="password" id="student-password" name="password" class="form-input" placeholder="Enter your password" required>
                        </div>
                        
                        <div class="form-group">
                            <div class="checkbox-group">
                                <input type="checkbox" id="student-remember" name="remember">
                                <label for="student-remember">Remember me</label>
                            </div>
                        </div>
                        
                        <div class="forgot-password">
                            <a href="#">Forgot Password?</a>
                        </div>
                        
                        <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">
                            Login as Student
                        </button>
                    </form>
                    
                    <div class="form-footer">
                        <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register Now</a></p>
                    </div>
                </div>
            </div>
            
            
                                <%
    if (request.getAttribute("msg1") != null) {
%>
    <h3 style="color:red;text-align: center;margin-top: 5px">
        <%= request.getAttribute("msg1") %>
    </h3>
<%
    }
%>
            
            <!-- Admin Login Card -->
            <div id="admin-tab" class="tab-content">
                <div class="auth-card">
                    <div class="auth-header">
                        <div class="auth-logo" style="background: linear-gradient(135deg, #10B981, #059669);">A</div>
                        <h2>Admin Access</h2>
                        <p>Login to manage the platform</p>
                    </div>
                    
                    <form id="admin-login-form"  action="checkAdmin" method="post">
                        <div class="form-group">
                            <label for="admin-email" class="form-label">Admin Email</label>
                            <input type="email" id="admin-email" name="email" class="form-input" placeholder="admin@edusphere.com" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="admin-password" class="form-label">Password</label>
                            <input type="password" id="admin-password" name="password" class="form-input" placeholder="Enter admin password" required>
                        </div>
                        
                        <div class="form-group">
                            <div class="checkbox-group">
                                <input type="checkbox" id="admin-remember" name="remember">
                                <label for="admin-remember">Remember me</label>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1.5rem;">
                            Login as Admin
                        </button>
                    </form>
                    
                    <div class="form-footer">
                        <p style="color: var(--text-tertiary); font-size: 0.85rem;">
                            🔒 This is a secure admin area
                        </p>
                    </div>
                </div>
            </div>
            
            <!-- Back to Home Link -->
            <div style="text-align: center; margin-top: 1.5rem;">
                <a href="${pageContext.request.contextPath}/home" style="color: var(--text-tertiary); font-size: 0.9rem;">
                    ← Back to Home
                </a>
            </div>
        </div>
    </div>
    
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
