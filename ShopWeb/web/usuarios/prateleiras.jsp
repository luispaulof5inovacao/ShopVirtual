<%-- 
    Document   : prateleiras
    Created on : 23/10/2013, 09:31:02
    Author     : LuisPaulo
--%>
<%@page import="Models.Prateleiras"%>
<%@page import="java.sql.ResultSet"%>

<%
//      int idUsuario =  Integer.parseInt ( session.getAttribute("usuario") ); 
//      String temp = (String)session.getAttribute("usuario"); 
      Integer idUsuario = ( Integer )( session.getAttribute("usuario") );
      Integer idCategoria = ( Integer )( session.getAttribute("categoria") );
      
      Prateleiras prateleiras = new Prateleiras();
      ResultSet _prateleirasDaCategoria = prateleiras.daCategoria( idCategoria  );
      
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
        <h2></h2>
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
