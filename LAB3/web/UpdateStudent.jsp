<%-- 
    Document   : UpdateStudent
    Created on : 02-06-2023, 10:18:08
    Author     : fxxki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UpdateStudent" method="POST">
            ID: <input type="text" name="id" value="${s.id}"/>
            <br>
            Name: <input type="text" name="name" value="${s.name}"/>
            <br>
            Gender: <input type="radio" id="radio1" name="radio_option" value="${s.gender}" >
                    <label for="radio1">Male</label>
                    <input type="radio" id="radio2" name="radio_option" value="${s.gender}" >
                    <label for="radio2">Female</label>                    
            <br>
            DOB: <input type="text" name="dob" value="${s.dob}"/>
            <br>
            <input type="submit" value="Update"/>
    </body>
</html>
