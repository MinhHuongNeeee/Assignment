<%-- 
    Document   : gradeTranscript
    Created on : Jul 5, 2022, 10:53:35 AM
    Author     : minh huong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grade Transcript</title>
        <style type="text/css">
            table, th, td{
                border:1px solid #ccc;
            }
            table{
                border-collapse:collapse;
                width:100%;
            }
            th, td{
                text-align:left;
                padding:10px;
            }
            tr:hover{
                background-color:#ddd;
                cursor:pointer;
            }
        </style>
    </head>
    <body>
        <form method="post" action="gradeTranscript">
            <p style="background-color:rgb(255, 99, 71); font-size: 22px"><a href="homeStudent.jsp"> Home </a> | Grade Transcript</p>
            <h1 style="text-align: center;font-size: 50px ">Grade report transcript for  ${sessionScope.student.displayName}</h1>
            <table>
                <thead style="background-color:#FF9900;text-align: center">
                    <tr>
                        <td style="width: 150px"><p style="font-size: 20px">Course ID</p> </td>
                        <td style="width: 450px"><p style="font-size: 20px">Course Name</p> </td>
                        <td style="width: 150px"><p style="font-size: 20px">Credit</p> </td>
                        <td style="width: 200px"><p style="font-size: 20px">Grade</p> </td>
                        <td style="width: 200px"><p style="font-size: 20px">Status</p> </td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.studies}" var="s">
                      <tr>
                        <td style="width: 150px"><p style="font-size: 18px">${s.course.courseID}</p> </td>
                        <td style="width: 450px"><p style="font-size: 18px">${s.course.courseName}</p> </td>
                        <td style="width: 150px"><p style="font-size: 18px">${s.course.credit}</p> </td>
                        <c:if test="${s.grade>=0}"><td style="width: 200px"><p style="font-size: 18px">${s.grade}</p> </td></c:if>
                        <c:if test="${s.grade<0}"><td><p></p></td></c:if>
                        <c:if test="${s.status==1}"><td style="width: 200px"><p style="font-size: 18px;color:#33CC33">PASSED</p> </td></c:if>
                        <c:if test="${s.status==0}"><td style="width: 200px"><p style="font-size: 18px;color:#FF0000">NOT PASSED</p> </td></c:if>
                        <c:if test="${s.status==-1}"><td style="width: 200px"><p style="font-size: 18px;color:#01DFD7">STUDYING</p> </td></c:if>
                        <c:if test="${s.status==-2}"><td style="width: 200px"><p style="font-size: 18px;color:#808080">NOT STARTED</p> </td></c:if>
                        
                    </tr>  
                        
                    </c:forEach>
                </tbody>
            </table>
    </body>
</html>
