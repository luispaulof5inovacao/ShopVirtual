<%-- 
    Document   : prateleiras
    Created on : 21/10/2013, 09:01:09
    Author     : LuisPaulo
--%>
<%@page import="Models.Prateleiras"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Categorias"%>
 <%@include file="../header.html" %>
<%
      Integer idUsuario = ( Integer )( session.getAttribute("usuario") );
      Integer idPrateleira =  Integer.parseInt(request.getParameter("prateleira"));
      Integer idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
      
      Categorias categorias = new Categorias();
      ResultSet _categorias = categorias.doUsuario( idUsuario );
      
      Prateleiras prateleiras = new Prateleiras();
      ResultSet _prateleiras = prateleiras.comId( idPrateleira, idCategoria );

      _prateleiras.next();
%>
<%@ page language="java" 
contentType="text/html" 
pageEncoding="ISO-8859-1" 
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Prateleiras</title>
    </head>
    <body>
        <h1> Editar prateleira </h1>
        <h4>  </h4>
        <div>
            <form action="ControllerPrateleiras" method="post">

                <label>Nome</label><br>
                <input type="text" name="nome" id="nome" value="<%= _prateleiras.getString("ST_NOME_PRA")%>" required><br> 
                <label for="novacategoria"> Categoria da prateleira</label><br>                
                <select name="novacategoria" id="novacategoria" required>
                    <option value="<%= _prateleiras.getInt("ID_CATEGORIA_CAT")%>"><%= _prateleiras.getString("ST_NOME_CAT") %> </option>
                    
                    <% while(_categorias.next()) {%>
                     <option value="<%=_categorias.getInt("ID_CATEGORIA_CAT")%>"> <%=_categorias.getString("ST_NOME_CAT")%> </option>
                    <% } %>
                </select>
                <input type="hidden" name="usuario" id="usuario" value="<%= session.getAttribute("usuario") %>"> 
                <input type="hidden" name="prateleira" id="prateleira" value="<%= idPrateleira %>"> 
                <input type="hidden" name="categoria" id="categoria" value="<%= idCategoria %>"> 
                <input type="hidden" name="acao" id="acao" value="post"> 
                <br>
                <input type="submit" name="salvar" value="salvar">   
                <a href='javascript:history.back(1)'>cancelar</a>

            </form>
        </div>

    </body>
</html>
