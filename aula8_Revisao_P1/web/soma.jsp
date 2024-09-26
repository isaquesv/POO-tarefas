<%-- 
    Document   : soma
    Created on : 24 de set. de 2024, 13:52:55
    Author     : isaquesv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarefa Teste P1</title>
    </head>
    <body>
        <h1>Soma</h1>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <form action="soma.jsp">
            <%
                String errorMessage = null;
                int n1 = 3, resultadoTotal = 0;

                try {
                    if (request.getParameter("gerarSoma") != null) {
                        if (request.getParameter("n1") != null) {
                            n1 = Integer.parseInt(request.getParameter("n1"));

                            if (n1 < 1) {
                                n1 *= -1;
                            }
                        }
                    }
                } catch (Exception ex) {
                    errorMessage = ex.getMessage();
                }
            %>
            
            <label for="n1">Insira um número inteiro e positivo: </label>
            <input name="n1" id="n1" type="number" placeholder="0" value="<%= n1 %>" required><br>
            <input type="submit" name="gerarSoma" value="Gerar Soma">
            <hr>

            <%
                // Caso não haja mensagem de erro
                if (errorMessage == null) {
                    // Caso os parâmetros estejam preenchidos corretamente
                    if (request.getParameter("gerarSoma") != null && request.getParameter("n1") != null) {
                        
                        for (int i = 1; i <= n1; i++) {
                            resultadoTotal += i;
                        }
                        %>
                        <label>A soma de 1 até <%= n1 %> é: <%= resultadoTotal %></label>;
                        <%
                    }
                    // Caso os parâmetros não estejam preenchidos corretamente
                    else if (request.getParameter("gerarSoma") != null || request.getParameter("n1") != null) {
                        %>
                        <hr>
                        <b style="color: red;">Erro! Falha ao reconhecer todos os parâmetros enviados. Preencha e envie o formulário novamente!</b>
                        <%
                    }
                // Caso haja mensagem de erro
                } else {
                    %>
                    <b style="color: red;"> <%= errorMessage %></b>
                    <%
                }
            %>
        </form>
    </body>
</html>
