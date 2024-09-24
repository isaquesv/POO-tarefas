<%-- 
    Document   : index
    Created on : 23 de set. de 2024, 23:57:17
    Author     : isaquesv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index | Aula 07 - JSP Directives | JSP Page</title>
    </head>
    <body>
        <h1>Index</h1>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <%
            LocalDateTime dataAtual = LocalDateTime.now();

            // Capturando a HORA
            int horaAtual = dataAtual.getHour();

            if (horaAtual > 4 && horaAtual < 12) {
                out.print("<h2>- Bom dia</h2>");
            } else if (horaAtual >= 12 && horaAtual < 18) {
                out.print("<h2>- Boa tarde</h2>");
            } else if (horaAtual >= 18 && horaAtual < 24) {
                out.print("<h2>- Boa noite</h2>");
            } else {
                out.print("<h2>- Vá dormir</h2>");
            }
        %>
    </body>
</html>
