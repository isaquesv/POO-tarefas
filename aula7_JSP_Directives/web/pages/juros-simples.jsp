<%-- 
    Document   : juros-simples
    Created on : 24 de set. de 2024, 00:07:06
    Author     : isaquesv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Simples | Aula 07 - JSP Directives | JSP Page</title>
    </head>
    <body>
        <h1>Juros Simples</h1>
        <%@include file="../WEB-INF/jspf/menu.jspf" %>

        <form action="juros-simples.jsp">
            <%
                String errorMessage = null;
                double montanteInicial = 1000, taxaJuros = 5, valorFuturo = 0;
                int quantidadeMeses = 6;

                try {
                    if (request.getParameter("jurosSimples") != null) {
                        if (request.getParameter("montanteInicial") != null) {
                            montanteInicial = Double.parseDouble(request.getParameter("montanteInicial"));
                        }
                        if (request.getParameter("taxaJuros") != null) {
                            taxaJuros = Double.parseDouble(request.getParameter("taxaJuros"));
                        }
                        if (request.getParameter("quantidadeMeses") != null) {
                            quantidadeMeses = Integer.parseInt(request.getParameter("quantidadeMeses"));
                        }

                        valorFuturo = montanteInicial * (1 + ((taxaJuros * quantidadeMeses) / 100));
                    }
                } catch (Exception ex) {
                    errorMessage = ex.getMessage();
                }
            %>

            <label for="montanteInicial">Montante Inicial (R$):</label> 
            <input type="number" name="montanteInicial" id="montanteInicial" placeholder="Montante Inicial (R$)" value="<%= montanteInicial%>" step="0.01" min="0.01" required><br>
            <label for="taxaJuros">Taxa de Juros (% ao mês):</label> 
            <input type="number" name="taxaJuros" id="taxaJuros" placeholder="Taxa de Juros (% ao mês)" value="<%= taxaJuros%>" step="0.01" min="0.01" required><br>
            <label for="quantidadeMeses">Quantidade de meses:</label> 
            <input type="number" name="quantidadeMeses" id="quantidadeMeses" placeholder="Quantidade de meses" value="<%= quantidadeMeses%>" min="1" required><br>
            <input type="submit" name="jurosSimples" value="Calcular Juros Simples">
        </form>

        <%
            // Caso não haja mensagem de erro
            if (errorMessage == null) {
                // Caso todos os parâmetros estejam preenchidos corretamente
                if (request.getParameter("jurosSimples") != null && request.getParameter("montanteInicial") != null && request.getParameter("taxaJuros") != null && request.getParameter("quantidadeMeses") != null) {
                    %>
                    <hr>
                    <h2>Resultado</h2>
                    <p>Montante Inicial (R$): <%= String.format("%.2f", montanteInicial) %><p>
                    <p>Taxa de Juros (%): <%= String.format("%.2f", taxaJuros) %></p>
                    <p>Quantidade de meses informado: <%= quantidadeMeses %></p>
                    <p>Valor Futuro do Montante: R$ <%= String.format("%.2f", valorFuturo) %></p>
                    <%
                // Caso um ou mais parâmetros não estejam preenchidos corretamente
                } else if (request.getParameter("jurosSimples") != null || request.getParameter("montanteInicial") != null || request.getParameter("taxaJuros") != null || request.getParameter("quantidadeMeses") != null) {
                    %>
                    <hr>
                    <b style="color: red;">Erro! Falha ao reconhecer todos os parâmetros enviados. Preencha e envie o formulário novamente!</b>
                    <%
                }
            // Caso haja mensagem de erro
            } else {
                %>
                <hr>
                <b style="color: red;"> Erro: <%= errorMessage %></b>
                <%
            }
        %>
    </body>
</html>
