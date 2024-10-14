<%-- 
    Document   : numero-primo.jsp
    Created on : 24 de set. de 2024, 13:52:37
    Author     : isaquesv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String messageError = null;
    int n1 = 3;

    try {
        if (request.getParameter("numeroPrimo") != null) {
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
        <h1>Número Primo</h1>
        <%@include file="WEB-INF/jspf/menu.jspf" %>

        <form action="numero-primo.jsp">
            <label for="n1">Insira um número inteiro e positivo:</label>
            <input name="n1" id="n1" type="number" placeholder="5" value="<%= n1 %>" required><br>
            <input type="submit" name="numeroPrimo" value="Verificar Número Primo">
            <hr>

            <%
                // Caso não haja mensagem de erro
                if (messageError == null) {
                    // Caso os parâmetros estejam preenchidos corretamente
                    if (request.getParameter("numeroPrimo") != null && request.getParameter("n1") != null) {

                        boolean numeroPrimoSimOuNao = true;

                        for (int i = 2; i <= n1 / 2; i++) {
                            if (n1 % i == 0) {
                                if (numeroPrimoSimOuNao == true) {
                                    numeroPrimoSimOuNao = false;
            %>
                                    <label>
                                        <%= n1%> não é um número primo!
                                    </label>
                                    <br>
                                    <label>
                                        Lista de divisores: 
                                    </label>
            <%
                                }
                                out.print(i + ", ");
                            }
                        }

                        if (numeroPrimoSimOuNao == true) {
            %>
                            <label>
                                <%= n1%> é um número primo!
                            </label>
            <%
                        }
                    }
                    // Caso os parâmetros não estejam preenchidos corretamente
                    else if (request.getParameter("numeroPrimo") != null || request.getParameter("n1") != null) {
            %>
                        <hr>
                        <b style="color: red;">Erro! Falha ao reconhecer todos os parâmetros enviados. Preencha e envie o formulário novamente!</b>
            <%
                    }
                    // Caso haja mensagem de erro
                    } else {
            %>
                        <b style="color: red;"> <%= messageError%></b>
            <%
                    }
            %>
        </form>
    </body>
</html>
