/**
 * EduSphere - Main JavaScript
 * Premium E-Learning Platform UI
 */

// ========================================
// Global Variables
// ========================================
let currentTheme = localStorage.getItem('theme') || 'light';
let currentUser = JSON.parse(localStorage.getItem('currentUser')) || null;

// ========================================
// Theme Management
// ========================================
function initTheme() {
    document.documentElement.setAttribute('data-theme', currentTheme);
    updateThemeIcon();
}

function toggleTheme() {
    currentTheme = currentTheme === 'light' ? 'dark' : 'light';
    document.documentElement.setAttribute('data-theme', currentTheme);
    localStorage.setItem('theme', currentTheme);
    updateThemeIcon();
}

function updateThemeIcon() {
    const themeIcon = document.getElementById('theme-icon');
    if (themeIcon) {
        themeIcon.textContent = currentTheme === 'light' ? '🌙' : '☀️';
    }
}

// ========================================
// Navigation Management
// ========================================
function updateNavigation() {
    const isLoggedIn = currentUser !== null;
    
    // Before Login elements (Login & Register buttons)
    const navBeforeLogin = document.getElementById('nav-before-login');
    if (navBeforeLogin) {
        navBeforeLogin.style.display = isLoggedIn ? 'none' : 'flex';
    }
    
    // After Login elements (Profile & Logout)
    const navAfterLogin = document.getElementById('nav-after-login');
    if (navAfterLogin) {
        navAfterLogin.style.display = isLoggedIn ? 'flex' : 'none';
    }
    
    // After Login menu items (My Courses, Dashboard)
    const afterLoginItems = document.querySelectorAll('.nav-after-login');
    afterLoginItems.forEach(item => {
        item.style.display = isLoggedIn ? 'block' : 'none';
    });
    
    // Admin only items
    const adminItems = document.querySelectorAll('.nav-admin-only');
    adminItems.forEach(item => {
        item.style.display = (isLoggedIn && currentUser.role === 'admin') ? 'block' : 'none';
    });
    
    // Update user avatar with first letter of name
    const userAvatar = document.getElementById('user-avatar');
    if (userAvatar && currentUser) {
        userAvatar.textContent = currentUser.name.charAt(0).toUpperCase();
    }
}

// ========================================
// Mobile Menu Toggle
// ========================================
function initMobileMenu() {
    const menuToggle = document.getElementById('mobile-menu-toggle');
    const navMenu = document.getElementById('navbar-menu');
    
    if (menuToggle && navMenu) {
        menuToggle.addEventListener('click', () => {
            menuToggle.classList.toggle('active');
            navMenu.classList.toggle('active');
        });
    }
}

// ========================================
// Form Validation
// ========================================
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function validateForm(formId) {
    const form = document.getElementById(formId);
    if (!form) return false;
    
    let isValid = true;
    const inputs = form.querySelectorAll('input[required], textarea[required]');
    
    inputs.forEach(input => {
        if (!input.value.trim()) {
            showError(input, 'This field is required');
            isValid = false;
        } else if (input.type === 'email' && !validateEmail(input.value)) {
            showError(input, 'Please enter a valid email');
            isValid = false;
        } else {
            clearError(input);
        }
    });
    
    return isValid;
}

function showError(input, message) {
    clearError(input);
    const errorDiv = document.createElement('div');
    errorDiv.className = 'error-message';
    errorDiv.style.color = '#EF4444';
    errorDiv.style.fontSize = '0.85rem';
    errorDiv.style.marginTop = '0.25rem';
    errorDiv.textContent = message;
    input.parentElement.appendChild(errorDiv);
    input.style.borderColor = '#EF4444';
}

function clearError(input) {
    const errorDiv = input.parentElement.querySelector('.error-message');
    if (errorDiv) {
        errorDiv.remove();
    }
    input.style.borderColor = '';
}

// ========================================
// Authentication (UI Only)
// ========================================
function handleLogin(event, role) {
    event.preventDefault();
    const form = event.target;
    
    if (!validateForm(form.id)) {
        return false;
    }
    
    const email = form.querySelector('input[type="email"]').value;
    const name = email.split('@')[0];
    
    currentUser = {
        name: name,
        email: email,
        role: role
    };
    
    localStorage.setItem('currentUser', JSON.stringify(currentUser));
    
    // Redirect based on role
    if (role === 'admin') {
        window.location.href = 'admin-dashboard.jsp';
    } else {
        window.location.href = 'student-dashboard.jsp';
    }
    
    return false;
}

function handleRegister(event) {
    event.preventDefault();
    const form = event.target;
    
    if (!validateForm(form.id)) {
        return false;
    }
    
    const name = form.querySelector('input[name="name"]').value;
    const email = form.querySelector('input[name="email"]').value;
    
    currentUser = {
        name: name,
        email: email,
        role: 'student'
    };
    
    localStorage.setItem('currentUser', JSON.stringify(currentUser));
    window.location.href = 'student-dashboard.jsp';
    
    return false;
}

function handleLogout() {
    currentUser = null;
    localStorage.removeItem('currentUser');
    window.location.href = 'home.jsp';
}

// ========================================
// Tab Switching (Login Page)
// ========================================
function switchTab(tabName) {
    const tabs = document.querySelectorAll('.auth-tab');
    const contents = document.querySelectorAll('.tab-content');
    
    tabs.forEach(tab => tab.classList.remove('active'));
    contents.forEach(content => content.classList.remove('active'));
    
    const activeTab = document.querySelector(`[data-tab="${tabName}"]`);
    const activeContent = document.getElementById(`${tabName}-tab`);
    
    if (activeTab) activeTab.classList.add('active');
    if (activeContent) activeContent.classList.add('active');
}

// ========================================
// Password Strength Indicator (Optional)
// ========================================
function checkPasswordStrength(password) {
    const strengthBar = document.getElementById('strength-bar');
    if (!strengthBar) return;
    
    let strength = 0;
    if (password.length >= 6) strength++;
    if (password.length >= 10) strength++;
    if (/[a-zA-Z]/.test(password) && /\d/.test(password)) strength++;
    
    strengthBar.className = 'strength-bar';
    
    if (strength === 1) {
        strengthBar.classList.add('strength-weak');
    } else if (strength === 2) {
        strengthBar.classList.add('strength-medium');
    } else if (strength >= 3) {
        strengthBar.classList.add('strength-strong');
    }
}

// ========================================
// Course Filter
// ========================================
function filterCourses(type) {
    const filterBtns = document.querySelectorAll('.filter-btn');
    const courseCards = document.querySelectorAll('.course-card');
    
    filterBtns.forEach(btn => btn.classList.remove('active'));
    event.target.classList.add('active');
    
    courseCards.forEach(card => {
        if (type === 'all' || card.dataset.type === type) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
}

// ========================================
// Quiz Timer (UI Only)
// ========================================
let quizTimer = null;
let timeRemaining = 1800; // 30 minutes in seconds

function startQuizTimer() {
    const timerDisplay = document.getElementById('quiz-timer');
    if (!timerDisplay) return;
    
    quizTimer = setInterval(() => {
        timeRemaining--;
        
        const minutes = Math.floor(timeRemaining / 60);
        const seconds = timeRemaining % 60;
        
        timerDisplay.textContent = 
            `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
        
        if (timeRemaining <= 300) {
            timerDisplay.classList.add('warning');
        }
        
        if (timeRemaining <= 60) {
            timerDisplay.classList.add('danger');
        }
        
        if (timeRemaining <= 0) {
            clearInterval(quizTimer);
            submitQuiz();
        }
    }, 1000);
}

function stopQuizTimer() {
    if (quizTimer) {
        clearInterval(quizTimer);
    }
}

// ========================================
// Quiz Navigation
// ========================================
let currentQuestion = 0;
let answers = {};

function navigateQuestion(questionIndex) {
    const questions = document.querySelectorAll('.question-card');
    const navBtns = document.querySelectorAll('.question-number-btn');
    
    questions.forEach((q, i) => {
        q.style.display = i === questionIndex ? 'block' : 'none';
    });
    
    navBtns.forEach((btn, i) => {
        btn.classList.remove('active');
        if (i === questionIndex) {
            btn.classList.add('active');
        }
    });
    
    currentQuestion = questionIndex;
}

function nextQuestion() {
    const totalQuestions = document.querySelectorAll('.question-card').length;
    if (currentQuestion < totalQuestions - 1) {
        navigateQuestion(currentQuestion + 1);
    }
}

function previousQuestion() {
    if (currentQuestion > 0) {
        navigateQuestion(currentQuestion - 1);
    }
}

function saveAnswer(questionId, answer) {
    answers[questionId] = answer;
    
    // Update navigation button
    const navBtn = document.querySelector(`[data-question="${questionId}"]`);
    if (navBtn) {
        navBtn.classList.add('answered');
    }
}

function submitQuiz() {
    stopQuizTimer();
    
    // Calculate score (UI only - using random data)
    const totalQuestions = Object.keys(answers).length;
    const correctAnswers = Math.floor(Math.random() * totalQuestions);
    const score = ((correctAnswers / totalQuestions) * 100).toFixed(2);
    
    // Store result
    const result = {
        score: score,
        totalQuestions: totalQuestions,
        correctAnswers: correctAnswers,
        date: new Date().toISOString()
    };
    
    localStorage.setItem('lastQuizResult', JSON.stringify(result));
    window.location.href = 'quiz-result.jsp';
}

// ========================================
// Form Submission Handlers
// ========================================
function handleContactForm(event, formType) {
    event.preventDefault();
    const form = event.target;
    
    if (!validateForm(form.id)) {
        return false;
    }
    
    // Show success message
    const successMsg = document.createElement('div');
    successMsg.className = 'message message-success';
    successMsg.textContent = `Your ${formType} has been submitted successfully!`;
    form.insertBefore(successMsg, form.firstChild);
    
    // Clear form
    form.reset();
    
    // Remove message after 3 seconds
    setTimeout(() => {
        successMsg.remove();
    }, 3000);
    
    return false;
}

// ========================================
// Smooth Scroll
// ========================================
function smoothScroll(target) {
    const element = document.querySelector(target);
    if (element) {
        element.scrollIntoView({
            behavior: 'smooth',
            block: 'start'
        });
    }
}

// ========================================
// Active Page Highlight
// ========================================
function highlightActivePage() {
    const currentPage = window.location.pathname.split('/').pop();
    const navLinks = document.querySelectorAll('.navbar-link');
    
    navLinks.forEach(link => {
        const href = link.getAttribute('href');
        if (href === currentPage) {
            link.classList.add('active');
        }
    });
}

// ========================================
// Initialize on Page Load
// ========================================
document.addEventListener('DOMContentLoaded', function() {
    initTheme();
    updateNavigation();
    initMobileMenu();
    highlightActivePage();
    
    // Add theme toggle listener
    const themeToggle = document.getElementById('theme-toggle');
    if (themeToggle) {
        themeToggle.addEventListener('click', toggleTheme);
    }
    
    // Add password strength checker (optional - only if element exists)
    const strengthBar = document.getElementById('strength-bar');
    if (strengthBar) {
        const passwordInputs = document.querySelectorAll('input[type="password"]');
        passwordInputs.forEach(input => {
            input.addEventListener('input', (e) => checkPasswordStrength(e.target.value));
        });
    }
    
    // Start quiz timer if on quiz page
    if (document.querySelector('.quiz-container')) {
        startQuizTimer();
    }
});

// ========================================
// Utility Functions
// ========================================
function showMessage(message, type = 'success') {
    const messageDiv = document.createElement('div');
    messageDiv.className = `message message-${type}`;
    messageDiv.textContent = message;
    messageDiv.style.position = 'fixed';
    messageDiv.style.top = '20px';
    messageDiv.style.right = '20px';
    messageDiv.style.zIndex = '9999';
    messageDiv.style.padding = '1rem 1.5rem';
    messageDiv.style.borderRadius = '8px';
    messageDiv.style.boxShadow = 'var(--shadow-lg)';
    
    document.body.appendChild(messageDiv);
    
    setTimeout(() => {
        messageDiv.remove();
    }, 3000);
}

function formatDate(date) {
    return new Date(date).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
    });
}

function formatTime(seconds) {
    const minutes = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${String(minutes).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
}

// Export functions for use in JSP pages
window.EduSphere = {
    toggleTheme,
    handleLogin,
    handleRegister,
    handleLogout,
    switchTab,
    filterCourses,
    navigateQuestion,
    nextQuestion,
    previousQuestion,
    saveAnswer,
    submitQuiz,
    handleContactForm,
    smoothScroll,
    showMessage,
    validateForm
};
