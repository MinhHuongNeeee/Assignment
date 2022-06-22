<%-- 
    Document   : gradeSemester
    Created on : Jun 22, 2022, 10:56:27 PM
    Author     : minh huong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GradeSemester</title>
    </head>
    <body>
        <form method="get" action="gradeSemester">
            <p style="background-color:rgb(255, 99, 71); font-size: 22px"><a href="homeStudent"> Home </a> | Grade-book</p>

            <h1>Grade report for ${requestScope.student.displayName} ${requestScope.student.ID}</h1>
            <div style="padding-left: 50px; width:250px;float: left;">
                <table >
                    <tr>
                        <td style="font-size: 20px; color: #e76b1c;">TERM</td>
                    </tr>
                    <c:forEach items="requestScope.studyList" var="s">
                        <tr>
                            <td style="font-size: 20px; color: #e76b1c;">${s.semester}</td>
                        </tr>                        
                    </c:forEach>
                </table>
            </div>
        </form>
    </body>
</html>
