<%-- 
    Document   : dadosusuario
    Created on : 27/10/2013, 15:50:17
    Author     : LuisPaulo
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Usuarios"%>
 <%@include file="../header.html" %>
<%@ page language="java" 
contentType="text/html" 
pageEncoding="ISO-8859-1" 
%> 

<%
      Integer idUsuario = ( Integer )( session.getAttribute("usuario") );
      String sexoUsuario = "";
      Usuarios usuario = new Usuarios();
      ResultSet _usuario = usuario.comId( idUsuario );
      _usuario.next();
      
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Empresa</title>
    </head>
    <body>
         <div class="conteudo">
        <h1>Informações da Empresa</h1>
        <div class="conteudonovo-item">
            <form action="ControllerUsuarios" method="post">

                <label>CNPJ</label><br>
                <input type="text" name="cnpj" size="30" disabled="on" id="cnoj" value=" <%=  _usuario.getString("ST_CNPJ_USU")%> "  required><br>    
                
                <label>Nome completo</label><br>
                <input type="text" name="nome" size="30" id="nome" value=" <%=  _usuario.getString("ST_NOME_USU")%> "  required><br>    

                <label>Email</label><br>
                <input type="email" name="email" size="30" id="email" value="<%= _usuario.getString("ST_EMAIL_USU")%> " required><br>  

                <label>Senha</label><br>
                <input type="password" name="senha" id="senha" value=" <%= _usuario.getString("ST_SENHA_USU")%> " required><br>
               
                <label>Cep</label><br>
                <input  type="text" id="cep" name="cep" pattern="\d{5}-\d{3}" value=" <%= _usuario.getString("ST_CEP_USU")%> "  title="O campo deve conter 9 digitos no formato 99999-999">
                <br>
                <% if( !_usuario.getString("ST_CEP_USU").equals(null) ){ %>
               
               
                  <label>Cidade</label><br>
                  <input type="text" name="cidade" size="30" id="cidade" value="<%= _usuario.getString("ST_CIDADE_USU")%> " required><br>  
                  <label>Bairro</label><br>
                  <input type="text" name="bairro" size="30" id="bairro" value="<%= _usuario.getString("ST_BAIRRO_USU")%> " required><br>  
                  <label>Endereço</label><br>
                  <input type="text" name="endereco" size="30" id="endereco" value="<%= _usuario.getString("ST_ENDERECO_USU")%> " required><br>  
                  <label>Estado</label><br>
                  <input type="text" name="estado" size="30" id="estado" value="<%= _usuario.getString("ST_UF_USU")%> " required><br>  

                   
                <%}%>
                
                <input type="hidden" name="acao" id="acao" value="post"> 
                <input type="hidden" name="usuario" id="usuario" value="<%= session.getAttribute("usuario") %>"> 
                <br><br>
                <input type="submit" name="salvar" value="Salvar">     
                <a href='../usuarios/home.jsp'>Voltar</a>
            </form>
       </div>

        </div>

    </body>
</html>
