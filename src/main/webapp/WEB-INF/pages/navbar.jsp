<%@page import="com.univ.pojo.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.univ.pojo.Student" %> 

<%
Student st = (Student) session.getAttribute("loggedInStudent");
Admin ad = (Admin) session.getAttribute("loggedInAdmin");

boolean studentLoggedIn = (st != null);
boolean adminLoggedIn = (ad != null);
%>

<nav class="navbar">
    <div class="navbar-container">

        <!-- Logo -->
        <a href="<%= request.getContextPath() %>/home" class="navbar-logo">
            <div class="navbar-logo-icon">E</div>
            <span>EduSphere</span>
        </a>

        <!-- Mobile Menu Toggle -->
        <button class="mobile-menu-toggle" id="mobile-menu-toggle">
            <span></span>
            <span></span>
            <span></span>
        </button>

        <!-- Navigation Menu -->
        <ul class="navbar-menu" id="navbar-menu">

            <li><a href="<%= request.getContextPath() %>/home" class="navbar-link">Home</a></li>
            <li><a href="<%= request.getContextPath() %>/services" class="navbar-link">Services</a></li>
            <li><a href="<%= request.getContextPath() %>/contact" class="navbar-link">Contact</a></li>

            <% if (studentLoggedIn) { %>
                <li><a href="<%= request.getContextPath() %>/courses" class="navbar-link">My Courses</a></li>
                <li><a href="<%= request.getContextPath() %>/student-dashboard" class="navbar-link">Dashboard</a></li>
                <li>
                    <a href="<%= request.getContextPath() %>/profile" class="navbar-link">
                        👤 Profile
                    </a>
                </li>
            <% } %>

        </ul>

        <!-- Actions -->
        <div class="navbar-actions">

            <!-- Theme Toggle -->
            <button class="theme-toggle" id="theme-toggle" title="Toggle Theme">
                <span class="theme-icon" id="theme-icon">🌞</span>
            </button>

            <% if (!studentLoggedIn && !adminLoggedIn) { %>
                <div class="nav-auth-buttons">
                    <a href="<%= request.getContextPath() %>/login"
                       class="btn btn-outline btn-sm">Login</a>
                    <a href="<%= request.getContextPath() %>/register"
                       class="btn btn-primary btn-sm">Register</a>
                </div>
            <% } else { %>
                <div class="nav-user-actions">
                    <a href="<%= request.getContextPath() %>/logout"
                       class="btn btn-outline btn-sm">Logout</a>
                </div>
            <% } %>

        </div>
    </div>
</nav>

<!-- =====================
     THEME SCRIPT
===================== -->
<script>
const toggleBtn = document.getElementById("theme-toggle");
const icon = document.getElementById("theme-icon");

// default = dark
if (!localStorage.getItem("theme")) {
    localStorage.setItem("theme", "dark");
}

if (localStorage.getItem("theme") === "light") {
    document.body.classList.remove("theme-dark");
    document.body.classList.add("theme-light");
    icon.textContent = "🌙";
} else {
    document.body.classList.add("theme-dark");
    icon.textContent = "🌞";
}

toggleBtn.addEventListener("click", () => {
    document.body.classList.toggle("theme-light");
    document.body.classList.toggle("theme-dark");

    if (document.body.classList.contains("theme-light")) {
        localStorage.setItem("theme", "light");
        icon.textContent = "🌙";
    } else {
        localStorage.setItem("theme", "dark");
        icon.textContent = "🌞";
    }
});
</script>


<style>

body.theme-dark {
    --bg-main: radial-gradient(ellipse at top, #1e293b, #020617);
    --bg-card: rgba(15, 23, 42, 0.9);
    --border-color: rgba(148, 163, 184, 0.18);

    --text-main: #f8fafc;      /* MAIN TEXT */
    --text-muted: #94a3b8;    /* MUTED TEXT */
    --text-soft: #cbd5f5;     /* NORMAL PARAGRAPH */

    --primary: #6366f1;
}

body.theme-light {
    --bg-main: #f8fafc;
    --bg-card: #ffffff;
    --border-color: #e5e7eb;

    --text-main: #0f172a;
    --text-muted: #475569;
    --text-soft: #1e293b;

    --primary: #4f46e5;
}

/* =====================
   APPLY BASE
===================== */

body {
    background: var(--bg-main);
    color: var(--text-main);
}

/* cards / sections */
.navbar,
.stat-card,
.dashboard-section,
.glass-card,
.admin-sidebar {
    background: var(--bg-card);
    border: 1px solid var(--border-color);
    backdrop-filter: blur(14px);
}

/* =====================
   TEXT FIX (IMPORTANT)
===================== */

/* headings */
h1, h2, h3, h4, h5, h6 {
    color: var(--text-main);
}

/* normal text */
p,
span,
label,
.stat-label,
.activity-time {
    color: var(--text-muted);
}

/* content text */
.activity-title,
.stat-value,
.section-title {
    color: var(--text-main);
}

/* sidebar */
.sidebar-link {
    color: var(--text-soft);
}

.sidebar-link.active {
    color: #ffffff;
    background: linear-gradient(135deg, #6366f1, #4f46e5);
}

/* =====================
   BUTTONS
===================== */

.btn-primary {
    background: linear-gradient(135deg, #6366f1, #4f46e5);
    color: #ffffff;
}

/* =====================
   TABLE / INPUT SAFETY
===================== */

input,
textarea,
select {
    background: var(--bg-card);
    color: var(--text-main);
    border-color: var(--border-color);
}
</style>