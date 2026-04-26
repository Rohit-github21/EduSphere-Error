<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscription Confirmation - EduSphere</title>
    <style>
        :root {
            --bg-primary: #f4f4f4;
            --bg-secondary: #ffffff;
            --bg-tertiary: #f8f9fa;
            --text-primary: #333333;
            --text-secondary: #666666;
            --text-tertiary: #555555;
            --border-color: #e5e7eb;
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
        .email-header .icon {
            font-size: 4rem;
            margin-bottom: 15px;
        }
        .email-header h1 {
            margin: 0;
            font-size: 2rem;
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
        .subscription-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            margin: 30px 0;
        }
        .plan-name {
            font-size: 2.5rem;
            font-weight: bold;
            margin: 10px 0;
        }
        .plan-price {
            font-size: 1.5rem;
            opacity: 0.9;
            margin-bottom: 10px;
        }
        .subscription-details {
            background: var(--bg-tertiary);
            padding: 25px;
            border-radius: 8px;
            margin: 20px 0;
        }
        .subscription-details h4 {
            margin-top: 0;
            color: var(--text-primary);
            font-size: 1.3rem;
        }
        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid var(--border-color);
        }
        .detail-row:last-child {
            border-bottom: none;
        }
        .detail-label {
            color: var(--text-secondary);
            font-weight: 500;
        }
        .detail-value {
            color: var(--text-primary);
            font-weight: 600;
        }
        .features-box {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
            border-left: 4px solid #667eea;
            padding: 20px;
            border-radius: 8px;
            margin: 30px 0;
        }
        .features-box h4 {
            color: #667eea;
            margin-top: 0;
        }
        .features-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-top: 15px;
        }
        .feature-item {
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--text-tertiary);
            font-size: 0.95rem;
        }
        .feature-icon {
            color: #10b981;
            font-weight: bold;
            font-size: 1.1rem;
        }
        .invoice-box {
            background: var(--bg-tertiary);
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
        }
        .invoice-box h4 {
            margin-top: 0;
            color: var(--text-primary);
        }
        .invoice-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            color: var(--text-secondary);
        }
        .invoice-total {
            display: flex;
            justify-content: space-between;
            padding: 15px 0;
            border-top: 2px solid var(--border-color);
            font-size: 1.3rem;
            font-weight: bold;
            color: var(--text-primary);
            margin-top: 10px;
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
        .email-footer {
            background: #f8f9fa;
            padding: 30px;
            text-align: center;
            color: #666;
            font-size: 0.9rem;
        }
        .divider {
            height: 1px;
            background: linear-gradient(to right, transparent, #ddd, transparent);
            margin: 30px 0;
        }
        .guarantee-badge {
            background: #10b981;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            text-align: center;
            margin: 20px 0;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <!-- Email Header -->
        <div class="email-header">
            <div class="icon">🎉</div>
            <h1>Subscription Confirmed!</h1>
            <p>Welcome to Premium Learning</p>
        </div>
        
        <!-- Email Body -->
        <div class="email-body">
            <div class="greeting">
                Hello <strong>${param.userName != null ? param.userName : 'Student'}</strong>! 👋
            </div>
            
            <div class="message">
                Thank you for upgrading to <strong>EduSphere ${param.planName != null ? param.planName : 'Premium'}</strong>! Your payment has been successfully processed and your premium features are now active.
            </div>
            
            <!-- Subscription Card -->
            <div class="subscription-card">
                <div style="font-size: 1.2rem; opacity: 0.9;">You're now on</div>
                <div class="plan-name">${param.planName != null ? param.planName : 'Premium'} Plan</div>
                <div class="plan-price">${param.amount != null ? param.amount : '$47.82'}/month</div>
            </div>
            
            <!-- Subscription Details -->
            <div class="subscription-details">
                <h4>Subscription Details</h4>
                <div class="detail-row">
                    <span class="detail-label">Transaction ID:</span>
                    <span class="detail-value">#TXN${System.currentTimeMillis()}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Plan:</span>
                    <span class="detail-value">${param.planName != null ? param.planName : 'Premium'} Plan</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Start Date:</span>
                    <span class="detail-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(new java.util.Date()) %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Next Billing:</span>
                    <span class="detail-value">
                        <%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(
                            new java.util.Date(System.currentTimeMillis() + 30L * 24 * 60 * 60 * 1000)
                        ) %>
                    </span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Status:</span>
                    <span class="detail-value" style="color: #10b981;">Active</span>
                </div>
            </div>
            
            <!-- Invoice -->
            <div class="invoice-box">
                <h4>Payment Summary</h4>
                <div class="invoice-row">
                    <span>Subscription Fee</span>
                    <span>${param.baseAmount != null ? param.baseAmount : '$49.00'}</span>
                </div>
                <div class="invoice-row">
                    <span>Tax (18%)</span>
                    <span>${param.tax != null ? param.tax : '$8.82'}</span>
                </div>
                <div class="invoice-row" style="color: #10b981;">
                    <span>First Month Discount</span>
                    <span>${param.discount != null ? param.discount : '-$10.00'}</span>
                </div>
                <div class="invoice-total">
                    <span>Total Paid</span>
                    <span style="color: #667eea;">${param.amount != null ? param.amount : '$47.82'}</span>
                </div>
            </div>
            
            <!-- Features Box -->
            <div class="features-box">
                <h4>🚀 Your Premium Features</h4>
                <div class="features-grid">
                    <div class="feature-item">
                        <span class="feature-icon">✓</span>
                        <span>Unlimited Course Access</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-icon">✓</span>
                        <span>All Quiz Attempts</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-icon">✓</span>
                        <span>Certificates</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-icon">✓</span>
                        <span>Download Resources</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-icon">✓</span>
                        <span>Priority Support</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-icon">✓</span>
                        <span>Progress Analytics</span>
                    </div>
                </div>
            </div>
            
            <div class="guarantee-badge">
                🛡️ 30-Day Money Back Guarantee
            </div>
            
            <div style="text-align: center;">
                <a href="${pageContext.request.contextPath}/student-dashboard" class="cta-button">
                    Start Learning Now →
                </a>
            </div>
            
            <div class="divider"></div>
            
            <div class="message">
                Your subscription will automatically renew on 
                <%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(
                    new java.util.Date(System.currentTimeMillis() + 30L * 24 * 60 * 60 * 1000)
                ) %>. 
                You can manage or cancel your subscription anytime from your account settings.
            </div>
            
            <div class="message" style="font-size: 0.9rem; color: #999;">
                A detailed invoice has been sent to your registered email address. If you have any questions, please contact us at <a href="mailto:billing@edusphere.com" style="color: #667eea;">billing@edusphere.com</a>
            </div>
        </div>
        
        <!-- Email Footer -->
        <div class="email-footer" style="background: var(--bg-tertiary); color: var(--text-secondary);">
            <h3 style="color: var(--text-primary); margin-top: 0;">EduSphere</h3>
            <p>Empowering minds, one lesson at a time</p>
            <p>© 2026 EduSphere. All rights reserved.</p>
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
        
        document.addEventListener('DOMContentLoaded', function() {
            const savedTheme = localStorage.getItem('emailTheme') || 'light';
            document.documentElement.setAttribute('data-theme', savedTheme);
            updateThemeIcon(savedTheme);
        });
    </script>
</body>
</html>