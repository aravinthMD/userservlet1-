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
                <th>From</th>
                <th>To</th>      
                <th>MESSAGE</th>
                <th>SUBJECT</th>
                
                
                
                
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td><c:out value="${user.userid}" /></td>
                    <td><c:out value="${user.date}" /></td>
                    <td><c:out value="${user.from}" /></td>
                    <td><c:out value="${user.to}" /></td>
                    <td><c:out value="${user.message}" /></td>
                    <td><c:out value="${user.subject}" /></td>
                    
                    
                    
                    <td><a href="InboxController?action=edit&userid=<c:out value="${user.userid}"/>">Update</a></td>
                    
                    <td><a href="InboxController?action=delete&userid=<c:out value="${user.userid}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="InboxController?action=insert">Add User</a></p>
    <p><a href="UserDetailController">DETAILS</a>/></p>
</body>


