<%@page import="com.univ.pojo.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - EduSphere</title>
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pages.css">

     <style>
     
     
     .profile-input {
    width: 100%;
    padding: 8px;
    border-radius: 8px;
    border: 1px solid #334155;
    background: #1e293b;
    color: white;
    margin-top: 6px;
}
     
     .custom-file-upload {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-top: 10px;
}

.choose-btn {
    background: #f3f4f6;
    border: 1px solid #ddd;
    padding: 8px 14px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 14px;
    transition: 0.3s;
}

.choose-btn:hover {
    background: #e5e7eb;
}

#fileName {
    font-size: 13px;
    color: #666;
}

.upload-btn {
    margin-top: 12px;
    width: 100%;
}
     
     
        .profile-avatar-section {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

       
        .profile-image-form {
            display: flex;
            flex-direction: column;
            gap: 0.4rem;
        }
        
        
        .profile-header {
    display: flex;
    align-items: center;
    gap: 2rem;
}

.profile-avatar {
    width: 110px;
    height: 110px;
    border-radius: 50%;
    overflow: hidden;
    position: relative;
}

.profile-avatar-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
}

.avatar-overlay {
    position: absolute;
    inset: 0;
    background: rgba(0,0,0,0.6);
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 14px;
    cursor: pointer;
    opacity: 0;
    transition: 0.3s;
}

.profile-avatar:hover .avatar-overlay {
    opacity: 1;
}

.profile-avatar-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
}

        
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />
    
   <% Student student = (Student) session.getAttribute("loggedInStudent"); %>
    
    
    <!-- Profile Page -->
    <main class="profile-page">
        <div class="profile-container">
            <div class="profile-card">
            
            <c:if test="${not empty successMsg}">
    <div style="background:#22c55e;
                padding:10px;
                border-radius:8px;
                margin-bottom:15px;
                color:white;">
        ${successMsg}
    </div>
</c:if>
            
                <!-- Profile Header -->
                <div class="profile-header">

    <div class="profile-avatar-section">

<div class="profile-avatar-wrapper">

    <div class="profile-avatar">
        <img src="${pageContext.request.contextPath}/resources/images/profile/${student.profileImage}?v=${System.currentTimeMillis()}"
             class="profile-avatar-img"
             alt="Profile Picture"
             id="profileAvatarImg"/>
    </div>

   <form id="uploadForm"
      action="${pageContext.request.contextPath}/uploadProfileImage"
      method="post"
      enctype="multipart/form-data"
      class="profile-image-form">

    <!-- Hidden Real Input -->
    <input type="file"
           name="profileImage"
           id="profileImage"
           accept="image/*"
           hidden
           onchange="handleFileChange()" />

    <!-- Custom File Button -->
    <div class="custom-file-upload">
        <button type="button" onclick="triggerFileInput()" class="choose-btn">
            Choose Image
        </button>
        <span id="fileName">No file selected</span>
    </div>

    <!-- Upload Button -->
    <button type="button"
            class="btn btn-primary upload-btn"
            onclick="confirmUpload()">
        Upload
    </button>

</form>

</div>


    </div>

    <div class="profile-info">
        <h2>${student.first} ${student.last}</h2>
        <span class="profile-role">Student</span>
        <p class="profile-email">${student.email}</p>
    </div>

</div>
                
                
                <!-- Profile Details -->
                <form action="${pageContext.request.contextPath}/updateProfile" method="post" id="profileForm">
                
                <div class="profile-details">

    <!-- Phone -->
    <div class="profile-field">
        <div class="profile-field-label">Phone Number</div>
        <div class="profile-field-value" id="mobileText">${student.mobile}</div>

        <input type="text"
               name="mobile"
               value="${student.mobile}"
               id="mobileInput"
               class="profile-input"
               style="display:none;">
    </div>
              
               <!-- DOB -->
    <div class="profile-field">
        <div class="profile-field-label">Date of Birth</div>
        <div class="profile-field-value" id="dobText">${student.dob}</div>

        <input type="date"
               name="dob"
               value="${student.dob}"
               id="dobInput"
               class="profile-input"
               style="display:none;">
    </div>
                
               
    <!-- Gender -->
    <div class="profile-field">
        <div class="profile-field-label">Gender</div>
        <div class="profile-field-value" id="genderText">${student.gender}</div>

        <select name="gender"
                id="genderInput"
                class="profile-input"
                style="display:none;">
            <option value="male" ${student.gender=='male'?'selected':''}>Male</option>
            <option value="female" ${student.gender=='female'?'selected':''}>Female</option>
        </select>
    </div>
    
    
    
    <!-- Education -->
    <div class="profile-field">
        <div class="profile-field-label">Education Level</div>
        <div class="profile-field-value" id="eduText">${student.education}</div>

        <input type="text"
               name="education"
               value="${student.education}"
               id="eduInput"
               class="profile-input"
               style="display:none;">
    </div> 
    
    </div>
          
                    <div class="profile-field">
                        <div class="profile-field-label">Member Since</div>
                        <div class="profile-field-value">January 2024</div>
                    </div>
                    
                    <div class="profile-field">
                        <div class="profile-field-label">Subscription Status</div>
                        <div class="profile-field-value">
                            <span class="badge badge-premium">Premium Member</span>
                        </div>
                    </div>
                </div>
                
                  <!-- Profile Actions -->
   <div class="profile-actions">
    <button type="button" onclick="enableEdit()" id="editBtn" class="btn btn-primary">
    Edit Profile</button>

<button type="submit"
        id="saveBtn"
        class="btn btn-primary"
        style="display:none;">
    Save Changes
</button>

                    <button class="btn btn-secondary">Change Password</button>
                    <button class="btn btn-outline" onclick="EduSphere.handleLogout()">Logout</button>
                </div>
                </form>
                <!-- Learning Statistics -->
                <div style="margin: 2rem 0;">
                    <h3 style="margin-bottom: 1.5rem; color: var(--text-primary);">Learning Statistics</h3>
                    <div class="grid grid-3">
                        <div class="glass-card text-center">
                            <div style="font-size: 2rem; font-weight: 700; color: var(--accent-primary); margin-bottom: 0.5rem;">24</div>
                            <div style="font-size: 0.9rem; color: var(--text-tertiary);">Courses Enrolled</div>
                        </div>
                        <div class="glass-card text-center">
                            <div style="font-size: 2rem; font-weight: 700; color: var(--emerald); margin-bottom: 0.5rem;">156</div>
                            <div style="font-size: 0.9rem; color: var(--text-tertiary);">Quizzes Completed</div>
                        </div>
                        <div class="glass-card text-center">
                            <div style="font-size: 2rem; font-weight: 700; color: #F59E0B; margin-bottom: 0.5rem;">87%</div>
                            <div style="font-size: 0.9rem; color: var(--text-tertiary);">Average Score</div>
                        </div>
                    </div>
                </div>

 <!--<div class="profile-actions">   <a href="${pageContext.request.contextPath}/profile"
   class="btn btn-primary">Edit Profile
</a> -->
                
              
            </div>
            
            <!-- Recent Activity -->
            <div class="glass-card" style="margin-top: 2rem;">
                <h3 style="margin-bottom: 1.5rem; color: var(--text-primary);">Recent Activity</h3>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">📝</div>
                        <div class="activity-content">
                            <div class="activity-title">Completed Quiz: Advanced JavaScript</div>
                            <div class="activity-description">Score: 92% • 18/20 correct answers</div>
                            <div class="activity-time">2 hours ago</div>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background: var(--emerald);">📚</div>
                        <div class="activity-content">
                            <div class="activity-title">Enrolled in Course: Web Development Bootcamp</div>
                            <div class="activity-description">Premium course • 24 lessons</div>
                            <div class="activity-time">1 day ago</div>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background: #F59E0B;">🏆</div>
                        <div class="activity-content">
                            <div class="activity-title">Achievement Unlocked: Quiz Master</div>
                            <div class="activity-description">Completed 50 quizzes with 80%+ score</div>
                            <div class="activity-time">3 days ago</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />
    
    <!-- JavaScript Files -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    <script>
function openFileChooser() {
    document.getElementById("profileImage").click();
}

function autoUpload() {
    document.getElementById("uploadForm").submit();
}



function triggerFileInput() {
    document.getElementById("profileImage").click();
}

function handleFileChange() {
    const fileInput = document.getElementById("profileImage");
    const fileName = document.getElementById("fileName");
    const img = document.getElementById("profileAvatarImg");

    if (fileInput.files.length > 0) {
        fileName.innerText = fileInput.files[0].name;

        // Preview
        const reader = new FileReader();
        reader.onload = function(e) {
            img.src = e.target.result;
        };
        reader.readAsDataURL(fileInput.files[0]);
    }
}





function confirmUpload() {
    const fileInput = document.getElementById("profileImage");

    if (!fileInput.files.length) {
        alert("Please select an image first.");
        return;
    }

    const confirmation = confirm("Are you sure you want to upload this image?");

    if (confirmation) {
        document.getElementById("uploadForm").submit();
    }
}
</script>
<script>
function enableEdit() {

    // Hide text
    document.getElementById("mobileText").style.display = "none";
    document.getElementById("dobText").style.display = "none";
    document.getElementById("genderText").style.display = "none";
    document.getElementById("eduText").style.display = "none";

    // Show inputs
    document.getElementById("mobileInput").style.display = "block";
    document.getElementById("dobInput").style.display = "block";
    document.getElementById("genderInput").style.display = "block";
    document.getElementById("eduInput").style.display = "block";

    // Toggle buttons
    document.getElementById("editBtn").style.display = "none";
    document.getElementById("saveBtn").style.display = "inline-block";
}
</script>
    
</body>
</html>
