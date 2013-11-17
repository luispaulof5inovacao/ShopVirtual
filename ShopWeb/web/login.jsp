<%-- 
    Document   : login
    Created on : 17/11/2013, 14:19:00
    Author     : LuisPaulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="css/main.css"> 
        <title>Categoria Login</title>
    </head>
    <body class="login categorias">
        <div class="container" >
            <div id="header"> 
                <h1><a href="http://37signals.com/" class="logo">37signals</a></h1>
            </div>
            <div id="login_content" data-state="username" class="">
                <div id="login_content_inner">
                    <div class="dialog_contents">
                        <div id="login_dialog" class="login_dialog clearfix">
                            <div class="form">
                                <form action="ControllerAuth" method="post">
                                    <div id="user_name_login"><br>
                                        <h1>Login no <strong>Categorias</strong> </h1>
                                    <!--<label>Email</label><br>-->
                                    <input type="email" name="email" id="email" placeholder="Email" required><br>
                                    <!--<label>Senha</label><br>-->
                                    <input type="password" name="senha" id="senha" placeholder="Senha" required><br><p>
                                    <input type="submit" name="salvar" value="Entrar"> 
                                    </div>
                                    <br>
                                </form>
                            </div>
                        </div>
                        <div></div>
                    </div>
                </div>
                <div id="other_products">
                    <div>
                        <ul>
                            <li>
                                <a href="index.html">
                                    Não tem uma conta no categorias? <strong>Crie agora</strong>.
                                </a>      </li>
                        </ul>
                    </div>
                </div>
            </div>
            
        </div>
    </body>
</html>
