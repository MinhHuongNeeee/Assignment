<%-- 
    Document   : viewGrade
    Created on : Jul 8, 2022, 8:38:27 PM
    Author     : minh huong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Grade</title>
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
        <style type="text/css">
            table, th, td{
                border:1px solid #ccc;
            }
            table{
                border-collapse:collapse;
                width:1100px;
            }
            th, td{
                text-align:left;
                padding:20px;
            }
            tr:hover{
                background-color: #ccc;
                cursor:pointer;
            }
        </style>
        <script>
            function showInfor(username) {
                window.location.href = "../infor?username=" + username;
            }
        </script>
    </head>
    <body>
        <h1 style="font-size: 45px">FPT University Academic Portal</h1>
        <p style="background-color:rgb(255, 99, 71); font-size: 22px"><a href="homeTeacher"> Home </a> | View-grade</p>
      
        <h1>Show grade of Group</h1>
        <form method="post" action="viewGrade">
            <div style="padding-left: 20px; width:200px;float: left;">
                <h3 style="font-size: 20px; color: #e76b1c;padding-left: 9px;">Choose Group</h3>
                <table>
                    <c:forEach items="${requestScope.groupName}" var ="g">                          
                        <div id="${g.groupName}" onclick="myFunction('${g.groupName}')"<c:if test="${param.groupName eq g.groupName}">style="font-weight: bold"</c:if>>
                            ${g.groupName}</div>      
                        </c:forEach>
                </table>
            </div>
            <div style="width:600px;float: left;height: 150px">
                <c:if test="${requestScope.groupList ne null}">
                    <h3 style="font-size: 20px; color: #e76b1c">Choose CourseID</h3>
                    <table>
                        <c:forEach items="${requestScope.groupList}" var ="gl">
                            <p id="${gl.courseID}" onclick="myFunction1('${gl.courseID}')"<c:if test="${param.courseID eq gl.courseID}">style="font-weight: bold"</c:if>>
                                ${gl.courseID}</p>                 
                            </c:forEach>
                    </table>
                </c:if>
            </div>
            <c:if test="${requestScope.listValueScore ne null}">
                <div style="padding-left: 20px; width:800px;float: left;">
                    <table style="border-collapse: inherit">
                        <tr>
                            <td></td>
                            <c:forEach items="${requestScope.asses}" var="a">
                                <td>${a.gradeCategory}</td> 
                            </c:forEach>
                            <td> Grade </td>
                            <td> Status </td>
                        <tr/>
                        <c:forEach items="${requestScope.stus}" var="s">
                            <tr>
                                <td id="${s.username}" onclick="showInfor('${s.username}')">${s.displayName}</td>
                                <c:forEach items="${requestScope.asses}" var="a">
                                    <td>
                                        <c:forEach items="${requestScope.listValueScore}" var="e">   
                                            <c:if test="${e.student.username eq s.username 
                                                          and e.assessment.gradeCategory eq a.gradeCategory and e.value>=0}">
                                                      ${e.value}
                                                  </c:if>
                                            </c:forEach>
                                        </td>                                        
                                    </c:forEach>
                                    <td>
                                        <c:forEach items="${requestScope.listGrade}" var="lgr">
                                            <c:if test="${requestScope.courseID eq lgr.course.courseID and
                                                          lgr.student.username eq s.username and lgr.grade >=0}">
                                                      ${lgr.grade} 
                                                  </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${requestScope.listGrade}" var="lgr">
                                                <c:if test="${requestScope.courseID eq lgr.course.courseID and
                                                              lgr.student.username eq s.username and lgr.status==-1}">
                                                      <p style="color: #01DFD7">      Studying </p>
                                                </c:if>
                                                <c:if test="${requestScope.courseID eq lgr.course.courseID and
                                                              lgr.student.username eq s.username and lgr.status==0}">
                                                      <p style="color: #FF0000">      Not Passed </p>
                                                </c:if>
                                                <c:if test="${requestScope.courseID eq lgr.course.courseID and
                                                              lgr.student.username eq s.username and lgr.status==1}">
                                                      <p style="color: #33CC33">      Passed </p>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </c:forEach>    
                            </table>
                        </div>
                    </c:if>
                    <br/>

                </form>
            </body>
        </html>
