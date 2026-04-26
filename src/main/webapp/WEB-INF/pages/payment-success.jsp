<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Successful - EduSphere</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css">
</head>
<body>

<jsp:include page="navbar.jsp" />

<main class="success-container">
    <div class="container">
        <div class="success-wrapper">

            <!-- Animation -->
            <div class="success-animation">
                <div class="checkmark-circle">
                    <div class="checkmark"></div>
                </div>
            </div>

            <div class="success-content">

                <!-- Title -->
                <h1 class="success-title">Payment Successful! 🎉</h1>

                <p class="success-subtitle">
                    <c:choose>
                        <c:when test="${plan eq 'premium'}">
                            Premium Plan Activated for <strong>${course}</strong>
                        </c:when>
                        <c:otherwise>
                            Free Plan Activated for <strong>${course}</strong>
                        </c:otherwise>
                    </c:choose>
                </p>

                <!-- Access Box -->
                <div class="access-granted-box">
                    <div class="access-icon">🚀</div>
                    <h2>Access Granted!</h2>
                    <p>
                        <c:choose>
                            <c:when test="${plan eq 'premium'}">
                                You now have full premium access to this course.
                            </c:when>
                            <c:otherwise>
                                You now have access to the free version of this course.
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>

                <!-- Transaction Details -->
                <div class="transaction-details">
                    <h3>Transaction Details</h3>

                    <div class="detail-row">
                        <span class="detail-label">Transaction ID:</span>
                        <span class="detail-value">
                            <c:choose>
                                <c:when test="${not empty paymentId}">
                                    ${paymentId}
                                </c:when>
                                <c:otherwise>
                                    FREE-ACTIVATION
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Plan:</span>
                        <span class="detail-value">
                            <c:out value="${plan eq 'premium' ? 'Premium' : 'Free'}"/>
                        </span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Course:</span>
                        <span class="detail-value">
                            <c:out value="${course}"/>
                        </span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Amount Paid:</span>
                        <span class="detail-value">
                            <c:choose>
                                <c:when test="${plan eq 'premium'}">
                                    ₹4999
                                </c:when>
                                <c:otherwise>
                                    Free
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Payment Date:</span>
                        <span class="detail-value">
                            <%= new java.text.SimpleDateFormat("MMM dd, yyyy")
                                   .format(new java.util.Date()) %>
                        </span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Status:</span>
                        <span class="status-badge success-badge">Confirmed</span>
                    </div>
                </div>

                <!-- What's Next -->
                <div class="whats-next-section">
                    <h3>What's Next?</h3>

                    <div class="next-steps-grid">

                        <div class="next-step-card">
                            <div class="step-icon">📚</div>
                            <h4>Go to Course</h4>
                            <p>Start learning your selected course now</p>
                            <a href="${pageContext.request.contextPath}/course-details?name=${course}" 
                               class="step-link">
                                Open Course →
                            </a>
                        </div>

                        <div class="next-step-card">
                            <div class="step-icon">👤</div>
                            <h4>Dashboard</h4>
                            <p>View your learning progress</p>
                            <a href="${pageContext.request.contextPath}/student-dashboard" 
                               class="step-link">
                                Go to Dashboard →
                            </a>
                        </div>

                    </div>
                </div>

                <!-- Premium Features -->
                <c:if test="${plan eq 'premium'}">
                    <div class="premium-features-section">
                        <h3>Your Premium Features</h3>
                        <div class="features-grid">
                            <div class="feature-box">🎓 Full Course Access</div>
                            <div class="feature-box">📜 Certificates</div>
                            <div class="feature-box">📥 Download Resources</div>
                            <div class="feature-box">💬 Priority Support</div>
                        </div>
                    </div>
                </c:if>

                <!-- Buttons -->
                <div class="success-actions">
                    <a href="${pageContext.request.contextPath}/student-dashboard"
                       class="btn btn-primary">
                        Go to Dashboard
                    </a>

                    <button onclick="window.print()" class="btn btn-outline">
                        Download Receipt
                    </button>
                </div>

            </div>
        </div>
    </div>
</main>

<jsp:include page="footer.jsp" />

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

<script>
setTimeout(function(){
    window.location.href =
    "${pageContext.request.contextPath}/premium?course=${course}";
}, 1000);   // 2.5 second baad redirect
</script>


</body>
</html>
