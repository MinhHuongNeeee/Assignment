<%-- 
    Document   : addGrade
    Created on : Jul 6, 2022, 5:13:37 PM
    Author     : minh huong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Grade</title>
        <script>
            function myFunction(groupName) {
                document.getElementById(groupName).style.fontWeight = "bold";
                window.location.href = "?groupName=" + groupName;
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
        <p style="background-color:rgb(255, 99, 71); font-size: 22px"><a href="homeTeacher.jsp"> Home </a> | Add-grade</p>
        <h1>Insert grade for Student</h1>
        <form method="post" action="addGrade">
            Choose Group:
            <c:forEach items="${requestScope.groupName}" var ="g">                          
                <p id="${g.groupName}" onclick="myFunction('${g.groupName}')"<c:if test="${param.groupName eq g.groupName}">style="font-weight: bold"</c:if>>
                    ${g.groupName}</p>      
                </c:forEach>
            <br/>
            <c:if test="${requestScope.groupList ne null}">
                Choose CourseID: 
                <c:forEach items="${requestScope.groupList}" var ="gl">
                    <p id="${gl.courseID}" onclick="myFunction1('${gl.courseID}')"<c:if test="${param.courseID eq gl.courseID}">style="font-weight: bold"</c:if>>
                        ${gl.courseID}</p>                 
                    </c:forEach>
        </c:if>
        <br/>
        <c:if test="${requestScope.listValueScore ne null}">
            <table border="1px">
                <tr>
                    <td></td>
                    <c:forEach items="${requestScope.asses}" var="a">
                        <td>${a.gradeCategory}</td> 
                    </c:forEach>
                <tr/>
                <c:forEach items="${requestScope.stus}" var="s">
                    <tr>
                        <td>${s.displayName}</td>
                        <c:forEach items="${requestScope.asses}" var="a">
                            <td>
                                <input name="score${s.username}_${a.gradeCategory}" class="short_textfield" type="text"
                                       <c:forEach items="${requestScope.listValueScore}" var="e">   
                                           <c:if test="${e.student.username eq s.username 
                                                         and e.assessment.gradeCategory eq a.gradeCategory and e.value>=0}">
                                                 value="${e.value}"
                                           </c:if>
                                       </c:forEach>
                                       />
                                <input name="eid${s.username}_${a.gradeCategory}" type="hidden"
                                       <c:forEach items="${requestScope.listValueScore}" var="e">   
                                           <c:if test="${e.student.username eq s.username and e.assessment.gradeCategory eq a.gradeCategory}">
                                               value="${e.said}"
                                           </c:if>
                                       </c:forEach>
                                       />
                                <input name="component" value="${s.username}_${a.gradeCategory}" type="text" hidden
                                       />
                            </td> 
                        </c:forEach>
                    <tr/>  
                </c:forEach>
            </table>
            <input type="text" hidden name="name" value="${requestScope.name}">
            <input type="text" hidden name="courseID" value="${requestScope.courseID}">
            <input type="submit" value="Save"/>     
        </c:if>
        <br/>

    </form>
</body>
</html>
