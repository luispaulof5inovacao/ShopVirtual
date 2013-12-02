<%-- 
    Document   : categorias
    Created on : 21/10/2013, 09:01:09
    Author     : LuisPaulo
--%>

       
<%@page import="Controllers.ControllerCategorias"%>
<%@ page language="java" 
contentType="text/html" 
pageEncoding="ISO-8859-1" 
%> 
 <%@include file="../header.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Categorias</title>
    </head>
    <body>
        <h1>Cadastre uma nova categoria de produtos</h1>
        <div>
            <form action="ControllerCategorias" method="post">
                <label>Nome</label><br>
                <input type="text" size="50"  name="nome" id="nome"  placeholder="Categoria" required><br> 
                <label>Descrição<br> <textarea name="descricao" cols="40" rows="5" required></textarea></label>  
                <input type="hidden" name="usuario" id="usuario" value="<%= session.getAttribute("usuario") %>">    
                <input type="hidden" name="acao" id="put" value="put"><br>    
                <input type="submit" name="salvar" value="Cadastrar">    
               <a href='javascript:history.back(1)'>cancelar</a>
            </form>
        </div>

    </body>
</html>
