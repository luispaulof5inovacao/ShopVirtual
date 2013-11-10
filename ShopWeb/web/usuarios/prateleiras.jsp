<%-- 
    Document   : prateleiras
    Created on : 23/10/2013, 09:31:02
    Author     : LuisPaulo
--%>
<%@page import="Models.Categorias"%>
<%@page import="Models.Prateleiras"%>
<%@page import="java.sql.ResultSet"%>

<%
//      int idUsuario =  Integer.parseInt ( session.getAttribute("usuario") ); 
//      String temp = (String)session.getAttribute("usuario"); 
      Integer idUsuario = ( Integer )( session.getAttribute("usuario") );
      Integer idCategoria = Integer.parseInt(request.getParameter("categoria"));
      
      Prateleiras prateleiras = new Prateleiras();
      ResultSet _prateleirasDaCategoria = prateleiras.daCategoria( idCategoria  );
      
//      Categorias categorias = new Categorias();
//      ResultSet _categoria = categorias.categoria(idUsuario, idCategoria);
//      _categoria.next();
      
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prateleiras</title>
    </head>
    <body>
        <h1>Prateleiras</h1>
        <h2>Da categoria <% // _categoria.getString("ST_NOME_CAT") %></h2>
<!--         <div>
             <a href="../prateleiras/put.jsp?usuario=<%= session.getAttribute("usuario") %> ">Cadastrar prateleira</a>
        </div>-->
        <div>
            <table>
                <%  int nmPrateleiras = 0;
                    while (_prateleirasDaCategoria.next()) {%> 

                <% if (nmPrateleiras == 0) {%>
                <tr>
                    <%}%>
                    <td><a href="../prateleiras/post.jsp?prateleira=<%=  _prateleirasDaCategoria.getInt("ID_PRATELEIRA_PRA") %>&usuario=<%= session.getAttribute("usuario") %>"> <%=_prateleirasDaCategoria.getString("ST_NOME_PRA")%> </a><td> 
                        <%   
                             nmPrateleiras++;
                         if (nmPrateleiras == 3) {
                             nmPrateleiras = 0;
                        %>
                </tr>
                <%}%>

                <%}%>
            </table>
            <a href='../usuarios/home.jsp'>voltar</a>
        </div>
    </body>
</html>
