<%-- 
    Document   : prateleiras
    Created on : 23/10/2013, 09:31:02
    Author     : LuisPaulo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Categorias"%>
<%@include file="../header.html" %>
<%
//      int idUsuario =  Integer.parseInt ( session.getAttribute("usuario") ); 
//      String temp = (String)session.getAttribute("usuario"); 
    Integer idUsuario = (Integer) (session.getAttribute("usuario"));
    Categorias categorias = new Categorias();
    ResultSet _categoriasDoUsuario = categorias.doUsuario(idUsuario);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Minhas prateleiras</title>
    </head>
    <body>
        <div class="conteudo"> 
            <h1>Minhas prateleiras</h1>            
            <div class="conteudonovo-item">
                <a class="novo-item" href="../prateleiras/put.jsp?usuario=<%= session.getAttribute("usuario")%> ">Cadastrar prateleira</a>
            </div><br><br>
            <h2>Selecione a categoria da prateleira</h2>
            <div class="workspace" id="workspace" >
                <div class="container flat_container">
                    <div class="panel home_tab project_index  no_nav">
                        <div id="all_projects">
                            <section class="projects cards">

                                <%  int nmCategorias = 0;
                                    while (_categoriasDoUsuario.next()) {%> 

                                <% if (nmCategorias == 0) {%>
                                <div class="row">
                                    <%}%>
                                    <article class="cardprateleiras">
                                        <a class="project_card" href="../usuarios/prateleiras.jsp?idcategoria=<%=  _categoriasDoUsuario.getInt("ID_CATEGORIA_CAT")%>&usuario=<%= session.getAttribute("usuario")%>&categoria=<%= _categoriasDoUsuario.getString("ST_NOME_CAT")%>">
                                            <h5>
                                                <%=_categoriasDoUsuario.getString("ST_NOME_CAT")%>
                                            </h5>
                                            <p style="margin-bottom: 5px;">
                                                <%=_categoriasDoUsuario.getString("ST_DESCRICAO_CAT")%>
                                            </p>
                                            <div class="people"></div>
                                        </a>
                                    </article> 

                                    <%
                                        nmCategorias++;
                                        if (nmCategorias == 3) {
                                            nmCategorias = 0;
                                    %>
                                </div>
                                <%}%>

                                <%}%>


                            </section>
                        </div>
                    </div>
                </div>
            </div>
            <a href='../usuarios/home.jsp'>voltar</a>
        </div>
    </body>
</html>
