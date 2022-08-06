<%-- 
    Document   : newjsp
    Created on : Jul 18, 2022, 9:59:58 AM
    Author     : Tuan Be
--%>
<%@page import="sample.users.ParticipantsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%ParticipantsDTO us = (ParticipantsDTO) request.getAttribute("participantsConfirm");%>
        <h1><%=us.getEventID()%></h1>
        <h1><%=us.getUserID()%></h1>
        <img src="<%=us.getQrCode()%>">
    </body>
</html>
