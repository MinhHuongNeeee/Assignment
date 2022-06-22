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
    <form action="homeStudent" method="post">
        <h1 style="font-size: 45px"> <center>Academic information for ${requestScope.student.displayName} ${requestScope.student.ID}</center></h1>
        <div class="middle">
            <br/><br/>
            <div>
                <a style="text-decoration: none" href="gradeSemester" class="grade semester">Mark Report</a>
            </div>
            <div style="padding-top: 35px;">
                <a style="text-decoration: none" href="gradeTranscript" class="grade transcript">Grade Transcript</a>
            </div>           
        </div>
    </form>
</body>
</html>