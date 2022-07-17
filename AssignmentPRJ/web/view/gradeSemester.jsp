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
        </script>
        <script>
            function myFunction1(courseID) {
                document.getElementById(courseID).style.fontWeight = "bold";
//                alert('window.location.search() la ' +window.location.search  );
                if (!window.location.search.includes("courseID"))
                    window.location.href += "&courseID=" + courseID;
                else
                {
                    var link = window.location.href;
                    var str = [];
                    str = link.split('&', 2);
                    window.location.href = str[0] + "&courseID=" + courseID;
                }
            }
        </script>
    </head>
    <body>
        <h1 style="font-size: 45px">FPT University Academic Portal</h1>
        <form method="post" action="gradeSemester">
            <p style="background-color:rgb(255, 99, 71); font-size: 22px"><a href="homeStudent"> Home </a> | Grade-book</p>
            <h1>Grade report for ${sessionScope.acc.displayName}</h1>
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
                            <p id="${cid.course.courseID}" onclick="myFunction1('${cid.course.courseID}')"
                               <c:if test="${param.courseID eq cid.course.courseID}">style="font-weight: bold"</c:if>>
                                ${cid.course.courseName} (${cid.course.courseID})</p>
                            </tr>      
                            <br>
                        </c:forEach>
                    </table>
                </div>
            </c:if>
            <c:if test="${requestScope.listValueScore ne null}">
                <div style="width:350px;float: left;">
                    <h3 style="font-size: 20px; color: #e76b1c">GRADE REPORT</h3>
                    <table>
                        <tr>
                            <td><p style="font-size: 18px">GRADE CATEGORY</p></td>
                            <td><p style="font-size: 18px">WEIGHT</p></td>
                            <td><p style="font-size: 18px">VALUE</p></td>
                        </tr>

                        <c:forEach items="${requestScope.listValueScore}" var="lv">
                            <tr>
                                <td><p>${lv.assessment.gradeCategory}</p></td>
                                <td><p>${lv.assessment.weight} %</p></td>
                                <c:if test="${lv.value >=0}"><td><p>${lv.value}</p></td></c:if>
                                <c:if test="${lv.value <0}"><td><p></p></td></c:if>
                                </tr>
                        </c:forEach>
                        <tr>
                            <td><p>COURSE TOTAL</p></td>
                            <td><p>AVARAGE</p></td>
                            <c:if test="${requestScope.grade>=0}"><td><p>${requestScope.grade}</p></td></c:if>
                            <c:if test="${requestScope.grade<0}"><td><p></p></td></c:if>
                            </tr>
                            <tr>
                                <td><p></p></td>
                                <td><p>STATUS</p></td>
                            <c:if test="${requestScope.status ==-1}"><td><p style="color:#01DFD7">STUDYING</p></td></c:if>
                            <c:if test="${requestScope.status ==1}"><td><p style="color:#33CC33">PASSED</p></td></c:if>
                            <c:if test="${requestScope.status ==0}"><td><p style="color:#FF0000">NOTPASSED</p></td></c:if>
                            </tr>
                        </table>
                    </div>       
            </c:if>
            <c:if test="${requestScope.status ==1 or requestScope.status ==-1}">
                <script src="javascript.js"></script>
            </c:if>
            <c:if test="${requestScope.status ==0}">
                <script src="javascript1.js"></script>  
            </c:if>
        </form>
    </body>
</html>
