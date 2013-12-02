
<%
    String usuarioNome = (String) session.getAttribute("nome");
    String usuarioEmail = (String) session.getAttribute("email");

%>
<%@include file="../header.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
  <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel=stylesheet type="text/css" href="../css/main.css"> 
    <link rel=stylesheet type="text/css" href="../css/header.css"> 
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Tenis Adidas',     11],
          ['Bolsa escolar',      2],
          ['Computadores',  2],
          ['NetBooks', 2],
          ['Camisetas',    7],
          ['Televisão',    10]
        ]);

        var options = {
          title: 'Produtos mais vendidos de 24 a 30 de novembro'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 400px; padding-top: 100px;padding-left: 100px;"></div>
  </body>
</html>
