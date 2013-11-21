<%-- 
    Document   : prateleiras
    Created on : 21/10/2013, 09:01:09
    Author     : LuisPaulo
--%>
<%@page import="Models.Produtos"%>
<%@page import="Models.Prateleiras"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="../header.html" %>
<%@page import="Models.Categorias"%>
<%
    Integer idUsuario = (Integer) (session.getAttribute("usuario"));
    Integer idPrateleira = Integer.parseInt(request.getParameter("prateleira"));
    Integer idCategoria = Integer.parseInt(request.getParameter("idCategoria"));


    Produtos produtos = new Produtos();
    ResultSet _produtos = produtos.doUsuario(idUsuario, idPrateleira);

//      _prateleiras.next();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="../css/main.css"> 
        <link rel=stylesheet type="text/css" href="../css/header.css"> 
        <title>Produtos</title>
    </head>
    <body>
        <div class="conteudo">
            <h1> Produtos </h1>
            <div class="conteudonovo-item">
                <a class="novo-item" href="../produtos/put.jsp?usuario=<%= session.getAttribute("usuario")%> ">Cadastrar produto</a>
            </div><br><br>
            <div class="workspace" id="workspace" >
                <div class="container flat_container">
                    <div class="panel home_tab project_index  no_nav">
                        <div id="all_projects">
                            <section class="projects cards">
                                <%  int nmProdutos = 0;
                                    while (_produtos.next()) {%> 

                                <% if (nmProdutos == 0) {%>
                                <div class="row">
                                    <%}%>
                                    <article class="cardprateleiras">
                                        <a class="project_card" href="../produtos/post.jsp?produtos=<%=  _produtos.getInt("ID_PRODUTO_PRO")%>&usuario=<%= session.getAttribute("usuario")%>&idPrateleira=<%= idPrateleira%>">
                                            <h3>
                                                <%=_produtos.getString("ST_NOME_PRO")%> 
                                            </h3><p>
                                            <div class="people" style="padding-left: 40px;">
                                                <img src="../css/produto.png">
                                            </div>
                                            <p class="descricao">
                                                <b>Descrição :</b> <%=_produtos.getString("ST_DESCRICAO_PRO")%><br>
                                                <b>Valor:</b> <%=_produtos.getFloat("VL_PRODUTO_PRO")%><br>
                                                <b>Prateleira:</b> <%=_produtos.getString("ST_NOME_PRA")%><br>
                                                <b>Categoria:</b> <%=_produtos.getString("ST_NOME_CAT")%><br>
                                            </p>

                                        </a>
                                    </article> 
                                    <%
                                        nmProdutos++;
                                        if (nmProdutos == 3) {
                                            nmProdutos = 0;
                                    %>
                                </div>
                                <%}%>

                                <%}%>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
            <a href='javascript:history.back(1)'>cancelar</a>
        </div>
    </body>
</html>
