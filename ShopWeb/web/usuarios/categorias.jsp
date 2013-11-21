<%-- 
    Document   : categorias
    Created on : 21/10/2013, 09:48:54
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
        <title>Minhas Categorias</title>
    </head>
    <body>
        <div class="conteudo">
            <h1>Minhas categorias</h1>

            <div class="conteudonovo-item">
                <a class="novo-item" href="../categorias/put.jsp">Cadastrar Categoria</a>
            </div>
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
                                        <a href="../categorias/post.jsp?categoria=<%=  _categoriasDoUsuario.getInt("ID_CATEGORIA_CAT")%>&usuario=<%= session.getAttribute("usuario")%>"> 
                                            <h5>
                                                <%=_categoriasDoUsuario.getString("ST_NOME_CAT")%> 
                                            </h5>
                                            <p style="margin-bottom: 5px;"></p>
                                            <p style="font-size: 12px;">
                                                <b>Descrição :</b> <%=_categoriasDoUsuario.getString("ST_DESCRICAO_CAT")%>
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
