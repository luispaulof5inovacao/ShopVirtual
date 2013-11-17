<%-- 
    Document   : dadosusuario
    Created on : 27/10/2013, 15:50:17
    Author     : LuisPaulo
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Usuarios"%>
 <%@include file="../header.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
      int idUsuario= Integer.parseInt( request.getParameter("usuario") );
      String sexoUsuario = "";
      Usuarios usuario = new Usuarios();
      ResultSet _usuario = usuario.comId( idUsuario );
      _usuario.next();
      
      if( _usuario.getString("ST_SEXO_USU").equals("1"))
          sexoUsuario = "masculino";
      else
         sexoUsuario = "feminino"; 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Dados Pessoais</title>
    </head>
    <body>
        <h1>Informações pessoais</h1>
        <div>
            <form action="ControllerUsuarios" method="post">

                <label>Nome completo</label><br>
                <input type="text" name="nome" id="nome" value=" <%=  _usuario.getString("ST_NOME_USU")%> "  required><br>    

                <label>Email</label><br>
                <input type="email" name="email" id="email" value="<%= _usuario.getString("ST_EMAIL_USU")%> " required><br>  

                <label>Senha</label><br>
                <input type="password" name="senha" id="senha" value=" <%= _usuario.getString("ST_SENHA_USU")%> " required><br>
                <input type="hidden" name="acao" id="acao" value="post"> 
                <input type="hidden" name="usuario" id="usuario" value="<%= session.getAttribute("usuario") %>"> 
                <label for="sexo"> Sexo </label><br>
                <select name="sexo" id="sexo" required>
                    <option value="<%=_usuario.getString("ST_SEXO_USU") %>"> <%= sexoUsuario %></option>
                    <option value="1">masculino</option>
                    <option value="2">feminino</option>
                </select><br><br>
                <input type="submit" name="salvar">     
                <a href='../usuarios/home.jsp'>Voltar</a>
            </form>

        </div>

    </body>
</html>
