<%-- 
    Document   : AddStudent
    Created on : 02-06-2023, 09:45:03
    Author     : fxxki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Studdent</title>
    </head>
    <body>
        <form action="addstudent" method="POST">
            Name: <input type="text" name="name"/>
            <br>
            Gender: <input type="radio" id="radio1" name="radio_option" value="true" >
                    <label for="radio1">Male</label>
                    <input type="radio" id="radio2" name="radio_option" value="false" >
                    <label for="radio2">Female</label>                    
            <br>
            DOB: <input type="text" name="dob"/>
            <br>
            <input type="submit" value="Create"/>

    </body>
</html>
