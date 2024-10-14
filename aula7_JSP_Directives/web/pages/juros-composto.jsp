<%-- 
    Document   : juros-composto
    Created on : 24 de set. de 2024, 00:07:19
    Author     : isaquesv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorMessage = null;
    double montanteInicial = 1000, taxaJuros = 5, valorFuturo = 0;
    int quantidadeMeses = 6;

    try {
        if (request.getParameter("jurosComposto") != null) {
            if (request.getParameter("montanteInicial") != null) {
                montanteInicial = Double.parseDouble(request.getParameter("montanteInicial"));
            }
            if (request.getParameter("taxaJuros") != null) {
                taxaJuros = Double.parseDouble(request.getParameter("taxaJuros"));
            }
            if (request.getParameter("quantidadeMeses") != null) {
                quantidadeMeses = Integer.parseInt(request.getParameter("quantidadeMeses"));
            }
        }
    } catch (Exception ex) {
        errorMessage = ex.getMessage();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Compostos | Aula 07 - JSP Directives | JSP Page</title>
        <link rel="stylesheet" href="../style/style.css">
    </head>
    <body>
        <h1>Juros Compostos</h1>
        <%@include file="../WEB-INF/jspf/menu.jspf" %>

        <form action="juros-composto.jsp">
            <label for="montanteInicial">Montante Inicial (R$):</label> 
            <input type="number" name="montanteInicial" id="montanteInicial" placeholder="Montante Inicial (R$)" value="<%= montanteInicial%>" step="0.01" min="0.01" required><br>
            <label for="taxaJuros">Taxa de Juros (% ao mês):</label> 
            <input type="number" name="taxaJuros" id="taxaJuros" placeholder="Taxa de Juros (% ao mês)" value="<%= taxaJuros%>" step="0.01" min="0.01" required><br>
            <label for="quantidadeMeses">Quantidade de meses:</label> 
            <input type="number" name="quantidadeMeses" id="quantidadeMeses" placeholder="Quantidade de meses" value="<%= quantidadeMeses%>" min="1" required><br>
            <input type="submit" name="jurosComposto" value="Calcular Juros Composto">
        </form>

        <%
            // Caso não haja mensagem de erro
            if (errorMessage == null) {
                // Caso todos os parâmetros estejam preenchidos corretamente
                if (request.getParameter("jurosComposto") != null && request.getParameter("montanteInicial") != null && request.getParameter("taxaJuros") != null && request.getParameter("quantidadeMeses") != null) {
        %>
                    <hr>
                    <h2>Tabela de Valores Futuros Acumulados por Período do Montante</h2>
                    <table border="1">
                        <tr>
                            <th>Mês</th>
                            <th>Valor Futuro</th>
                        </tr>

        <%
                        for (int i = 1; i <= quantidadeMeses; i++) {
                            valorFuturo = montanteInicial * Math.pow(1 + (taxaJuros / 100), i); // Math.pow(base, expoente) calcula a potência de um número
        %>
                            <tr>
                                <td><%= i%></td>
                                <td><%= String.format("%.2f", valorFuturo)%></td>
                            </tr>
        <%
                        }
        %>

                    </table>
                    <p>Taxa de Juros (%): <%= String.format("%.2f", taxaJuros)%></p>
                    <p>Quantidade de meses informado: <%= quantidadeMeses%></p>
        <%
                // Caso um ou mais parâmetros não estejam preenchidos corretamente
                } else if (request.getParameter("jurosComposto") != null || request.getParameter("montanteInicial") != null || request.getParameter("taxaJuros") != null || request.getParameter("quantidadeMeses") != null) {
        %>
                    <hr>
                    <b style="color: red;">Erro! Falha ao reconhecer todos os parâmetros enviados. Preencha e envie o formulário novamente!</b>
        <%
                }
                // Caso haja mensagem de erro
            } else {
        %>
                <hr>
                <b style="color: red;"> Erro: <%= errorMessage%></b>
        <%
            }
        %>
    </body>
</html>
