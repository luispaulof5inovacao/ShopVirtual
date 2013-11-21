<%-- 
    Document   : prateleiras
    Created on : 23/10/2013, 09:31:02
    Author     : LuisPaulo
--%>
<%@page import="Models.Categorias"%>
<%@page import="Models.Prateleiras"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="../header.html" %>

<%
//      int idUsuario =  Integer.parseInt ( session.getAttribute("usuario") ); 
    String categoria = request.getParameter("categoria");
    Integer idUsuario = (Integer) (session.getAttribute("usuario"));
    Integer idCategoria = Integer.parseInt(request.getParameter("idcategoria"));

    Prateleiras prateleiras = new Prateleiras();
    ResultSet _prateleirasDaCategoria = prateleiras.daCategoria(idCategoria);

//      Categorias categorias = new Categorias();
//      ResultSet _categoria = categorias.categoria(idUsuario, idCategoria);
//      _categoria.next();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Prateleiras</title>
    </head>
    <body>
        <div class="conteudo">
            <h1>Prateleiras</h1>
            <h2>Da categoria <%= categoria%></h2>
            <div class="conteudonovo-item ">
                <a  class="novo-item" href="../prateleiras/put.jsp?usuario=<%= session.getAttribute("usuario")%> ">Cadastrar prateleira</a>
            </div>
            <div class="workspace" id="workspace" >
                <div class="container flat_container">
                    <div class="panel home_tab project_index  no_nav">
                        <div id="all_projects">
                            <section class="projects cards">
                                <%  int nmPrateleiras = 0;
                                    while (_prateleirasDaCategoria.next()) {%> 

                                <% if (nmPrateleiras == 0) {%>
                                <div class="row">
                                    <%}%>
                                    <article class="cardprateleiras">
                                        <a href="../prateleiras/post.jsp?prateleira=<%=  _prateleirasDaCategoria.getInt("ID_PRATELEIRA_PRA")%>&usuario=<%= session.getAttribute("usuario")%>&idCategoria=<%= _prateleirasDaCategoria.getInt("ID_CATEGORIA_CAT")%>"> 
                                            <h5>
                                                <%=_prateleirasDaCategoria.getString("ST_NOME_PRA")%> 
                                            </h5>
                                            <p style="margin-bottom: 5px;">                                                
                                            </p>
                                            <div class="people"></div>
                                        </a>
                                    </article>  
                                    <%
                                        nmPrateleiras++;
                                        if (nmPrateleiras == 3) {
                                            nmPrateleiras = 0;
                                    %>
                                </div>
                                <%}%>

                                <%}%>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
            <a href='../usuarios/categoriasprateleiras.jsp?usuario=<%= session.getAttribute("usuario")%>'>voltar</a>
        </div>

    </body>
</html>
