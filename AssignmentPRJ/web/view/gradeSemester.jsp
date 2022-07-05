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
                                <c:if test="${lv.value != -1}"><td><p>${lv.value}</p></td></c:if>
                                <c:if test="${lv.value == -1}"><td><p></p></td></c:if>
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
                <script type='text/javascript'>
//<![CDATA[
                    var pictureSrc = "https://1.bp.blogspot.com/-CXx9jt2JMRk/Vq-Lh5fm88I/AAAAAAAASwo/XivooDn_oSY/s1600/hoamai.png"; //the location of the snowflakes
                    var pictureWidth = 25; //the width of the snowflakes
                    var pictureHeight = 25; //the height of the snowflakes
                    var numFlakes = 10; //the number of snowflakes
                    var downSpeed = 0.01; //the falling speed of snowflakes (portion of screen per 100 ms)
                    var lrFlakes = 6; //the speed that the snowflakes should swing from side to side


                    if (typeof (numFlakes) != 'number' || Math.round(numFlakes) != numFlakes || numFlakes < 1) {
                        numFlakes = 10;
                    }

//draw the snowflakes
                    for (var x = 0; x < numFlakes; x++) {
                        if (document.layers) { //releave NS4 bug
                            document.write('<layer id="snFlkDiv' + x + '"><imgsrc="' + pictureSrc + '" height="' + pictureHeight + '"width="' + pictureWidth + '" alt="*" border="0"></layer>');
                        } else {
                            document.write('<div style="position:absolute; z-index:9999;"id="snFlkDiv' + x + '"><img src="' + pictureSrc + '"height="' + pictureHeight + '" width="' + pictureWidth + '" alt="*"border="0"></div>');
                        }
                    }

//calculate initial positions (in portions of browser window size)
                    var xcoords = new Array(), ycoords = new Array(), snFlkTemp;
                    for (var x = 0; x < numFlakes; x++) {
                        xcoords[x] = (x + 1) / (numFlakes + 1);
                        do {
                            snFlkTemp = Math.round((numFlakes - 1) * Math.random());
                        } while (typeof (ycoords[snFlkTemp]) == 'number');
                        ycoords[snFlkTemp] = x / numFlakes;
                    }

//now animate
                    function flakeFall() {
                        if (!getRefToDivNest('snFlkDiv0')) {
                            return;
                        }
                        var scrWidth = 0, scrHeight = 0, scrollHeight = 0, scrollWidth = 0;
//find screen settings for all variations. doing this every time allows for resizing and scrolling
                        if (typeof (window.innerWidth) == 'number') {
                            scrWidth = window.innerWidth;
                            scrHeight = window.innerHeight;
                        } else {
                            if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
                                scrWidth = document.documentElement.clientWidth;
                                scrHeight = document.documentElement.clientHeight;
                            } else {
                                if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
                                    scrWidth = document.body.clientWidth;
                                    scrHeight = document.body.clientHeight;
                                }
                            }
                        }
                        if (typeof (window.pageYOffset) == 'number') {
                            scrollHeight = pageYOffset;
                            scrollWidth = pageXOffset;
                        } else {
                            if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
                                scrollHeight = document.body.scrollTop;
                                scrollWidth = document.body.scrollLeft;
                            } else {
                                if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
                                    scrollHeight = document.documentElement.scrollTop;
                                    scrollWidth = document.documentElement.scrollLeft;
                                }
                            }
                        }
//move the snowflakes to their new position
                        for (var x = 0; x < numFlakes; x++) {
                            if (ycoords[x] * scrHeight > scrHeight - pictureHeight) {
                                ycoords[x] = 0;
                            }
                            var divRef = getRefToDivNest('snFlkDiv' + x);
                            if (!divRef) {
                                return;
                            }
                            if (divRef.style) {
                                divRef = divRef.style;
                            }
                            var oPix = document.childNodes ? 'px' : 0;
                            divRef.top = (Math.round(ycoords[x] * scrHeight) + scrollHeight) + oPix;
                            divRef.left = (Math.round(((xcoords[x] * scrWidth) - (pictureWidth / 2)) + ((scrWidth / ((numFlakes + 1) * 4)) * (Math.sin(lrFlakes * ycoords[x]) - Math.sin(3 * lrFlakes * ycoords[x])))) + scrollWidth) + oPix;
                            ycoords[x] += downSpeed;
                        }
                    }

//DHTML handlers
                    function getRefToDivNest(divName) {
                        if (document.layers) {
                            return document.layers[divName];
                        } //NS4
                        if (document[divName]) {
                            return document[divName];
                        } //NS4 also
                        if (document.getElementById) {
                            return document.getElementById(divName);
                        } //DOM (IE5+, NS6+, Mozilla0.9+, Opera)
                        if (document.all) {
                            return document.all[divName];
                        } //Proprietary DOM - IE4
                        return false;
                    }

                    window.setInterval('flakeFall();', 100);
//]]>
                </script>  
            </c:if>
            <c:if test="${requestScope.status ==0}">
                <script type='text/javascript'>
//<![CDATA[
                    var pictureSrc = "https://www.emojimeaning.com/img/img-apple-160/1f4b8.png"; //the location of the snowflakes
                    var pictureWidth = 25; //the width of the snowflakes
                    var pictureHeight = 25; //the height of the snowflakes
                    var numFlakes = 10; //the number of snowflakes
                    var downSpeed = 0.01; //the falling speed of snowflakes (portion of screen per 100 ms)
                    var lrFlakes = 6; //the speed that the snowflakes should swing from side to side


                    if (typeof (numFlakes) != 'number' || Math.round(numFlakes) != numFlakes || numFlakes < 1) {
                        numFlakes = 10;
                    }

//draw the snowflakes
                    for (var x = 0; x < numFlakes; x++) {
                        if (document.layers) { //releave NS4 bug
                            document.write('<layer id="snFlkDiv' + x + '"><imgsrc="' + pictureSrc + '" height="' + pictureHeight + '"width="' + pictureWidth + '" alt="*" border="0"></layer>');
                        } else {
                            document.write('<div style="position:absolute; z-index:9999;"id="snFlkDiv' + x + '"><img src="' + pictureSrc + '"height="' + pictureHeight + '" width="' + pictureWidth + '" alt="*"border="0"></div>');
                        }
                    }

//calculate initial positions (in portions of browser window size)
                    var xcoords = new Array(), ycoords = new Array(), snFlkTemp;
                    for (var x = 0; x < numFlakes; x++) {
                        xcoords[x] = (x + 1) / (numFlakes + 1);
                        do {
                            snFlkTemp = Math.round((numFlakes - 1) * Math.random());
                        } while (typeof (ycoords[snFlkTemp]) == 'number');
                        ycoords[snFlkTemp] = x / numFlakes;
                    }

//now animate
                    function flakeFall() {
                        if (!getRefToDivNest('snFlkDiv0')) {
                            return;
                        }
                        var scrWidth = 0, scrHeight = 0, scrollHeight = 0, scrollWidth = 0;
//find screen settings for all variations. doing this every time allows for resizing and scrolling
                        if (typeof (window.innerWidth) == 'number') {
                            scrWidth = window.innerWidth;
                            scrHeight = window.innerHeight;
                        } else {
                            if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
                                scrWidth = document.documentElement.clientWidth;
                                scrHeight = document.documentElement.clientHeight;
                            } else {
                                if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
                                    scrWidth = document.body.clientWidth;
                                    scrHeight = document.body.clientHeight;
                                }
                            }
                        }
                        if (typeof (window.pageYOffset) == 'number') {
                            scrollHeight = pageYOffset;
                            scrollWidth = pageXOffset;
                        } else {
                            if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
                                scrollHeight = document.body.scrollTop;
                                scrollWidth = document.body.scrollLeft;
                            } else {
                                if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
                                    scrollHeight = document.documentElement.scrollTop;
                                    scrollWidth = document.documentElement.scrollLeft;
                                }
                            }
                        }
//move the snowflakes to their new position
                        for (var x = 0; x < numFlakes; x++) {
                            if (ycoords[x] * scrHeight > scrHeight - pictureHeight) {
                                ycoords[x] = 0;
                            }
                            var divRef = getRefToDivNest('snFlkDiv' + x);
                            if (!divRef) {
                                return;
                            }
                            if (divRef.style) {
                                divRef = divRef.style;
                            }
                            var oPix = document.childNodes ? 'px' : 0;
                            divRef.top = (Math.round(ycoords[x] * scrHeight) + scrollHeight) + oPix;
                            divRef.left = (Math.round(((xcoords[x] * scrWidth) - (pictureWidth / 2)) + ((scrWidth / ((numFlakes + 1) * 4)) * (Math.sin(lrFlakes * ycoords[x]) - Math.sin(3 * lrFlakes * ycoords[x])))) + scrollWidth) + oPix;
                            ycoords[x] += downSpeed;
                        }
                    }

//DHTML handlers
                    function getRefToDivNest(divName) {
                        if (document.layers) {
                            return document.layers[divName];
                        } //NS4
                        if (document[divName]) {
                            return document[divName];
                        } //NS4 also
                        if (document.getElementById) {
                            return document.getElementById(divName);
                        } //DOM (IE5+, NS6+, Mozilla0.9+, Opera)
                        if (document.all) {
                            return document.all[divName];
                        } //Proprietary DOM - IE4
                        return false;
                    }

                    window.setInterval('flakeFall();', 100);
//]]>
                </script>  
            </c:if>
        </form>
    </body>
</html>
