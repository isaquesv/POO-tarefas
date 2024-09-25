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
                String messageError = null;
                int n1 = 3, resultadoTotal = 0;

                try {
                    if (request.getParameter("n1") != null) {
                        n1 = Integer.parseInt(request.getParameter("n1"));
                        
                        if (n1 < 1) {
                            n1 *= -1;
                        }
                    }
                } catch (Exception ex) {
                    messageError = ex.getMessage();
                }

            %>
            
            <label for="n1">Insira um número inteiro e positivo: </label>
            <input name="n1" id="n1" type="number" placeholder="0" value="<%= n1%>" required><br>
            <input type="submit" value="Gerar Soma">
            <hr>

            <%
                if (messageError == null) {
                    if (request.getParameter("n1") != null) {
                        
                        for (int i = 1; i <= n1; i++) {
                            resultadoTotal += i;
                        }
                        out.println("<label>A soma de 1 até " + n1 + " é: " + resultadoTotal + "</label>");
                    
                    }
                } else {
                    out.println("<b style='color: red;'>" + messageError + "</b>");
                }
            %>
        </form>
    </body>
</html>
