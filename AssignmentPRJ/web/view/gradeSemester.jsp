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
        <script>
            function myFunction(Kyhoc) {
                document.getElementById(Kyhoc).style.fontWeight = "bold";
                window.location.href = "?term=" + Kyhoc;
            }
            function myFunction1(courseID) {
                document.getElementById(courseID).style.fontWeight = "bold";
                window.location.href = window.location.search()+ "&courseID=" + courseID;
            }
        </script>
    </head>
    <body>
        <form method="post" action="gradeSemester">
            <p style="background-color:rgb(255, 99, 71); font-size: 22px"><a href="homeStudent.jsp"> Home </a> | Grade-book</p>
            <h1>Grade report for ${sessionScope.student.displayName}</h1>
            <div style="padding-left: 50px; width:250px;float: left;">
                <h3 style="font-size: 20px; color: #e76b1c;padding-left: 9px;">TERM</h3>
                <table>
                    <c:forEach items="${sessionScope.studyList}" var="t">
                        <tr>
                        <p id="${t.semester}" onclick="myFunction('${t.semester}')"<c:if test="${param.term eq t.semester}">style="font-weight: bold"</c:if>>
                            ${t.semester}</p>
                        </tr>      
                        <br>
                    </c:forEach>
                </table>
            </div>
            <c:if test="${requestScope.studyListToShowCourseID ne null}">
                <div style="width:500px;float: left;">
                    <h3 style="font-size: 20px; color: #e76b1c">COURSE</h3>
                    <table>
                        <c:forEach items="${requestScope.studyListToShowCourseID}" var="cid">
                            <tr>
                            <p id="${cid.course.courseID}" onclick="myFunction1('${cid.course.courseID}')">
                                ${cid.course.courseName} (${cid.course.courseID})</p>
                            </tr>      
                            <br>
                        </c:forEach>
                    </table>
                </div>
            </c:if>
<!--            <c:if test="${requestScope.listValueScore ne null}">
                <div style="width:500px;float: left;">
                    <h3 style="font-size: 20px; color: #e76b1c">Grade Report </h3>                   
                </div>
            </c:if>
            <c:if test="${requestScope.studyListToShowCourseID ne null} && ${requestScope.listValueScore eq null }">
                <div style="width:500px;float: left;">
                    <h3 style="font-size: 20px; color: #e76b1c">NULL </h3>                   
                </div>
            </c:if> -->
        </form>
    </body>
</html>
