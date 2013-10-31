<%-- 
    Document   : prateleiras
    Created on : 21/10/2013, 09:01:09
    Author     : LuisPaulo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Categorias"%>
<%
      Categorias categorias = new Categorias();
      ResultSet _categorias = categorias.getCategorias();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prateleiras</title>
    </head>
    <body>
        <h1> Cadastre uma nova prateleira </h1>
        <div>
            <form action="ControllerPrateleiras" method="post">

                <label>Nome</label><br>
                <input type="text" name="nome" id="nome" required><br> 
                <label for="categoria"> Categoria da prateleira</label><br>                
                <select name="categoria" id="categoria" required>
                    <option value=""> </option>
                    <% while(_categorias.next()) {%>
                     <option value="<%=_categorias.getInt("ID_CATEGORIA_CAT")%>"> <%=_categorias.getString("ST_NOME_CAT")%> </option>
                    <% } %>
                </select>
                <input type="hidden" name="usuario" id="usuario" value="<%= session.getAttribute("usuario") %>"> 
                <br>
                <input type="submit" name="salvar">         

            </form>
        </div>

    </body>
</html>
