<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - EduSphere</title>
    
    <!-- CSS Files -->
   
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/navbar.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/auth.css">

</head>
<body>


    <!-- Auth Page -->
    <div class="auth-page">
        <div class="auth-container auth-container-lg">
            <!-- Registration Card -->
            <div class="auth-card">
                <div class="auth-header">
                    <div class="auth-logo">E</div>
                    <h2>Create Your Account</h2>
                    <p>Join EduSphere and start your learning journey today</p>
             
                    
                    
                    
                </div>
                
                <form action="${pageContext.request.contextPath}/addStudent" method="post" id="register-form" novalidate>
                    <!-- Name Row -->
                    <div class="form-row">
                        <div class="floating-label">
                            <input type="text" id="first-name" name="first" placeholder=" " required>
                            <label for="first-name">First Name</label>
                        </div>
                        <div class="floating-label">
                            <input type="text" id="last-name" name="last" placeholder=" " required>
                            <label for="last-name">Last Name</label>
                        </div>
                    </div>
                    
                    <!-- Email -->
                    <div class="form-group">
                        <div class="floating-label">
                            <input type="email" id="email" name="email" placeholder=" " required>
                            <label for="email">Email Address</label>
                        </div>
                    </div>
                    
                    <!-- Phone & Date of Birth -->
                    <div class="form-row">
                        <div class="floating-label">
                            <input type="tel" id="phone" name="mobile" placeholder=" " required>
                            <label for="phone">Mobile Number</label>
                        </div>
                        <div class="floating-label">
                            <input type="date" id="dob" name="dob" placeholder=" " required>
                            <label for="dob">Date of Birth</label>
                        </div>
                    </div>
                    
                    <!-- Password -->
                    <div class="form-group">
                        <div class="floating-label">
                            <input type="password" id="password" name="password" placeholder=" " required>
                            <label for="password">Password</label>
                        </div>
                        <div class="password-strength">
                            <div class="strength-bar" id="strength-bar"></div>
                        </div>
                    </div>
                    
                    <!-- Gender & Education Level -->
                    <div class="form-row">
                        <div class="form-group form-group-compact">
                            <label for="gender" class="form-label">Gender</label>
                            <select id="gender" name="gender" class="form-input" required>
                                <option value="">Select Gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        <div class="form-group form-group-compact">
                            <label for="education" class="form-label">Education Level</label>
                            <select id="education" name="education" class="form-input" required>
                                <option value="">Select Level</option>
                                <option value="high-school">High School</option>
                                <option value="undergraduate">Undergraduate</option>
                                <option value="graduate">Graduate</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                    </div>
                    
                    <!-- Terms & Conditions -->
                    <div class="form-group">
                        <div class="checkbox-group">
                            <input type="checkbox" id="terms" name="terms" required>
                            <label for="terms">I agree to the <a href="#" class="auth-link">Terms & Conditions</a></label>
                        </div>
                    </div>
                    
                    <input type="submit" value="Create Account" class="btn btn-primary btn-block btn-mt"/>  
                        
                    
                </form>
                
                <div class="divider">
                    <span>or</span>
                </div>
             <div style="display:flex; justify-content:center;">
    <button type="button" class="btn-social" onclick="googleLogin()">
        <span>🔵</span>
        <span>Continue with Google</span>
    </button>
</div>


   </div>
                
                <div class="form-footer">
                    <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login Here</a></p>
                </div>
                 <!-- Back to Home Link -->
                 <div class="auth-back">
                <a href="${pageContext.request.contextPath}/home" class="auth-back-link">
                    ← Back to Home
                </a>
            </div>
            </div>
     </div>
     
     
     <script>
document.getElementById("register-form").addEventListener("submit", function(e) {

    const password = document.getElementById("password").value;
    const terms = document.getElementById("terms").checked;

    if (password.length < 5) {
        alert("Password must be at least 6 characters!");
        e.preventDefault();
        return;
    }

    if (!terms) {
        alert("Please accept Terms & Conditions!");
        e.preventDefault();
        return;
    }
});
</script>
     
   
    
    <!-- JavaScript Files -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
    <!-- Firebase App (core) -->
<script src="https://www.gstatic.com/firebasejs/9.23.0/firebase-app-compat.js"></script>

<!-- Firebase Auth -->
<script src="https://www.gstatic.com/firebasejs/9.23.0/firebase-auth-compat.js"></script>

<script>
const firebaseConfig = {
  apiKey: "AIzaSyC4_qxkSFStOJFb_VxnIAFZacQaQLVHjDY",
  authDomain: "edusphere-11275.firebaseapp.com",
  projectId: "edusphere-11275",
  storageBucket: "edusphere-11275.firebasestorage.app",
  messagingSenderId: "788440027633",
  appId: "1:788440027633:web:29086385cf1ca9e5057450",
  measurementId: "G-RZ5NLWXJGQ"
};
</script>

    
  <script>
firebase.initializeApp(firebaseConfig);
const auth = firebase.auth();
</script>

  
  

<script>
function googleLogin() {
    const provider = new firebase.auth.GoogleAuthProvider();

    firebase.auth().signInWithPopup(provider)
        .then(async (result) => {
            const user = result.user;

            const idToken = await user.getIdToken();

            fetch("/EduSphere-New/googleLogin", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ idToken })
            })
            .then(res => res.text())
            .then(data => {
                if (data === "success") {
                    window.location.href = "/EduSphere-New/home";
                } else {
                    alert("Login failed");
                }
            });
        })
        .catch(err => {
            console.error(err);
            alert("Google login error");
        });
}
</script>





    
</body>
</html>