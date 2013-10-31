<%-- 
    Document   : categorias
    Created on : 21/10/2013, 09:48:54
    Author     : LuisPaulo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Categorias"%>
<%
//      int idUsuario =  Integer.parseInt ( session.getAttribute("usuario") ); 
//      String temp = (String)session.getAttribute("usuario"); 
      Integer idUsuario = ( Integer )( session.getAttribute("usuario") );
      Categorias categorias = new Categorias();
      ResultSet _categoriasDoUsuario = categorias.doUsuario( idUsuario  );
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
        <div>
            <table>
                <%  int nmCategorias = 0;
                    while (_categoriasDoUsuario.next()) {%> 

                <% if (nmCategorias == 0) {%>
                <tr>
                    <%}%>
                    <td><a href="#"> <%=_categoriasDoUsuario.getString("ST_NOME_CAT")%></a><td> 

                        <%   
                             nmCategorias++;
                         if (nmCategorias == 3) {
                             nmCategorias = 0;
                        %>
                </tr>
                <%}%>

                <%}%>
            </table>
        </div>
    </body>
</html>
