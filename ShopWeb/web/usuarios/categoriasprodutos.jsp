<%-- 
    Document   : produtos
    Created on : 27/10/2013, 14:04:41
    Author     : LuisPaulo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Produtos"%>
<%@page import="Models.Categorias"%>
<%@include file="../header.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Integer idUsuario = (Integer) (session.getAttribute("usuario"));
    Categorias categorias = new Categorias();
    ResultSet _categoriasDoUsuario = categorias.doUsuario(idUsuario);
//      _usuario.next();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Meus produtos</title>
    </head>
    <body>
        <div class="conteudo">
            <!--<h1>Meus produtos</h1>-->
            <h1>Qual a categoria do produto ?</h1>
<!--            <div class="conteudonovo-item">
                <a class="novo-item" href="../produtos/put.jsp?usuario=<%= session.getAttribute("usuario")%> ">Cadastrar categor</a>
            </div><br><br>-->

            
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
                                         <a class="project_card"  href="../usuarios/prateleirasprodutos.jsp?idcategoria=<%=  _categoriasDoUsuario.getInt("ID_CATEGORIA_CAT")%>&usuario=<%= session.getAttribute("usuario")%>&categoria=<%= _categoriasDoUsuario.getString("ST_NOME_CAT")%>">
                                            <h3>
                                                <%=_categoriasDoUsuario.getString("ST_NOME_CAT")%>
                                            </h3><p>
                                                 <div class="people">
                                                     <img  style="padding-left: 40px;" src="../css/categoria.png">
                                                 </div>
                                            <p class="descricao">
                                                <b>Descrição:</b> <%=_categoriasDoUsuario.getString("ST_DESCRICAO_CAT")%>
                                            </p>
                                           
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
