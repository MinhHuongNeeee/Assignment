<%-- 
    Document   : infor
    Created on : Jul 9, 2022, 12:42:04 AM
    Author     : minh huong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information</title>
    </head>
    <body>
        <h1 style="font-size: 45px">FPT University Academic Portal</h1>
    <p style="background-color:rgb(255, 99, 71); font-size: 22px; height: 30px"><a href="view/homeStudent.jsp"> Home </a> | User Detail</p>
    <h1 style="text-align: center;font-size: 40px"> Information of ${requestScope.account.displayName}</h1>
    <table style="padding-left: 40px; font-size: 20px">
            <tr>
                <td style="width: 200px; height: 50px">User Name</td>
                <td>${requestScope.account.username}</td>
            </tr>
            <tr>
                <td style="width: 200px; height: 50px">Full Name</td>
                <td>${requestScope.account.displayName}</td>
            </tr>
            <tr>
                <td style="width: 200px; height: 50px">Gender</td>
                <c:if test="${requestScope.account.gender}">
                <td>Female</td>
                </c:if>
                <c:if test="${!requestScope.account.gender}">
                <td>Male</td>
                </c:if>
            </tr>
            <tr>
                <td style="width: 200px; height: 50px">Date of birth</td>
                <td>${requestScope.account.dob}</td>
            </tr>
            <tr>
                <td style="width: 200px; height: 50px">Address</td>
                <td>${requestScope.account.address}</td>
            </tr>
    </table>
            
    </body>
</html>
