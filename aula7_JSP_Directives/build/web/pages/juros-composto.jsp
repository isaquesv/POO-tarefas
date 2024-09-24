<%-- 
    Document   : juros-composto
    Created on : 24 de set. de 2024, 00:07:19
    Author     : isaquesv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Compostos | Aula 07 - JSP Directives | JSP Page</title>
    </head>
    <body>
        <h1>Juros Compostos</h1>
        <%@include file="../WEB-INF/jspf/menu.jspf" %>
        
        <form action="juros-composto.jsp">
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
                    %>
                    
                    <label for="montanteInicial">Montante Inicial (R$):</label> 
                    <input type="number" name="montanteInicial" id="montanteInicial" placeholder="Montante Inicial (R$)" value="<%= montanteInicial %>" step="0.01" min="0.01" required><br>
                    <label for="taxaJuros">Taxa de Juros (% ao mês):</label> 
                    <input type="number" name="taxaJuros" id="taxaJuros" placeholder="Taxa de Juros (% ao mês)" value="<%= taxaJuros %>" step="0.01" min="0.01" required><br>
                    <label for="quantidadeMeses">Quantidade de meses:</label> 
                    <input type="number" name="quantidadeMeses" id="quantidadeMeses" placeholder="Quantidade de meses" value="<%= quantidadeMeses %>" min="1" required><br>
                    
                    <%
                } catch (Exception ex) {
                    errorMessage = ex.getMessage();
                    out.println("<p style='color: red;'>" + errorMessage + "</p>");
                }
            %>
            
            <input type="submit" name="jurosComposto" value="Calcular Juros Composto">
        </form>
        
        <%
            // Exibindo o resultado se os parâmetros forem válidos
            if (errorMessage == null && request.getParameter("jurosComposto") != null && request.getParameter("montanteInicial") != null && request.getParameter("taxaJuros") != null && request.getParameter("quantidadeMeses") != null) {
                out.println("<hr>");
                out.println("<h2>Tabela de Valores Futuros Acumulados por Período do Montante</h2>");
                out.println("<table border='1'>");
                out.println("<tr><th>Mês</th><th>Valor Futuro</th></tr>");
                
                for (int i = 1; i <= quantidadeMeses; i++) {
                    valorFuturo = montanteInicial * Math.pow(1 + (taxaJuros / 100), i); // Math.pow(base, expoente) calcula a potência de um número
                    out.println("<tr><td>"+ i +"</td><td>"+ String.format("%.2f", valorFuturo) +"</td></tr>");
                }
                
                out.println("</table>");
                out.println("<p>Taxa de Juros (%): " + String.format("%.2f", taxaJuros) + "</p>");
                out.println("<p>Quantidade de meses informado: " + quantidadeMeses + "</p>");
                
            }
        %>
    </body>
</html>
