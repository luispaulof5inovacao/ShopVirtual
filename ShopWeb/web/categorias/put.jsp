<%-- 
    Document   : categorias
    Created on : 21/10/2013, 09:01:09
    Author     : LuisPaulo
--%>
<%
       
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
    </head>
    <body>
        <h1>Cadastre uma nova categoria de produtos</h1>
        <div>
            <form action="ControllerCategorias" method="post">
                <label>Nome</label><br>
                <input type="text" name="nome" id="nome" required><br>  
                <input type="hidden" name="usuario" id="usuario" value="<%= session.getAttribute("usuario") %>">    
                <input type="submit" name="salvar">       
            </form>
        </div>

    </body>
</html>
