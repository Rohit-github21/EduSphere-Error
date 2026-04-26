<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Result Notification - EduSphere</title>
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
        .score-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            border-radius: 16px;
            text-align: center;
            margin: 30px 0;
            box-shadow: 0 10px 40px rgba(102, 126, 234, 0.3);
        }
        .score-title {
            font-size: 1.3rem;
            opacity: 0.9;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .score-value {
            font-size: 5rem;
            font-weight: bold;
            margin: 15px 0;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.2);
        }
        .score-out-of {
            font-size: 1.4rem;
            opacity: 0.85;
            margin-bottom: 20px;
        }
        .score-label {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        .congrats-message {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            margin: 25px 0;
            font-size: 1.2rem;
        }
        .congrats-message.failed {
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
        }
        .result-details {
            background: var(--bg-tertiary);
            padding: 25px;
            border-radius: 8px;
            margin: 20px 0;
        }
        .result-details h4 {
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
        .status-badge {
            display: inline-block;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
        }
        .status-passed {
            background: #10b981;
            color: white;
        }
        .status-failed {
            background: #ef4444;
            color: white;
        }
        .performance-stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin: 30px 0;
        }
        .stat-box {
            background: var(--bg-tertiary);
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }
        .stat-value {
            font-size: 2rem;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 5px;
        }
        .stat-label {
            color: var(--text-secondary);
            font-size: 0.9rem;
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
        .tips-box {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
            border-left: 4px solid #667eea;
            padding: 20px;
            border-radius: 8px;
            margin: 30px 0;
        }
        .tips-box h4 {
            color: #667eea;
            margin-top: 0;
        }
        .tips-box ul {
            margin: 15px 0;
            padding-left: 20px;
            color: var(--text-tertiary);
        }
        .tips-box li {
            margin: 10px 0;
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
            <div class="icon">📊</div>
            <h1>Quiz Result Available!</h1>
            <p>Your performance summary is ready</p>
        </div>
        
        <!-- Email Body -->
        <div class="email-body">
            <div class="greeting">
                Hello <strong>${param.userName != null ? param.userName : 'Student'}</strong>! 👋
            </div>
            
            <div class="message">
                You've completed the <strong>${param.quizName != null ? param.quizName : 'Programming Fundamentals'}</strong> quiz. Here's your detailed performance report.
            </div>
            
            <!-- Score Card -->
            <div class="score-card">
                <div class="score-title">📊 Your Final Score</div>
                <div class="score-value">${param.score != null ? param.score : '85'}%</div>
                <div class="score-out-of">
                    ${param.correctAnswers != null ? param.correctAnswers : '17'} out of ${param.totalQuestions != null ? param.totalQuestions : '20'} Questions Correct
                </div>
                <div class="score-label">
                    <span class="status-badge ${param.score >= 60 ? 'status-passed' : 'status-failed'}">
                        ${param.score >= 60 ? '🏆 PASSED' : '❌ FAILED'}
                    </span>
                </div>
            </div>
            
            <!-- Congratulations / Try Again Message -->
            <div class="congrats-message ${param.score >= 60 ? '' : 'failed'}">
                ${param.score >= 60 
                    ? '🎉 Congratulations! You have successfully passed the quiz. Keep up the excellent work!' 
                    : '💪 Don\\'t give up! Review the material and try again. You can do it!'}
            </div>
            
            <!-- Performance Stats -->
            <div class="performance-stats">
                <div class="stat-box">
                    <div class="stat-value">${param.correctAnswers != null ? param.correctAnswers : '17'}</div>
                    <div class="stat-label">Correct</div>
                </div>
                <div class="stat-box">
                    <div class="stat-value">${param.incorrectAnswers != null ? param.incorrectAnswers : '3'}</div>
                    <div class="stat-label">Incorrect</div>
                </div>
                <div class="stat-box">
                    <div class="stat-value">${param.totalQuestions != null ? param.totalQuestions : '20'}</div>
                    <div class="stat-label">Total</div>
                </div>
            </div>
            
            <!-- Result Details -->
            <div class="result-details">
                <h4>Quiz Details</h4>
                <div class="detail-row">
                    <span class="detail-label">Quiz Name:</span>
                    <span class="detail-value">${param.quizName != null ? param.quizName : 'Programming Fundamentals'}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Date Attempted:</span>
                    <span class="detail-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(new java.util.Date()) %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Time Taken:</span>
                    <span class="detail-value">${param.timeTaken != null ? param.timeTaken : '15 min 30 sec'}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Accuracy:</span>
                    <span class="detail-value">${param.accuracy != null ? param.accuracy : '85'}%</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Status:</span>
                    <span class="status-badge ${param.score >= 60 ? 'status-passed' : 'status-failed'}">
                        ${param.score >= 60 ? 'Passed' : 'Failed'}
                    </span>
                </div>
            </div>
            
            <!-- Tips Box -->
            <div class="tips-box">
                <h4>💡 Tips to Improve</h4>
                <ul>
                    <li>Review the questions you got wrong</li>
                    <li>Practice similar questions daily</li>
                    <li>Read course materials thoroughly</li>
                    <li>Join study groups for better understanding</li>
                    <li>Retake the quiz to improve your score</li>
                </ul>
            </div>
            
            <div style="text-align: center;">
                <a href="${pageContext.request.contextPath}/quiz-result" class="cta-button">
                    View Detailed Report →
                </a>
            </div>
            
            <div class="divider"></div>
            
            <div class="message">
                Keep up the great work! Continue practicing and learning to achieve even better results.
            </div>
        </div>
        
        <!-- Email Footer -->
        <div class="email-footer">
            <h3 style="margin-top: 0;">EduSphere</h3>
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