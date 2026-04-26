<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.univ.pojo.Student"%>
<%@ page import="com.univ.pojo.PurchasedCourse"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
Boolean isPremiumUser = (Boolean) request.getAttribute("isPremiumUser");
if (isPremiumUser == null) {
    isPremiumUser = false;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${videoTitle}</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages.css">

<style>
body{
    margin:0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg,#0f172a,#1e293b);
    color:white;
}

.container{
    width:85%;
    margin:80px auto;
}

.video-section{
    background:#1e293b;
    padding:40px;
    border-radius:15px;
    text-align:center;
}

.video-box iframe{
    width:100%;
    max-width:900px;
    height:450px;
    border-radius:12px;
}

.lock-screen{
    width:100%;
    height:450px;
    background:black;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:22px;
    border-radius:12px;
}

.primary-btn{
    display:inline-block;
    margin:15px 10px;
    padding:12px 25px;
    background:#6366f1;
    color:white;
    text-decoration:none;
    border-radius:6px;
    font-weight:600;
    border:none;
    cursor:pointer;
}

.primary-btn:hover{
    opacity:0.9;
}
</style>
</head>

<body>

<jsp:include page="navbar.jsp" />

<div class="container">
<div class="video-section">

<h2>${videoTitle}</h2>

<div class="video-box">

<% if(isPremiumUser){ %>

    <!-- ✅ PREMIUM USER -->
    <iframe src="${videoLink}" frameborder="0" allowfullscreen></iframe>

<% } else { %>

    <!-- 🔒 LOCKED -->
    <div class="lock-screen">
        🔒 Premium Content Locked
    </div>

<% } %>

</div>

<div style="margin-top:30px;text-align:left;max-width:900px;margin:auto;">

<% if(isPremiumUser){ %>

    <!-- PREMIUM BUTTONS -->

    <a href="${pageContext.request.contextPath}/quiz"
       class="primary-btn">Go to MCQs</a>

    <a href="${pageContext.request.contextPath}/questionnaireCourse?course=${course}"
       class="primary-btn">Go to Questionnaire</a>

<% } else { %>

    <!-- NON PREMIUM VIEW -->

    <h3>Course Details</h3>
    <p>${description}</p>

    <h4>Syllabus</h4>
    <ul>
    <%
        String[] features = (String[]) request.getAttribute("features");
        if(features != null){
            for(String f : features){
    %>
        <li>✔ <%= f %></li>
    <%
            }
        }
    %>
    </ul>

    <!-- ✅ Buy Button -->
   <input type="hidden" id="course" value="${course}">
<button id="rzp-button" class="primary-btn">
    Buy Premium ₹4999
</button>


<% } %>

<br><br>

<a href="${pageContext.request.contextPath}/courses"
   class="primary-btn">Back to Courses</a>

</div>
</div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function () {

    const button = document.getElementById("rzp-button");
    if (!button) return;

    button.addEventListener("click", function () {

        const courseInput = document.getElementById("course");
        if (!courseInput) {
            alert("Course not found ❌");
            return;
        }

        const course = courseInput.value;

        fetch("${pageContext.request.contextPath}/create-order", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "plan=premium&course=" + encodeURIComponent(course)
        })
        .then(res => {
            if (!res.ok) {
                throw new Error("Order creation failed");
            }
            return res.json();
        })
        .then(order => {

            var options = {
                key: order.key,
                amount: order.amount,
                currency: order.currency,
                order_id: order.orderId,
                name: "EduSphere",
                description: "Premium Plan - " + course,
                theme: { color: "#6366f1" },

                handler: function (response){

                    // 🔥 SUCCESS REDIRECT
                    window.location.href =
                        "${pageContext.request.contextPath}/payment-success?plan=premium&course="
                        + encodeURIComponent(course)
                        + "&razorpay_payment_id="
                        + response.razorpay_payment_id;
                }
            };

            var rzp = new Razorpay(options);
            rzp.open();
        })
        .catch(err => {
            console.error(err);
            alert("Payment initialization failed ❌");
        });

    });

});
</script>


</body>
</html>
