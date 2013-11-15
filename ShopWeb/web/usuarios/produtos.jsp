<%-- 
    Document   : prateleiras
    Created on : 21/10/2013, 09:01:09
    Author     : LuisPaulo
--%>
<%@page import="Models.Produtos"%>
<%@page import="Models.Prateleiras"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Categorias"%>
<%
      Integer idUsuario = ( Integer )( session.getAttribute("usuario") );
      Integer idPrateleira =  Integer.parseInt(request.getParameter("prateleira"));
      Integer idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
      
      
      Produtos produtos = new Produtos();
      ResultSet _produtos = produtos.doUsuario( idUsuario,idPrateleira );

//      _prateleiras.next();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
    </head>
    <body>
        <h1> Editar produtos </h1>
        <h4>  </h4>
        <div>
            <table>
                <%  int nmProdutos = 0;
                    while (_produtos.next()) {%> 

                <% if (nmProdutos == 0) {%>
                <tr>
                    <%}%>
                    <td><a href="../produtos/post.jsp?produtos=<%=  _produtos.getInt("ID_PRODUTO_PRO") %>&usuario=<%= session.getAttribute("usuario") %>&idPrateleira=<%= idPrateleira %>"> <%=_produtos.getString("ST_NOME_PRO")%> </a><td> 
                        <%   
                             nmProdutos++;
                         if (nmProdutos == 3) {
                             nmProdutos = 0;
                        %>
                </tr>
                <%}%>

                <%}%>
            </table>
            <a href='javascript:history.back(1)'>cancelar</a>
        </div>

    </body>
</html>
