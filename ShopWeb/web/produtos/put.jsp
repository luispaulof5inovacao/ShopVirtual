<%-- 
    Document   : put
    Created on : 27/10/2013, 14:05:32
    Author     : LuisPaulo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Prateleiras"%>
 <%@include file="../header.html" %>
<%@ page language="java" 
contentType="text/html" 
pageEncoding="ISO-8859-1" 
%> 
<%
    Integer idUsuario = ( Integer )( session.getAttribute("usuario") );
    Prateleiras prateleiras = new Prateleiras();
    ResultSet _prateleiras = prateleiras.doUsuario(idUsuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Cadastrar novo produto</title>
    </head>
    <body>
        <h1>Cadastrar novo produto</h1>
        <div>
            <form action="ControllerProdutos" method="post">
                <label>Nome refer�ncia produto</label><br>
                <input type="text" name="nomeproduto" id="nomeproduto" required><br> 

                <label>Valor produto</label><br>                
                <input type="text" name="valorproduto" id="valorproduto" required><br> 

                <label for="prateleira"> Prateleira</label><br> 
                <select name="prateleira" id="prateleira" required>
                    <option value=""> </option>
                    <% while (_prateleiras.next()) {%>
                    <option value="<%=_prateleiras.getInt("ID_PRATELEIRA_PRA")%>"> <%=_prateleiras.getString("ST_NOME_PRA")%> </option>
                    <% }%>
                </select><br>

                <label>Descri��o<br> <textarea name="descricao" cols="40" rows="5" required></textarea></label>  
                <input type="hidden" name="usuario" id="usuario" value="<%= session.getAttribute("usuario")%>">   <br> 
                <input type="hidden" name="acao" id="acao" value="put">   <br> 
                <input type="submit" name="salvar">  
                <a href='javascript:history.back(1)'>cancelar</a>
            </form>
        </div>
    </body>
</html>
