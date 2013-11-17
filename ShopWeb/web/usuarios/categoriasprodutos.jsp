<%-- 
    Document   : produtos
    Created on : 27/10/2013, 14:04:41
    Author     : LuisPaulo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Produtos"%>
<%@page import="Models.Categorias"%>
 <%@include file="../header.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
      Integer idUsuario = ( Integer )( session.getAttribute("usuario") );
      Categorias categorias = new Categorias();
      ResultSet _categoriasDoUsuario = categorias.doUsuario( idUsuario  );
//      _usuario.next();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Meus produtos</title>
    </head>
    <body>
        <h1>Meus produtos</h1>
        <h3>Qual categoria do produto ?</h3>
        
         <div>
             <a href="../produtos/put.jsp?usuario=<%= session.getAttribute("usuario") %> ">Cadastrar produto</a>
        </div>
                <div>
            <table>
                <%  int nmCategorias = 0;
                    while (_categoriasDoUsuario.next()) {%> 

                <% if (nmCategorias == 0) {%>
                <tr>
                    <%}%>
                    <td><a href="../usuarios/prateleirasprodutos.jsp?idcategoria=<%=  _categoriasDoUsuario.getInt("ID_CATEGORIA_CAT") %>&usuario=<%= session.getAttribute("usuario") %>&categoria=<%= _categoriasDoUsuario.getString("ST_NOME_CAT")%>"> <%=_categoriasDoUsuario.getString("ST_NOME_CAT")%> </a><td> 

                        <%   
                             nmCategorias++;
                         if (nmCategorias == 3) {
                             nmCategorias = 0;
                        %>
                </tr>
                <%}%>

                <%}%>
            </table>
            <a href='../usuarios/home.jsp'>voltar</a>
        </div>
    </body>
</html>
