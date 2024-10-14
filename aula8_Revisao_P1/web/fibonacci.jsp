<%-- 
    Document   : fibonacci
    Created on : 24 de set. de 2024, 13:52:45
    Author     : isaquesv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String messageError = null;
    int n1 = 3;

    try {
        if (request.getParameter("serieFibonacci") != null) {
            if (request.getParameter("n1") != null) {
                n1 = Integer.parseInt(request.getParameter("n1"));

                if (n1 < 1) {
                    n1 *= -1;
                }
            }
        }
    } catch (Exception ex) {
        messageError = ex.getMessage();
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarefa Teste P1</title>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <h1>Fibonacci</h1>
        <%@include file="WEB-INF/jspf/menu.jspf" %>

        <form action="fibonacci.jsp">
            <label for="n1">Índice desejado (insira um número inteiro e positivo): </label>
            <input name="n1" id="n1" type="number" placeholder="0" value="<%= n1 %>" required><br>
            <input type="submit" name="serieFibonacci" value="Gerar Números da Série de Fibonacci">
            <hr>

            <%
                // Caso não haja mensagem de erro
                if (messageError == null) {
                    // Caso todos os parâmetros estejam preenchidos corretamente
                    if (request.getParameter("serieFibonacci") != null && request.getParameter("n1") != null) {
                        int a = 1, b = 1, c = a + b;
            %>
                        <label>
            <%
                            out.print(a + ", " + b);

                            for (int i = 2; i < n1; i++) {
                                out.print(", " + c);
                                a = b;
                                b = c;
                                c = a + b;
                            }
            %>
                        </label>
            <%
                    }
                    // Caso um ou mais parâmetros não estejam preenchidos corretamente
                    else if (request.getParameter("serieFibonacci") != null || request.getParameter("n1") != null) {
            %>
                        <hr>
                        <b style="color: red;">Erro! Falha ao reconhecer todos os parâmetros enviados. Preencha e envie o formulário novamente!</b>
            <%
                    }
                // Caso haja mensagem de erro
                } else {
            %>
                    <hr>
                    <b style="color: red;"> Erro: <%= messageError%></b>
            <%
                }
            %>
        </form>
    </body>
</html>
