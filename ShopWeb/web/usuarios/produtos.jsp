<%-- 
    Document   : produtos
    Created on : 27/10/2013, 14:04:41
    Author     : LuisPaulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meus produtos</title>
    </head>
    <body>
        <h1>Meus produtos</h1>
        
         <div>
             <a href="../produtos/put.jsp?usuario=<%= session.getAttribute("usuario") %> ">Cadastrar produto</a>
        </div>
    </body>
</html>
