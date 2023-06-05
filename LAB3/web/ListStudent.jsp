<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ListStudent
    Created on : 02-06-2023, 09:19:09
    Author     : fxxki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Student</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="s" items="${list}">
                 <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td>
                        <c:if test="${s.gender==true}">Male</c:if>
                        <c:if test="${s.gender==false}">Female</c:if>
                    </td>
                    <td>${s.dob}</td>
                    <td><a href="UpdateStudent?id=${s.id}">Update</a></td>
                    <td><a href="DeleteStudent?id=${s.id}">Delete</a></td>
                </tr>
            </c:forEach>
               
            </tbody>
        </table>
        <a href="addstudent">Create<a/>
    </body>
</html>
