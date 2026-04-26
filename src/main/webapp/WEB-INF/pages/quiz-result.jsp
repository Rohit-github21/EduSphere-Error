<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Integer score = (Integer) request.getAttribute("score");
    Integer total = (Integer) request.getAttribute("total");
    String courseName = (String) request.getAttribute("courseName");
    String formattedDate = (String) request.getAttribute("formattedDate");

    if (score == null) score = 0;
    if (total == null) total = 0;

    int percentage = (total > 0) ? (score * 100) / total : 0;
    int incorrect = total - score;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz Result - EduSphere</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quiz.css">
</head>

<body>

<jsp:include page="navbar.jsp" />

<main class="quiz-container">
<div class="result-container">
<div class="result-card">

    <!-- Icon -->
    <div class="result-icon">
        <%= (percentage >= 50) ? "✓" : "✗" %>
    </div>

    <!-- Title -->
    <h2 class="result-title">
        <%= (percentage >= 50) ? "Congratulations!" : "Better Luck Next Time!" %>
    </h2>

    <!-- Percentage -->
    <div class="result-score"><%= percentage %>%</div>

    <p style="font-size: 1.1rem; color: var(--text-secondary); margin-bottom: 2rem;">
        You have completed the 
        <strong><%= courseName %></strong> Quiz
    </p>

    <!-- Stats -->
    <div class="result-stats">

        <div class="result-stat">
            <div class="result-stat-value" style="color: var(--emerald);">
                <%= score %>
            </div>
            <div class="result-stat-label">Correct Answers</div>
        </div>

        <div class="result-stat">
            <div class="result-stat-value" style="color: #EF4444;">
                <%= incorrect %>
            </div>
            <div class="result-stat-label">Incorrect Answers</div>
        </div>

        <div class="result-stat">
            <div class="result-stat-value" style="color: var(--accent-primary);">
                <%= total %>
            </div>
            <div class="result-stat-label">Total Questions</div>
        </div>

    </div>

    <!-- Extra Info -->
    <div style="background: var(--bg-secondary); padding: 1.5rem; border-radius: 12px; margin: 2rem 0;">
        <div class="grid grid-2" style="text-align: left;">

            <!-- Passing Score -->
            <div style="padding: 0.75rem;">
                <div style="font-size: 0.85rem; color: var(--text-tertiary); margin-bottom: 0.25rem;">
                    Passing Score
                </div>
                <div style="font-size: 1.1rem; font-weight: 600;">
                    50% (<%= total/2 %>/<%= total %>)
                </div>
            </div>

            <!-- Completion Date -->
            <div style="padding: 0.75rem;">
                <div style="font-size: 0.85rem; color: var(--text-tertiary); margin-bottom: 0.25rem;">
                    Completion Date
                </div>
                <div style="font-size: 1.1rem; font-weight: 600;">
                    <%= (formattedDate != null) ? formattedDate : "" %>
                </div>
            </div>

            <!-- Status -->
            <div style="padding: 0.75rem;">
                <div style="font-size: 0.85rem; color: var(--text-tertiary); margin-bottom: 0.25rem;">
                    Status
                </div>

                <%
                    if (percentage >= 50) {
                %>
                    <span class="badge badge-success">PASSED</span>
                <%
                    } else {
                %>
                    <span class="badge badge-danger">FAILED</span>
                <%
                    }
                %>

            </div>

        </div>
    </div>

    <!-- Progress Bar -->
    <div style="margin: 2rem 0;">
        <div class="progress-bar">
            <div class="progress-fill" style="width: <%= percentage %>%;"></div>
        </div>
    </div>

    <!-- Buttons -->
    <div class="result-actions">

        <a href="${pageContext.request.contextPath}/quiz-history"
           class="btn btn-primary btn-lg">
            View History
        </a>

        <a href="${pageContext.request.contextPath}/quiz?course=<%= courseName %>"
           class="btn btn-secondary btn-lg">
            Retake Quiz
        </a>

    </div>

</div>
</div>
</main>

<jsp:include page="footer.jsp" />

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>
