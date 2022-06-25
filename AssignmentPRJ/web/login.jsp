<%-- 
    Document   : login
    Created on : Jun 25, 2022, 6:18:14 PM
    Author     : minh huong
--%>


<html>
    <head>
        <title>Login to FPTWebsite</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <main>
            <div class="background">
                <div class="container">
                    <div class="login-form">
                        <form action="login" method="post">
                            <center><h1>FPT EDUCATION</h1></center>                                
                            <div class="input-box">
                                <i ></i>
                                <input type="text" placeholder="Nhap username" name="user">
                            </div>
                            <div class="input-box">
                                <i ></i>
                                <input type="password" placeholder="Nhap mat khau" name="pass">
                            </div>
                            <p style="color:#FF0000; font-style: italic; text-align: center">${requestScope.error}</p>
                            <div class="btn-box">
                                <button type="submit">
                                    Login
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>