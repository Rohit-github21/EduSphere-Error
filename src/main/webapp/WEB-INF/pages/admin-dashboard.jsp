<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="com.univ.pojo.MCQs"%>
<%@ page import="com.univ.pojo.Questionnaire" %>


<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - EduSphere</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
    
    <style>
   /*  /* AAPKI ORIGINAL CSS PROPERTY - NO CHANGES */
    .questionnaire-form {
        max-width: 720px;
        background: linear-gradient(180deg, #162235, #101a2b);
        border-radius: 16px;
        padding: 2rem 2.5rem;
        box-shadow: 0 18px 40px rgba(0,0,0,0.35);
    }
    .questionnaire-form .q-form-row {
        display: grid;
        grid-template-columns: 120px 1fr;
        align-items: center;
        gap: 1.4rem;
        margin-bottom: 1.4rem;
    }
    .questionnaire-form label { font-size: 14px; font-weight: 500; color: #cfd8ff; }
    .questionnaire-form .q-input {
        width: 100%; max-width: 380px; background: #0f1b2d; border: 1px solid #2a3f63;
        color: #ffffff; padding: 10px 14px; border-radius: 10px; font-size: 14px;
    }
    .questionnaire-form .q-input:focus { outline: none; border-color: #6c7cff; box-shadow: 0 0 0 3px rgba(108,124,255,.2); }
    .questionnaire-form .q-form-actions { margin-top: 2rem; display: flex; gap: 1rem; }
    @media (max-width: 768px) { .questionnaire-form .q-form-row { grid-template-columns: 1fr; } }
    
    html {
    scroll-behavior: smooth;
}


/* ================= THEME VARIABLES ================= */

body.light {
    --bg-main: #f6f7fb;
    --card-bg: #ffffff;
    --border-color: #e4e6ef;
    --text-main: #1f2937;
    --text-muted: #6b7280;
    --primary: #6366f1;
    --primary-hover: #4f46e5;
    --danger: #ef4444;
    --input-bg: #ffffff;
}

body.dark {
    --bg-main: #0f172a;
    --card-bg: #111827;
    --border-color: #1f2937;
    --text-main: #e5e7eb;
    --text-muted: #9ca3af;
    --primary: #818cf8;
    --primary-hover: #6366f1;
    --danger: #f87171;
    --input-bg: #020617;
}

/* ================= COMMON LAYOUT ================= */

.dashboard-section {
    background: var(--card-bg);
    border-radius: 14px;
    padding: 24px;
    margin-bottom: 30px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
}

.section-title {
    font-size: 20px;
    font-weight: 600;
    color: var(--text-main);
    margin-bottom: 20px;
    text-align: center;
}

/* ================= FORM ================= */

.admin-form {
    max-width: 720px;
    margin: 0 auto;
}

.q-form-row {
    display: flex;
    flex-direction: column;
    margin-bottom: 18px;
}

.q-form-row label {
    font-size: 14px;
    font-weight: 500;
    color: var(--text-muted);
    margin-bottom: 6px;
}

.q-input {
    background-color: #0f172a;   /* dark background */
   /* color: white; */
    border: 1px solid #3b82f6;
    padding: 8px;
    border-radius: 6px;
}

/* Dropdown open hone par */
.q-input option {
    background-color: #0f172a;
    color: white;
}


.q-input:focus {
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(99,102,241,0.25);
}

textarea.q-input {
    resize: vertical;
}

/* ================= BUTTONS ================= */

.q-form-actions {
    display: flex;
    gap: 12px;
    margin-top: 10px;
}

.btn {
    padding: 10px 20px;
    border-radius: 10px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    border: none;
}

.btn-primary {
    background: var(--primary);
    color: #fff;
}

.btn-primary:hover {
    background: var(--primary-hover);
}

.btn-secondary {
    background: transparent;
    color: var(--text-main);
    border: 1px solid var(--border-color);
}

/* ================= TABLE ================= */

.admin-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

.admin-table thead {
    background: rgba(99,102,241,0.08);
}

.admin-table th,
.admin-table td {
    padding: 14px 12px;
    text-align: left;
    font-size: 14px;
    color: var(--text-main);
}

.admin-table th {
    font-weight: 600;
    color: var(--text-muted);
}

.admin-table tbody tr {
    border-bottom: 1px solid var(--border-color);
}

.admin-table tbody tr:hover {
    background: rgba(99,102,241,0.05);
}

/* ================= ACTION BUTTONS ================= */

.btn-edit {
    background: var(--primary);
    color: #fff;
    padding: 6px 12px;
    border-radius: 8px;
    font-size: 13px;
    text-decoration: none;
}

.btn-delete {
    background: var(--danger);
    color: #fff;
    padding: 6px 12px;
    border-radius: 8px;
    font-size: 13px;
    margin-left: 6px;
    text-decoration: none;
}

/* ================= EMPTY STATE ================= */

.empty-text {
    text-align: center;
    padding: 20px;
    color: var(--text-muted);
}







/* ---------------------------------------------------------------------- */
/* Manage MCQ HAin */


body.dark {
    --bg-main: #0b1220;
    --card-bg: #0f172a;
    --input-bg: #020617;

    --border-color: rgba(255,255,255,0.08);

    --text-main: #e5e7eb;
    --text-muted: #9ca3af;

    --primary: #818cf8;      /* Indigo glow */
    --primary-soft: rgba(129,140,248,0.25);

    --success: #34d399;
    --danger: #f87171;
}
body.light {
    --bg-main: #f6f7fb;
    --card-bg: #ffffff;
    --input-bg: #ffffff;

    --border-color: #e5e7eb;

    --text-main: #111827;
    --text-muted: #6b7280;

    --primary: #4f46e5;      /* Strong indigo */
    --primary-soft: rgba(79,70,229,0.18);

    --success: #16a34a;
    --danger: #dc2626;
}

.mcq-question:focus,
.mcq-option:focus,
.mcq-select:focus {
    border-color: var(--primary);
    box-shadow:
        0 0 0 3px var(--primary-soft),
        0 12px 30px var(--primary-soft);
}

.btn-save {
    background: linear-gradient(
        135deg,
        var(--primary),
        color-mix(in srgb, var(--primary), #fff 18%)
    );
    color: #fff;
}

.btn-reset {
    background: transparent;
    border: 1px solid var(--border-color);
    color: var(--text-main);
}
.mcq-table th {
    background: color-mix(in srgb, var(--primary), transparent 90%);
    color: var(--text-muted);
}
.mcq-wrapper:hover,
.mcq-table-wrapper:hover {
    transform: translateY(-2px);
    transition: 0.3s ease;
}

.mcq-empty {
    background: color-mix(in srgb, var(--primary), transparent 92%);
    border-radius: 12px;
}




/* ------------------------------------------------------------------- */

/* Recently View */

body.light {
    --bg-main: #f6f7fb;
    --card-bg: #ffffff;
    --border-color: #e5e7eb;
    --text-main: #111827;
    --text-muted: #6b7280;
    --primary: #6366f1;
    --success: #22c55e;
}

body.dark {
    --bg-main: #0b1220;
    --card-bg: #0f172a;
    --border-color: #1f2937;
    --text-main: #e5e7eb;
    --text-muted: #9ca3af;
    --primary: #818cf8;
    --success: #34d399;
}

/* ================= RECENT ACTIVITY CARD ================= */

.activity-card {
    background: var(--card-bg);
    border-radius: 18px;
    padding: 26px;
    box-shadow: 0 18px 45px rgba(0,0,0,0.15);
}

/* Header */
.activity-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
}

.activity-title {
    font-size: 18px;
    font-weight: 600;
    color: var(--text-main);
}

.activity-filter {
    font-size: 14px;
    color: var(--primary);
    cursor: pointer;
}

/* Divider */
.activity-divider {
    height: 1px;
    background: var(--border-color);
    margin-bottom: 18px;
}

/* ================= ACTIVITY ITEM ================= */

.activity-item {
    display: flex;
    align-items: center;
    gap: 16px;
    padding: 16px 18px;
    border-radius: 14px;
    background: rgba(99,102,241,0.08);
    transition: 0.25s ease;
}

body.dark .activity-item {
    background: rgba(129,140,248,0.12);
}

.activity-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.25);
}

/* Icon */
.activity-icon {
    width: 42px;
    height: 42px;
    border-radius: 50%;
    background: rgba(99,102,241,0.15);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    color: var(--primary);
}

/* Content */
.activity-content {
    flex: 1;
}

.activity-text {
    font-size: 15px;
    font-weight: 500;
    color: var(--text-main);
}

.activity-time {
    font-size: 13px;
    color: var(--text-muted);
    margin-top: 4px;
}

/* Status Badge */
.activity-badge {
    font-size: 12px;
    font-weight: 500;
    padding: 6px 12px;
    border-radius: 999px;
    background: rgba(34,197,94,0.15);
    color: var(--success);
}
 */
    
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <main class="dashboard-container">
        <div class="container-wide">
            <div class="dashboard-header">
                <div class="dashboard-welcome">
                    <div class="welcome-text">
                        <h1>Admin Dashboard 🛡️</h1>
                        <p>Manage platform content, users, and analytics</p>
                    </div>
<a href="${pageContext.request.contextPath}/admin-dashboard"
   style="background: linear-gradient(135deg,#10B981,#059669);
          color:white;
          padding:8px 20px;
          border-radius:25px;
          text-decoration:none;
          display:inline-block;
          font-weight:600;">
   Administrator
</a>
                </div>
            </div>
            
            <% String msg = (String) request.getAttribute("msg");
                               if (msg != null) { %>
                                <h4 id="successMsg" style="  color: green; font-weight: 400; text-align: center; margin: 5px 0;
"><%= msg %></h4>
                            <% } %>
            
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-card-header"><div class="stat-icon stat-icon-primary">👥</div></div>
                    <div class="stat-value" id="studentCounter">${totalStudents}</div>
                    <div class="stat-label">Total Students</div>
                    <div class="stat-change positive">↑ 45 this week</div>
                </div>
                <div class="stat-card">
                    <div class="stat-card-header"><div class="stat-icon stat-icon-success">📝</div></div>
                    <div class="stat-value" id="quizCounter">${totalQuizzes}</div>
                    <div class="stat-label">Total Quizzes</div>
                    <div class="stat-change positive">↑ 8 new quizzes</div>
                </div>
                <div class="stat-card">
                    <div class="stat-card-header"><div class="stat-icon stat-icon-warning">📋</div></div>
                    <div class="stat-value" id="totalQuestions">${totalQuestionnaires}</div>
                    <div class="stat-label">Questionnaires</div>
                    <div class="stat-change">12 active</div>
                </div>
                <div class="stat-card">
                    <div class="stat-card-header"><div class="stat-icon stat-icon-info">📊</div></div>
                    <div class="stat-value" id="totalAttempts">${totalAttempts}</div>
                    <div class="stat-label">Quiz Attempts</div>
                    <div class="stat-change positive">↑ 23% this month</div>
                </div>
            </div>
            
            <div class="admin-dashboard">
                <aside class="admin-sidebar">
                    <h3 style="margin-bottom: 1rem; font-size: 1.1rem;">Management</h3>
                    <ul class="sidebar-menu">
                        <li class="sidebar-item"><a href="#" class="sidebar-link active"><span>📊 Overview</span></a></li>
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><span>📋 Questionnaires</span></a></li>
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><span>❓ Manage MCQs</span></a></li>
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><span>📝 Quiz Management</span></a></li>
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><span>⚙️ Settings</span></a></li>
                    </ul>
                </aside>
                
                <div class="admin-content">
                    <div class="dashboard-section">
                        <div class="section-header">
                            <h3 class="section-title">Recent Activity</h3>
                            <span class="section-action">Today</span>
                        </div>
                        <div class="activity-list">
                            <div class="activity-item">
                                <div class="activity-icon" style="background: rgba(99, 102, 241, 0.1); color: #6366f1;">👤</div>
                                <div class="activity-content">
                                    <div class="activity-title">New Student Registration</div>
                                    <div class="activity-time">10 minutes ago</div>
                                </div>
                                <span class="activity-badge">New</span>
                            </div>
                        </div>
                    </div>

 



<%
    // Edit mode data
    Questionnaire qs = (Questionnaire) request.getAttribute("questionnaire");
    boolean isEdit = (qs != null);
%>

<!-- ================= FORM SECTION ================= -->
<div class="dashboard-section" id="questionnaire-form" style="margin-top:2rem;">

    <h3 class="section-title">
        <%= isEdit ? "Edit Questionnaire" : "Create Questionnaire" %>
    </h3>

    <form action="<%= request.getContextPath() %>/admin/save"
          method="post"
          class="form-card admin-form">

        <!-- 🔥 HIDDEN ID (VERY IMPORTANT FOR EDIT) -->
        <input type="hidden" name="id"
               value="<%= isEdit ? qs.getId() : 0 %>" />

        <!-- Title -->
        <div class="q-form-row">
            <label>Title</label>
            <input type="text"
                   name="title"
                   class="q-input"
                   placeholder="Enter Title"
                   value="<%= isEdit ? qs.getTitle() : "" %>"
                   required />
        </div>

        <!-- Content -->
        <div class="q-form-row">
            <label>Content</label>
            <textarea name="content"
                      rows="3"
                      class="q-input"
                      placeholder="Enter Content"
                      required><%= isEdit ? qs.getContent() : "" %></textarea>
        </div>
        
        <!-- Drop Down For Courses -->
         <div class="q-form-row">
    <label>Courses</label>
    <select name="courses" class="q-input">
        <option value="Java"
            <%= isEdit && "Java".equals(qs.getCourses()) ? "selected" : "" %>>
            Java
        </option>
        <option value="Python"
            <%= isEdit && "Python".equals(qs.getCourses()) ? "selected" : "" %>>
            Python
        </option>
        <option value="C"
            <%= isEdit && "C".equals(qs.getCourses()) ? "selected" : "" %>>
            C
        </option>
        <option value="C++"
            <%= isEdit && "C++".equals(qs.getCourses()) ? "selected" : "" %>>
            C++
        </option>
        <option value="MERN"
            <%= isEdit && "MERN".equals(qs.getCourses()) ? "selected" : "" %>>
            MERN
        </option>
    </select>
</div>

        

        <!-- Status -->
        <div class="q-form-row">
            <label>Status</label>
            <select name="status" class="q-input">
                <option value="ACTIVE"
                    <%= isEdit && "ACTIVE".equals(qs.getStatus()) ? "selected" : "" %>>
                    ACTIVE
                </option>
                <option value="INACTIVE"
                    <%= isEdit && "INACTIVE".equals(qs.getStatus()) ? "selected" : "" %>>
                    INACTIVE
                </option>
            </select>
        </div>

        <!-- Buttons -->
        <div class="q-form-actions">
            <button type="submit" class="btn btn-primary">
                <%= isEdit ? "Update" : "Save" %>
            </button>

            <a href="<%= request.getContextPath() %>/admin"
               class="btn btn-secondary">
               Cancel
            </a>
        </div>
    </form>
</div>

<hr/>

<!-- ================= TABLE SECTION ================= -->
<div class="dashboard-section">
    <h3 class="section-title">Questionnaire List</h3>

    <table class="admin-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Question</th>
                <th>Status</th>
                <th style="width:150px;">Actions</th>
            </tr>
        </thead>

        <tbody>
            <%
                List<Questionnaire> list =
                        (List<Questionnaire>) request.getAttribute("list");

                if (list == null || list.isEmpty()) {
            %>
                <tr>
                    <td colspan="4" style="text-align:center;">
                        No Questionnaires Found
                    </td>
                </tr>
            <%
                } else {
                    for (Questionnaire q : list) {
            %>
                <tr>
                    <td><%= q.getId() %></td>
                    <td><%= q.getTitle() %></td>
                    <td><%= q.getStatus() %></td>
                    <td>
                        <!-- ✅ EDIT (AUTO SCROLL) -->
                        <a class="btn btn-sm btn-edit"
                           href="<%= request.getContextPath() %>/admin/edit?id=<%= q.getId() %>#questionnaire-form">
                           Edit
                        </a>

                        <!-- DELETE -->
                        <a class="btn btn-sm btn-delete"
                           href="<%= request.getContextPath() %>/admin/delete?id=<%= q.getId() %>"
                           onclick="return confirm('Are you sure?')">
                           Delete
                        </a>
                    </td>
                </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</div>



                    
              

       <%
    // Flash / request message
    String msg1 = (String) request.getAttribute("msg");

    // Edit ke liye MCQ object (agar aaya ho)
    MCQs editMcq = (MCQs) request.getAttribute("mcq");
    boolean isEditMcq = (editMcq != null);
%>

<div class="dashboard-section" id="manage-mcqs" style="margin-top: 2rem;">

    <div class="section-header">
        <h3 class="section-title">Manage MCQs</h3>

    
    </div>

    <!-- ================= MCQ FORM ================= -->
    <div class="glass-card" style="margin-bottom: 1.5rem;" id="mcqFormBox">

        <form action="<%= request.getContextPath() %>/saveMcq" method="post">

            <!-- 🔥 Hidden ID (ADD = 0, EDIT = actual id) -->
            <input type="hidden" id="mcqId" name="id"
                   value="<%= isEditMcq ? editMcq.getId() : 0 %>">

            <div class="form-group">
                <label class="form-label">Question</label>
                <textarea class="form-input" rows="2"
                          name="question" id="question"
                          placeholder="Enter question"><%= isEditMcq ? editMcq.getQuestion() : "" %></textarea>
            </div>

            <div class="grid grid-2"
                 style="display:grid; grid-template-columns:1fr 1fr; gap:10px;">

                <input type="text" class="form-input"
                       placeholder="Option A" name="a" id="optionA"
                       value="<%= isEditMcq ? editMcq.getA() : "" %>">

                <input type="text" class="form-input"
                       placeholder="Option B" name="b" id="optionB"
                       value="<%= isEditMcq ? editMcq.getB() : "" %>">

                <input type="text" class="form-input"
                       placeholder="Option C" name="c" id="optionC"
                       value="<%= isEditMcq ? editMcq.getC() : "" %>">

                <input type="text" class="form-input"
                       placeholder="Option D" name="d" id="optionD"
                       value="<%= isEditMcq ? editMcq.getD() : "" %>">
            </div>

            <div class="form-group" style="margin-top:10px;">
                <select class="form-input" name="correctAnswer" id="correctAnswer">
                    <option value="">Select correct answer</option>
                    <option value="A" <%= isEditMcq && "A".equals(editMcq.getCorrectAnswer()) ? "selected" : "" %>>Option A</option>
                    <option value="B" <%= isEditMcq && "B".equals(editMcq.getCorrectAnswer()) ? "selected" : "" %>>Option B</option>
                    <option value="C" <%= isEditMcq && "C".equals(editMcq.getCorrectAnswer()) ? "selected" : "" %>>Option C</option>
                    <option value="D" <%= isEditMcq && "D".equals(editMcq.getCorrectAnswer()) ? "selected" : "" %>>Option D</option>
                </select>
            </div>
            <div class="form-group" style="margin-top:10px;">
    <label class="form-label">Select Course</label>
    <select class="form-input" name="courseId">
        <option value="">Select Course</option>

        <% for(Course c : (List<Course>)request.getAttribute("courseList")) { %>
            <option value="<%= c.getId() %>">
                <%= c.getName() %>
            </option>
        <% } %>

    </select>
</div>
            

            <div class="flex gap-2" style="margin-top:15px;">
                <button type="submit" class="btn btn-primary">
                    <%= isEditMcq ? "Update MCQ" : "Save MCQ" %>
                </button>

                <a href="<%= request.getContextPath() %>/admin-dashboard"
                   class="btn btn-secondary">
                    Reset
                </a>
            </div>
        </form>
    </div>

    <!-- ================= MCQ TABLE ================= -->
    <div style="overflow-x:auto;" id="quiz-management">
        <table class="data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Question</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<MCQs> list1 = (List<MCQs>) request.getAttribute("mcqList");

                    if (list1 == null || list1.isEmpty()) {
                %>
                    <tr>
                        <td colspan="3" style="text-align:center;">
                            No MCQs Found
                        </td>
                    </tr>
                <%
                    } else {
                        for (MCQs q : list1) {
                %>
                    <tr>
                        <td><%= q.getId() %></td>
                        <td><%= q.getQuestion() %></td>
                        <td class="table-actions">

                            <!-- EDIT -->
                            <a class="action-btn action-btn-edit"
                            href="<%= request.getContextPath() %>/editMcq?id=<%= q.getId() %>">
    Edit
</a>


                            <!-- DELETE -->
                            <a class="action-btn action-btn-delete"
                               href="<%= request.getContextPath() %>/deleteMcq?id=<%= q.getId() %>"
                               onclick="return confirm('Are you sure?')">
                               Delete
                            </a>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

    <jsp:include page="footer.jsp" />
    
    <script>
    setTimeout(function () {
        var msg = document.getElementById("successMsg");
        if (msg) {
            msg.style.display = "none";
        }
    }, 5000); 
</script>

<script>
    setTimeout(function () {
        var msg1 = document.getElementById("successMsg1");
        if (msg1) msg1.style.display = "none";
    }, 5000);
</script>
    
    
 <script>
function editMcq(btn) {

    // 1️⃣ Hidden ID set (EDIT mode)
    document.getElementById("mcqId").value = btn.dataset.id;

    // 2️⃣ Form fields auto-fill
    document.getElementById("question").value = btn.dataset.question || "";
    document.getElementById("optionA").value = btn.dataset.a || "";
    document.getElementById("optionB").value = btn.dataset.b || "";
    document.getElementById("optionC").value = btn.dataset.c || "";
    document.getElementById("optionD").value = btn.dataset.d || "";
    document.getElementById("correctAnswer").value = btn.dataset.correct || "";

    // 3️⃣ Button text change
    document.getElementById("saveBtn").innerText = "Update MCQ";

    // 4️⃣ Scroll smoothly to form
    document.getElementById("mcqFormBox")
        .scrollIntoView({ behavior: "smooth", block: "nearest" });
}
</script>


<script>
    window.addEventListener("load", function () {
        if (window.location.hash === "#questionnaire-form") {
            document.getElementById("questionnaire-form")
                .scrollIntoView({ behavior: "smooth", block: "nearest" });
        }
    });
</script>




</body>
</html>