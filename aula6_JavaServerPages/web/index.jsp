<%-- 
    Document   : index
    Created on : 15 de set. de 2024, 17:00:07
    Author     : isaquesv
--%>
<%-- Imports que permitem criar Arrays --%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% ArrayList<String> listaMeses = new ArrayList<>(Arrays.asList("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body { 
                margin: 0;
                font-family: Comic Sans MS, Comic Sans, cursive;
            }
            h1 { margin: 10px 25px 15px 25px; }
            form {
                width: 230px;
                margin: 25px;
            }
            form #form-content { display: flex; }
            form #form-content #left { padding-right: 10px; }
            form #form-content #right select { width: 100%; }
            form #form-content #right input { width: 80px; }
            form #form-content #right select, #form-content #right input { text-align: center; }
            form input[TYPE=SUBMIT] {
                padding: 4px;
                margin-top: 10px;
                width: 100%;
            }
        </style>
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
                    </select><br>
                    <input type="number" name="ano" min="1" value="2024">
                </div>
            </div>
            
            <input type="submit" name="calendario" value="Gerar calendário">
        </form>
    </body>
</html>
