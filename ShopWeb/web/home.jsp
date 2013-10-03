<%-- 
    Document   : home
    Created on : 30/09/2013, 09:22:44
    Author     : LuisPaulo
--%>
<%
       
      String usuarioNome = (String) session.getAttribute("usuario_nome");
      String usuarioEmail = (String) session.getAttribute("usuario_email");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Olá! <%= usuarioNome %></h1><br>
        <h1>Seu email de cadastro é! <%= usuarioEmail %></h1><br>
        
    </body>
</html>
