<%-- 
    Document   : homeTeacher
    Created on : Jul 6, 2022, 3:56:06 PM
    Author     : minh huong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HomeTeacher</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/home.css" rel="stylesheet" type="text/css"/>
    <img src="Logo_Đại_học_FPT.png" alt="LogoFPTUniversity" style="width:250px;height:130px;">
</head>
<body>
        <h1 style="font-size: 45px"> <center>Academic information for ${sessionScope.teacher.displayName}</center></h1>
        <div class="middle">
            <br/><br/>
            <div>
                <a style="text-decoration: none; color: black;" href="addGrade" class="grade add">Add Grade</a>
            </div>
            <div style="padding-top: 50px;">
                <a style="text-decoration: none; color: black;" href="viewGrade" class="grade view">View Grade</a>
            </div>           
        </div>
</body>
</html>