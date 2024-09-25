<%-- 
    Document   : fibonacci
    Created on : 24 de set. de 2024, 13:52:45
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
        <h1>Fibonacci</h1>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <form action="fibonacci.jsp">
            <%
                String messageError = null;
                int n1 = 3;

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
            
            <label for="n1">Índice desejado (insira um número inteiro e positivo): </label>
            <input name="n1" id="n1" type="number" placeholder="0" value="<%= n1%>" required><br>
            <input type="submit" value="Gerar Números da Série de Fibonacci">
            <hr>

            <%
                if (messageError == null) {
                    if (request.getParameter("n1") != null) {
                        
                        int a = 1, b = 1, c = a + b;
                        out.print("<label>" + a + ", ");
                        out.print(b);
                        
                        for (int i = 2; i < n1; i++) {
                            out.print(", " + c);
                            a = b;
                            b = c;
                            c = a + b;
                        }
                        
                        out.println("</label>");
                    }
                } else {
                    out.println("<b style='color: red;'>" + messageError + "</b>");
                }
            %>
        </form>
    </body>
</html>
