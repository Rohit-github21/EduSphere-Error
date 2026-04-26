<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Questionnaire</title>

<style>
body{
    background: linear-gradient(135deg,#0f172a,#1e293b);
    font-family: Arial, sans-serif;
    color:white;
    margin:0;
}

.container{
    width:80%;
    margin:auto;
    padding:40px 0;
}

h1{
    text-align:center;
    margin-bottom:30px;
}

/* LINE FILTER */
.course-line-filter{
    display:flex;
    justify-content:center;
    gap:50px;
    margin-bottom:40px;
    border-bottom:2px solid #334155;
    padding-bottom:15px;
}

.line-btn{
    text-decoration:none;
    font-size:18px;
    color:#94a3b8;
    padding:5px 10px;
    position:relative;
    transition:0.3s;
}

.line-btn:hover{
    color:white;
}

.line-btn.active{
    color:white;
}

.line-btn.active::after{
    content:'';
    position:absolute;
    left:0;
    bottom:-17px;
    width:100%;
    height:3px;
    background:#6366f1;
    border-radius:2px;
}

/* QUESTION CARD */
.question-card{
    background:#1e293b;
    padding:20px;
    border-radius:10px;
    margin-bottom:20px;
    border:1px solid #334155;
    transition:0.3s;
}

.question-card:hover{
    border-color:#6366f1;
}

.badge{
    background:#6366f1;
    padding:5px 10px;
    border-radius:20px;
    font-size:12px;
}

/* PAGINATION */
.pagination{
    text-align:center;
    margin-top:30px;
}

.page-btn{
    padding:8px 12px;
    margin:0 4px;
    background:#334155;
    color:white;
    text-decoration:none;
    border-radius:6px;
}

.page-btn.active{
    background:#6366f1;
}

.no-data{
    text-align:center;
    padding:40px;
    color:#94a3b8;
}
</style>
</head>

<body>

<div class="container">

<h1>📋 Questionnaire</h1>

<!-- LINE FILTER -->
<div class="course-line-filter">

   <a class="line-btn ${selectedCourse=='Java'?'active':''}"
   href="${pageContext.request.contextPath}/questionnaire?course=Java">
   Java
</a>

<a class="line-btn ${selectedCourse=='Python'?'active':''}"
   href="${pageContext.request.contextPath}/questionnaire?course=Python">
   Python
</a>


    <a class="line-btn ${selectedCourse=='C++'?'active':''}"
   href="${pageContext.request.contextPath}/questionnaire?course=C%2B%2B">
   C++
</a>

 <a class="line-btn ${selectedCourse=='DSA'?'active':''}"
   href="${pageContext.request.contextPath}/questionnaire?course=DSA">
   DSA
</a>
</div>

<!-- QUESTIONS -->
<c:if test="${questions.size() > 0}">
    <c:forEach var="q" items="${questions}">
        <div class="question-card">
            <h3>${q.title}</h3>
            <p>${q.content}</p>
            <span class="badge">${q.courses}</span>
        </div>
    </c:forEach>
</c:if>

<c:if test="${questions.size() == 0}">
    <div class="no-data">
        No questions available for this course.
    </div>
</c:if>

<!-- PAGINATION -->
<c:if test="${totalPages > 1}">
<div class="pagination">

    <c:if test="${currentPage > 0}">
        <a class="page-btn"
           href="?page=${currentPage-1}&course=${selectedCourse}">
           Prev
        </a>
    </c:if>

    <c:forEach begin="0" end="${totalPages-1}" var="i">
        <a class="page-btn ${i==currentPage?'active':''}"
           href="?page=${i}&course=${selectedCourse}">
           ${i+1}
        </a>
    </c:forEach>

    <c:if test="${currentPage < totalPages-1}">
        <a class="page-btn"
           href="?page=${currentPage+1}&course=${selectedCourse}">
           Next
        </a>
    </c:if>

</div>
</c:if>

</div>

</body>
</html>
