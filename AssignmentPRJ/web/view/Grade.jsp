<%-- 
    Document   : Grade
    Created on : Jun 20, 2022, 12:10:53 AM
    Author     : minh huong
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <form method="get" action="view">      
            <table>
                <tr>
                    <td>TERM</td>
                </tr>
                <tr>
                    <td><p onclick="myFunction('Summer2021')">Summer2021</td>
                </tr>   
                <tr>
                    <td><p onclick="myFunction('Fall2021')">Fall2021</p></td>           
                </tr>  
                <tr>
                    <td><p onclick="myFunction('Spring2022')">Spring2022</p></td>
                </tr>  
                <tr>
                    <td><p onclick="myFunction('Summer2022')">Summer2022</p></td>
                </tr>             
            </table>
        </form>
    </body>
    <script>
        function myFunction(Kyhoc) {
            document.getElementById(Kyhoc).style.fontWeight = "bold";
            window.location = "view?term=" + Kyhoc;
        }
    </script>
</html>