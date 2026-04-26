<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Confirmation - EduSphere</title>
    <style>
        :root {
            --bg-primary: #f4f4f4;
            --bg-secondary: #ffffff;
            --bg-tertiary: #f8f9fa;
            --text-primary: #333333;
            --text-secondary: #666666;
            --text-tertiary: #555555;
            --border-color: #e5e7eb;
            --accent-primary: #667eea;
            --accent-secondary: #764ba2;
        }
        
        [data-theme="dark"] {
            --bg-primary: #0f172a;
            --bg-secondary: #1e293b;
            --bg-tertiary: #334155;
            --text-primary: #f1f5f9;
            --text-secondary: #cbd5e1;
            --text-tertiary: #94a3b8;
            --border-color: #475569;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: var(--bg-primary);
            margin: 0;
            padding: 0;
            transition: all 0.3s ease;
        }
        
        .theme-toggle {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--bg-secondary);
            border: 2px solid var(--border-color);
            padding: 10px 15px;
            border-radius: 50px;
            cursor: pointer;
            font-size: 1.2rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            z-index: 1000;
            transition: all 0.3s ease;
        }
        
        .theme-toggle:hover {
            transform: scale(1.1);
        }
        
        .email-container {
            max-width: 600px;
            margin: 40px auto;
            background: var(--bg-secondary);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .email-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 30px;
            text-align: center;
        }
        .email-header h1 {
            margin: 0;
            font-size: 2rem;
        }
        .email-header .icon {
            font-size: 4rem;
            margin-bottom: 15px;
        }
        .email-body {
            padding: 40px 30px;
            background: var(--bg-secondary);
        }
        .greeting {
            font-size: 1.2rem;
            color: var(--text-primary);
            margin-bottom: 20px;
        }
        .message {
            color: var(--text-secondary);
            line-height: 1.8;
            font-size: 1rem;
            margin-bottom: 30px;
        }
        .welcome-box {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
            border-left: 4px solid #667eea;
            padding: 20px;
            border-radius: 8px;
            margin: 30px 0;
        }
        .welcome-box h3 {
            color: #667eea;
            margin-top: 0;
            font-size: 1.3rem;
        }
        .welcome-box ul {
            margin: 15px 0;
            padding-left: 20px;
            color: var(--text-tertiary);
        }
        .welcome-box li {
            margin: 10px 0;
        }
        .cta-button {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 40px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 1.1rem;
            margin: 20px 0;
        }
        .cta-button:hover {
            opacity: 0.9;
        }
        .account-details {
            background: var(--bg-tertiary);
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
        }
        .account-details h4 {
            margin-top: 0;
            color: var(--text-primary);
        }
        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-secondary);
        }
        .detail-row:last-child {
            border-bottom: none;
        }
        .credentials-box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 25px;
            border-radius: 12px;
            margin: 25px 0;
            text-align: center;
        }
        .credentials-box h4 {
            margin-top: 0;
            font-size: 1.3rem;
            margin-bottom: 20px;
        }
        .credential-item {
            background: rgba(255, 255, 255, 0.15);
            padding: 15px 20px;
            border-radius: 8px;
            margin: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .credential-label {
            font-weight: 500;
            opacity: 0.9;
        }
        .credential-value {
            font-weight: 700;
            font-size: 1.1rem;
            background: rgba(255, 255, 255, 0.2);
            padding: 8px 15px;
            border-radius: 6px;
            font-family: monospace;
        }
        .security-note {
            background: rgba(255, 243, 205, 0.9);
            border-left: 4px solid #ffc107;
            padding: 15px 20px;
            border-radius: 8px;
            margin: 20px 0;
            color: #856404;
            font-size: 0.95rem;
        }
        
        [data-theme="dark"] .security-note {
            background: rgba(255, 193, 7, 0.15);
            color: #ffc107;
        }
        
        .success-badge {
            background: #10b981;
            color: white;
            padding: 12px 25px;
            border-radius: 25px;
            display: inline-block;
            font-weight: 600;
            font-size: 1rem;
            margin: 15px 0;
        }
        .email-footer {
            background: var(--bg-tertiary);
            padding: 30px;
            text-align: center;
            color: var(--text-secondary);
            font-size: 0.9rem;
        }
        .email-footer h3 {
            color: var(--text-primary);
        }
        .social-links {
            margin: 20px 0;
        }
        .social-links a {
            display: inline-block;
            margin: 0 10px;
            color: #667eea;
            text-decoration: none;
        }
        .divider {
            height: 1px;
            background: linear-gradient(to right, transparent, #ddd, transparent);
            margin: 30px 0;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <!-- Email Header -->
        <div class="email-header">
            <div class="icon">🎓</div>
            <h1>Welcome to EduSphere!</h1>
            <p>Your learning journey begins here</p>
        </div>
        
        <!-- Email Body -->
        <div class="email-body">
            <div class="greeting">
                Hello <strong>${param.userName != null ? param.userName : 'Student'}</strong>! 👋
            </div>
            
            <div class="message">
                🎉 <strong>Congratulations!</strong> Your account has been successfully created on <strong>EduSphere</strong>! 
                We're absolutely thrilled to welcome you to our community of passionate learners from around the world.
                Your educational journey starts now - get ready to unlock your full potential!
            </div>
            
            <div style="text-align: center;">
                <span class="success-badge">✓ Registration Successful</span>
            </div>
            
            <!-- Login Credentials Box -->
            <div class="credentials-box">
                <h4>🔐 Your Login Credentials</h4>
                <div class="credential-item">
                    <span class="credential-label">👤 Username:</span>
                    <span class="credential-value">${param.userName != null ? param.userName : 'john_doe'}</span>
                </div>
                <div class="credential-item">
                    <span class="credential-label">📧 Email:</span>
                    <span class="credential-value">${param.email != null ? param.email : 'student@example.com'}</span>
                </div>
                <div class="credential-item">
                    <span class="credential-label">🔑 Password:</span>
                    <span class="credential-value">${param.password != null ? param.password : '********'}</span>
                </div>
            </div>
            
            <!-- Security Note -->
            <div class="security-note">
                <strong>⚠️ Security Reminder:</strong> Please keep your login credentials safe and do not share them with anyone. 
                We recommend changing your password after your first login for enhanced security.
            </div>
            
            <!-- Account Details -->
            <div class="account-details">
                <h4>📋 Account Information</h4>
                <div class="detail-row">
                    <span><strong>Full Name:</strong></span>
                    <span>${param.fullName != null ? param.fullName : 'John Doe'}</span>
                </div>
                <div class="detail-row">
                    <span><strong>Email:</strong></span>
                    <span>${param.email != null ? param.email : 'student@example.com'}</span>
                </div>
                <div class="detail-row">
                    <span><strong>Registration Date:</strong></span>
                    <span><%= new java.text.SimpleDateFormat("EEEE, MMM dd, yyyy 'at' hh:mm a").format(new java.util.Date()) %></span>
                </div>
                <div class="detail-row">
                    <span><strong>Account Type:</strong></span>
                    <span style="color: #667eea; font-weight: 600;">Free Plan</span>
                </div>
                <div class="detail-row">
                    <span><strong>Account Status:</strong></span>
                    <span style="color: #10b981; font-weight: 600;">✓ Active</span>
                </div>
            </div>
            
            <!-- Welcome Box -->
            <div class="welcome-box">
                <h3>What's Next?</h3>
                <ul>
                    <li>✓ Complete your profile to personalize your experience</li>
                    <li>✓ Browse our extensive course catalog</li>
                    <li>✓ Take your first quiz to test your knowledge</li>
                    <li>✓ Upgrade to Premium for unlimited access</li>
                    <li>✓ Join our community forum and connect with peers</li>
                </ul>
            </div>
            
            <div style="text-align: center;">
                <a href="${pageContext.request.contextPath}/student-dashboard" class="cta-button">
                    Get Started Now →
                </a>
            </div>
            
            <div class="divider"></div>
            
            <div class="message">
                If you have any questions or need assistance, our support team is always here to help. Feel free to reach out to us at <a href="mailto:support@edusphere.com" style="color: #667eea;">support@edusphere.com</a>
            </div>
            
            <div class="message" style="font-size: 0.9rem; color: #999;">
                <strong>Note:</strong> If you didn't create this account, please ignore this email or contact our support team immediately.
            </div>
        </div>
        
        <!-- Email Footer -->
        <div class="email-footer">
            <h3 style="color: #333; margin-top: 0;">EduSphere</h3>
            <p>Empowering minds, one lesson at a time</p>
            
            <div class="social-links">
                <a href="#">Facebook</a> | 
                <a href="#">Twitter</a> | 
                <a href="#">LinkedIn</a> | 
                <a href="#">Instagram</a>
            </div>
            
            <p>© 2026 EduSphere. All rights reserved.</p>
            <p style="font-size: 0.8rem; color: var(--text-tertiary);">
                123 Education Street, Learning City, LC 12345
            </p>
        </div>
    </div>
    
    <!-- Theme Toggle Button -->
    <button class="theme-toggle" onclick="toggleTheme()" title="Toggle Dark/Light Mode">
        <span id="theme-icon">🌙</span>
    </button>
    
    <script>
        function toggleTheme() {
            const html = document.documentElement;
            const currentTheme = html.getAttribute('data-theme');
            const newTheme = currentTheme === 'light' ? 'dark' : 'light';
            html.setAttribute('data-theme', newTheme);
            localStorage.setItem('emailTheme', newTheme);
            updateThemeIcon(newTheme);
        }
        
        function updateThemeIcon(theme) {
            const icon = document.getElementById('theme-icon');
            icon.textContent = theme === 'light' ? '🌙' : '☀️';
        }
        
        // Load saved theme on page load
        document.addEventListener('DOMContentLoaded', function() {
            const savedTheme = localStorage.getItem('emailTheme') || 'light';
            document.documentElement.setAttribute('data-theme', savedTheme);
            updateThemeIcon(savedTheme);
        });
    </script>
</body>
</html>