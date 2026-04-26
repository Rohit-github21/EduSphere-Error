<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.univ.pojo.MCQs" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Quiz</title>

 <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages.css">

<style>

/* ===== THEME VARIABLES ===== */
:root {
    --bg: #f4f6fb;
    --card-bg: #ffffff;
    --text: #1e293b;
    --primary: #6C63FF;
    --accent: #22c55e;
    --danger: #ef4444;
}

body.dark {
    --bg: #0f172a;
    --card-bg: #1e293b;
    --text: #f1f5f9;
}

/* ===== GLOBAL ===== */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg,#0f172a,#1e293b,#111827);
    color: var(--text);
    min-height: 100vh;
    transition: 0.3s ease;
}


.quiz-container {
    max-width: 1200px;
    margin: 40px auto;
    padding: 20px;
}

.quiz-layout {
    display: flex;
    gap: 30px;
}

.question-section { flex: 2; }
.question-nav { flex: 1; }

/* ===== CARD ===== */
.question-card {
    background: rgba(255,255,255,0.08);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255,255,255,0.1);
    padding: 30px;
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.3);
    transition: 0.3s ease;
}

.question-card:hover {
    transform: translateY(-5px);
}


/* ===== OPTIONS ===== */
.options-list { list-style: none; padding: 0; }
.options-list li {
    margin-bottom: 12px;
    padding: 8px;
    border-radius: 8px;
    transition: 0.2s;
}
.options-list li:hover {
    background: rgba(108,99,255,0.1);
}

/* ===== BUTTONS ===== */
.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-weight: bold;
    transition: 0.3s;
}

.btn-primary {
    background: linear-gradient(135deg,#6C63FF,#4f46e5);
    color: white;
}

.btn-secondary {
    background: #334155;
    color: white;
}

.btn-outline {
    background: orange;
    color: white;
}

.btn:hover {
    transform: translateY(-2px);
    opacity: 0.9;
}

/* ===== GRID ===== */
.question-grid {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 10px;
    margin-top: 15px;
}

.question-number-btn {
    padding: 10px;
    border-radius: 10px;
    border: none;
    font-weight: bold;
    background: rgba(255,255,255,0.1);
    color: white;
    transition: 0.3s;
}

.question-number-btn:hover {
    transform: scale(1.05);
}

.question-number-btn.current { background: var(--primary); color: white; }
.question-number-btn.answered { background: var(--accent); color: white; }
.question-number-btn.review { background: orange; color: white; }
.question-number-btn.not-answered { background: var(--danger); color: white; }

/* ===== TIMER ===== */
.timer {
    font-size: 20px;
    font-weight: bold;
    color: var(--danger);
}

/* ===== TOGGLE SWITCH ===== */
.theme-toggle {
    position: fixed;
    top: 20px;
    right: 20px;
    background: var(--primary);
    color: white;
    padding: 8px 15px;
    border-radius: 20px;
    cursor: pointer;
    font-size: 14px;
}

</style>

</head>

<body>
 <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />


<div class="quiz-container">

<h2>${courseName} Quiz</h2>
<br>

<div class="timer">
    Time Left: <span id="timer">30:00</span>
</div>
<br>

<div class="quiz-layout">

<!-- LEFT SIDE -->
<div class="question-section">

<form action="${pageContext.request.contextPath}/submitQuiz"
      method="post"
      id="quizForm">

<input type="hidden" name="course" value="${courseName}" />


<%
List<MCQs> questions = (List<MCQs>) request.getAttribute("questions");

for(int i = 0; i < questions.size(); i++) {
    MCQs q = questions.get(i);
%>

<div class="question-card"
     style="<%= (i==0) ? "" : "display:none;" %>">

    <h3>Question <%= i+1 %> of <%= questions.size() %></h3>
    <p><%= q.getQuestion() %></p>

    <ul class="options-list">
        <li><input type="radio" name="question_<%= q.getId() %>" value="A"> <%= q.getA() %></li>
        <li><input type="radio" name="question_<%= q.getId() %>" value="B"> <%= q.getB() %></li>
        <li><input type="radio" name="question_<%= q.getId() %>" value="C"> <%= q.getC() %></li>
        <li><input type="radio" name="question_<%= q.getId() %>" value="D"> <%= q.getD() %></li>
    </ul>

</div>

<%
}
%>

<br>

<div class="quiz-actions">
    <button type="button" class="btn btn-secondary" id="prevBtn">Previous</button>
    <button type="button" class="btn btn-outline" id="reviewBtn">Mark Review</button>
    <button type="button" class="btn btn-primary" id="nextBtn">Next</button>
</div>

<br>
<p style="color:red;">
    Unanswered Questions:
    <span id="unansweredCount">0</span>
</p>

<button type="submit" class="btn btn-primary">Submit Quiz</button>

</form>

</div>

<!-- RIGHT SIDE NAV -->
<div class="question-nav">

<h3>Questions</h3>

<div class="question-grid">

<%
for(int i = 0; i < questions.size(); i++){
%>
<button type="button"
        class="question-number-btn"
        data-index="<%=i%>">
    <%= i+1 %>
</button>
<%
}
%>

</div>

</div>

</div>
</div>
   <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

<script>

let current = 0;
let questions = document.querySelectorAll(".question-card");
let gridButtons = document.querySelectorAll(".question-number-btn");
let total = questions.length;

let nextBtn = document.getElementById("nextBtn");
let prevBtn = document.getElementById("prevBtn");
let reviewBtn = document.getElementById("reviewBtn");

let answerStatus = new Array(total).fill("not-answered");


// ===== UPDATE GRID =====
function updateGrid(){
    gridButtons.forEach((btn, index) => {
        btn.classList.remove("current","answered","review","not-answered");

        if(index === current){
            btn.classList.add("current");
        } else {
            btn.classList.add(answerStatus[index]);
        }
    });

    updateUnansweredCount();
}


// ===== SHOW QUESTION =====
function showQuestion(index){
    questions.forEach(q => q.style.display = "none");
    questions[index].style.display = "block";

    prevBtn.disabled = (index === 0);
    nextBtn.disabled = (index === total-1);

    updateGrid();
}


// ===== COUNT UNANSWERED =====
function updateUnansweredCount(){
    let unanswered = answerStatus.filter(a => a === "not-answered").length;

    let counter = document.getElementById("unansweredCount");
    if(counter){
        counter.innerText = unanswered;
    }
}


// ===== RADIO CHANGE =====
document.querySelectorAll("input[type=radio]").forEach(radio => {
    radio.addEventListener("change", function(){
        answerStatus[current] = "answered";
        updateGrid();
    });
});


// ===== NEXT =====
nextBtn.onclick = function(){
    if(current < total-1){
        current++;
        showQuestion(current);
    }
};


// ===== PREVIOUS =====
prevBtn.onclick = function(){
    if(current > 0){
        current--;
        showQuestion(current);
    }
};


// ===== GRID CLICK =====
gridButtons.forEach((btn, index)=>{
    btn.addEventListener("click", function(){
        current = index;
        showQuestion(current);
    });
});


// ===== MARK REVIEW =====
reviewBtn.addEventListener("click", function(){
    answerStatus[current] = "review";
    updateGrid();
});


// ===== TIMER =====
let totalTime = 30 * 60;
let timeLeft = totalTime;
let timerElement = document.getElementById("timer");

let countdown = setInterval(function(){

    let minutes = Math.floor(timeLeft / 60);
    let seconds = timeLeft % 60;

    timerElement.innerText =
        minutes + ":" + (seconds < 10 ? "0"+seconds : seconds);

    timeLeft--;

    if(timeLeft < 0){
        clearInterval(countdown);
        alert("Time's up! Auto submitting quiz.");
        document.getElementById("quizForm").submit();
    }

}, 1000);


// ===== PAGE LEAVE WARNING =====
window.onbeforeunload = function(){
    return "Are you sure you want to leave? Your progress may be lost.";
};


// ===== SUBMIT VALIDATION =====
document.getElementById("quizForm").addEventListener("submit", function(e){

    let unanswered = answerStatus.filter(a => a === "not-answered").length;

    if(unanswered > 0){
        alert("You still have " + unanswered + " unanswered questions.");
        e.preventDefault();
        return;
    }

    // Save time taken
    let timeTaken = totalTime - timeLeft;

    let hidden = document.createElement("input");
    hidden.type = "hidden";
    hidden.name = "timeTaken";
    hidden.value = timeTaken + " seconds";

    this.appendChild(hidden);

    // Prevent double submit
    document.querySelector("button[type=submit]").disabled = true;

});


showQuestion(0);
updateGrid();

</script>

<script>

function toggleTheme(){
    document.body.classList.toggle("dark");

    if(document.body.classList.contains("dark")){
        localStorage.setItem("theme","dark");
    } else {
        localStorage.setItem("theme","light");
    }
}

// Load saved theme
window.onload = function(){
    if(localStorage.getItem("theme") === "dark"){
        document.body.classList.add("dark");
    }
}

</script>



</body>
</html>
