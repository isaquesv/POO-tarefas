<%-- 
    Document   : index
    Created on : 15 de set. de 2024, 17:00:07
    Author     : isaquesv
--%>

<%-- Imports que permitem criar Arrays --%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<String> listaMeses = new ArrayList<>(Arrays.asList("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/style.css">
        <link rel="stylesheet" href="style/form.css">
    </head>
    <body>
        <h1>Calendário</h1>

        <hr>
        
        <form action="calendario.jsp">
            <div id="form-content">
                <div id="left">
                    <label>Selecione um mês: </label><br>
                    <label>Declare um ano: </label>
                </div>

                <div id="right">
                    <select name="mes">
                        
                        <% for (int i = 0; i < 12; i++) { %>
                            <option value="<%= (i+1) %>"><%= listaMeses.get(i) %></option>
                        <% } %>
                        
                    </select>
                    <br>
                    <input type="number" name="ano" min="1" value="2024">
                </div>
            </div>
            
            <input type="submit" name="calendario" value="Gerar calendário">
        </form>
    </body>
</html>
