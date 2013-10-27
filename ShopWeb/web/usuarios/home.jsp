
<% 
      String usuarioNome = (String) session.getAttribute("nome");
      String usuarioEmail = (String) session.getAttribute("email");
      
 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Olá! <%= usuarioNome %></h1><br>
        <h1>Seu email de cadastro é! <%= usuarioEmail %></h1><br>
        
        <div>
            <a href="../usuarios/categorias.jsp?usuario=<%= session.getAttribute("usuario") %>">Minhas categorias</a>
        </div>
        <div>
            <a href="../usuarios/prateleiras.jsp?usuario=<%= session.getAttribute("usuario") %>">Minhas prateleiras</a>
        </div>
        <div>
            <a href="../usuarios/produtos.jsp?usuario=<%= session.getAttribute("usuario") %>">Meus produtos</a>
        </div>
    </body>
</html>
