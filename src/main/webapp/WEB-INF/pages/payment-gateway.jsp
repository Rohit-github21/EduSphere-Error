<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Payment Gateway - EduSphere</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">

<style>
body{
    margin:0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg,#0f172a,#1e293b);
    color:white;
}

.payment-wrapper{
    min-height:90vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.payment-card{
    width:420px;
    background: rgba(255,255,255,0.05);
    backdrop-filter: blur(15px);
    border-radius:20px;
    padding:40px;
    box-shadow:0 0 40px rgba(108,99,255,0.4);
    border:1px solid rgba(255,255,255,0.1);
    transition:0.3s ease;
}

.payment-card:hover{
    transform: translateY(-5px);
    box-shadow:0 0 60px rgba(108,99,255,0.6);
}

.payment-title{
    text-align:center;
    margin-bottom:25px;
    font-size:26px;
    font-weight:600;
    background: linear-gradient(90deg,#6c63ff,#8b5cf6);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.payment-row{
    display:flex;
    justify-content:space-between;
    margin:15px 0;
    font-size:15px;
    opacity:0.9;
}

.plan-badge{
    display:inline-block;
    padding:5px 12px;
    border-radius:50px;
    background: linear-gradient(90deg,#6c63ff,#8b5cf6);
    font-size:13px;
    margin-bottom:10px;
}

.pay-btn{
    width:100%;
    margin-top:25px;
    padding:14px;
    border:none;
    border-radius:12px;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    background: linear-gradient(90deg,#6c63ff,#8b5cf6);
    color:white;
    transition:0.3s ease;
}

.pay-btn:hover{
    transform:scale(1.03);
    box-shadow:0 0 20px rgba(139,92,246,0.8);
}

.secure-note{
    text-align:center;
    font-size:13px;
    opacity:0.7;
    margin-top:15px;
}
</style>
</head>
<body>

<div class="payment-wrapper">

    <div class="payment-card">

        <div class="payment-title">Complete Your Payment</div>

        <div class="plan-badge">
            ${selectedPlan eq 'premium' ? '⭐ Premium Plan' : 'Free Plan'}
        </div>

        <div class="payment-row">
            <span>Course:</span>
            <strong>${courseName}</strong>
        </div>

        <div class="payment-row">
            <span>Total Amount:</span>
            <strong>
                ${selectedPlan eq 'premium' ? '₹4999' : 'Free'}
            </strong>
        </div>

        <input type="hidden" id="selectedPlan" value="${selectedPlan}">
        <input type="hidden" id="courseName" value="${courseName}">

        <button id="pay-btn" class="pay-btn">
            ${selectedPlan eq 'premium' ? 'Pay ₹4999 Securely' : 'Activate Free'}
        </button>

        <div class="secure-note">
            🔒 100% Secure Payment via Razorpay
        </div>

    </div>

</div>

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function () {

    const button = document.getElementById("pay-btn");

    if (!button) {
        console.log("Pay button not found");
        return;
    }

    button.addEventListener("click", function () {

        const plan = document.getElementById("selectedPlan").value;
        const course = document.getElementById("courseName").value;

        console.log("Plan:", plan);
        console.log("Course:", course);

        // ✅ FREE PLAN
        if(plan === "free"){
            window.location.href =
                "${pageContext.request.contextPath}/payment-success?plan=free&course="
                + encodeURIComponent(course);
            return;
        }

        // ✅ CREATE ORDER
        fetch("${pageContext.request.contextPath}/create-order", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "plan=" + encodeURIComponent(plan) +
                  "&course=" + encodeURIComponent(course)
        })
        .then(res => {
            if(!res.ok){
                throw new Error("Order creation failed");
            }
            return res.json();
        })
        .then(order => {

            if(!order.orderId){
                alert("Invalid order response");
                return;
            }

            var options = {
                key: order.key,
                amount: order.amount,
                currency: order.currency,
                order_id: order.orderId,
                name: "EduSphere",
                description: "Premium Plan - " + course,
                theme: { color: "#6c63ff" },

                handler: function (response){

                    console.log("Payment ID:", response.razorpay_payment_id);

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
            alert("Payment Failed ❌");
            console.error(err);
        });

    });

});
</script>


</body>
</html>
