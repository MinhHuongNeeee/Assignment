<%-- 
    Document   : Student
    Created on : Jun 8, 2022, 11:13:33 PM
    Author     : minh huong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HomeStudent</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/home.css" rel="stylesheet" type="text/css"/>
    <img src="Logo_Đại_học_FPT.png" alt="LogoFPTUniversity" style="width:250px;height:130px;">
</head>
<body>
    <a href="logout" style="position: fixed; right: 100px;top: 50px; font-style: oblique;font-size: 20px;color: #e76b1c">Logout</a>
    <a href="information" style="position: fixed; right: 165px;top: 50px; font-style: oblique;font-size: 20px;color: #e76b1c">Information of ${sessionScope.acc.username}|</a>
    <h1 style="font-size: 45px"> <center>Academic information for ${sessionScope.acc.displayName}</center></h1>
    <div class="middle">
        <br/><br/>
        <div>
            <a style="text-decoration: none; color: black;" href="gradeSemester" class="grade semester">Mark Report</a>
        </div>
        <div style="padding-top: 50px;">
            <a style="text-decoration: none; color: black;" href="gradeTranscript" class="grade transcript">Grade Transcript</a>
        </div>           
    </div>       
</body>
</html>