
<% 
      String usuarioNome = (String) session.getAttribute("nome");
      String usuarioEmail = (String) session.getAttribute("email");
      
 %>
 <%@include file="../header.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Home</title>
    </head>
    <body>
        <br>
        <br>
        <h3>Olá! <%= usuarioNome %></h3><br>
        <h3>Seu email de cadastro é! <%= usuarioEmail %></h3><br>

    </body>
</html>
