<%-- 
    Document   : prateleiras
    Created on : 23/10/2013, 09:31:02
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
        <title>Minhas prateleiras</title>
    </head>
    <body>
        <h1>Minhas prateleiras</h1>
        <h2>Selecione a categoria</h2>
<!--         <div>
             <a href="../prateleiras/put.jsp?usuario=<%= session.getAttribute("usuario") %> ">Cadastrar prateleira</a>
        </div>-->
        <div>
            <table>
                <%  int nmCategorias = 0;
                    while (_categoriasDoUsuario.next()) {%> 

                <% if (nmCategorias == 0) {%>
                <tr>
                    <%}%>
                    <td><a href="../usuarios/prateleiras.jsp?categoria=<%=  _categoriasDoUsuario.getInt("ID_CATEGORIA_CAT") %>&usuario=<%= session.getAttribute("usuario") %>"> <%=_categoriasDoUsuario.getString("ST_NOME_CAT")%> </a><td> 

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