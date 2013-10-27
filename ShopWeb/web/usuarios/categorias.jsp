<%-- 
    Document   : categorias
    Created on : 21/10/2013, 09:48:54
    Author     : LuisPaulo
--%>
<%
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minhas Categorias</title>
    </head>
    <body>
        <h1>Minhas categorias cadastras</h1>
        
         <div>
             <a href="../categorias/put.jsp?usuario=<%= session.getAttribute("usuario") %> ">Cadastrar Categoria</a>
        </div>
    </body>
</html>
