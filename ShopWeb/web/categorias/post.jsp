<%-- 
    Document   : categorias
    Created on : 21/10/2013, 09:01:09
    Author     : LuisPaulo
--%>

       
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Categorias"%>
<%@page import="Controllers.ControllerCategorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@include file="../header.html" %>

<%
      int idUsuario = Integer.parseInt( request.getParameter("usuario") );      
      int idCategoria= Integer.parseInt( request.getParameter("categoria") );
      
      Categorias  categorias = new Categorias();
      ResultSet _categoria = categorias.categoria( idUsuario, idCategoria );
      _categoria.next();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Categorias</title>
    </head>
    <body>
        <h1>Categoria <%=  _categoria.getString("ST_NOME_CAT") %></h1>
        <h3>Editar categoria</h3>
        <div>
            <form action="ControllerCategorias" method="post">
                <label>Nome</label><br>
                <input type="text" name="nome" id="nome"  value=" <%=  _categoria.getString("ST_NOME_CAT")%>"  required><br>  
                <input type="hidden" name="usuario" id="usuario" value="<%= session.getAttribute("usuario") %>">   
                <input type="hidden" name="categoria" id="categoria" value="<%= idCategoria %>">   
                <input type="hidden" name="acao" id="post" value="post">    
                <input type="submit" name="salvar" value="salvar" >  
                <a href='javascript:history.back(1)'>cancelar</a>
            </form>
        </div>

    </body>
</html>
