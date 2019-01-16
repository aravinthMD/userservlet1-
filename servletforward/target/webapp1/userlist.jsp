<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Show All Users</title>
</head>
<body>
    <table border=1>
        <thead>
            <tr>
                <th>User</th>
                <th>DATE</th>
                <th>Phone NO</th>
                
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td><c:out value="${user.userid}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.phone}" /></td>
                    
                    <td><a href="ContactController?action=edit&userid=<c:out value="${user.userid}"/>">Update</a></td>
                    
                    <td><a href="ContactController?action=delete&userid=<c:out value="${user.userid}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="ContactController?action=insert">Add User</a></p>
</body>
</html>
    <!-- <p><a href="ContactController?action=insert">Add User</a></p>
    <!-- <jsp:forward page="UserDetailController" /> -->
   <!-- <p><a href="UserDetailController">LINK</a></p> -->
   
   <!-- <p><a href="UserDetailController">DETAILS</a>/></p> -->
