<%-- 
    Document   : categorias
    Created on : 21/10/2013, 09:01:09
    Author     : LuisPaulo
--%>

       
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Categorias"%>
<%@page import="Controllers.ControllerCategorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>Categorias</title>
    </head>
    <body>
        <h1>Cadastre uma nova categoria de produtos</h1>
        <div>
            <form action="ControllerCategorias" method="post">
                <label>Nome</label><br>
                <input type="text" name="nome" id="nome"  value=" <%=  _categoria.getString("ST_NOME_CAT")%>"  required><br>  
                <input type="hidden" name="usuario" id="usuario" value="<%= session.getAttribute("usuario") %>">   
                <input type="hidden" name="acao" id="post" value="post">    
                <input type="submit" name="salvar">       
            </form>
        </div>

    </body>
</html>