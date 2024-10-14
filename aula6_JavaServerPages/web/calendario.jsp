<%-- 
    Document   : calendario
    Created on : 15 de set. de 2024, 18:00:50
    Author     : isaquesv
--%>

<%@page import="java.time.YearMonth"%>
<%@page import="java.time.LocalDate"%>
<%-- Imports que permitem criar Arrays --%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorMessage = null, textoMes = null;
    ArrayList<String> listaDias = null;
    ArrayList<String> listaMeses = new ArrayList<>(Arrays.asList("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"));

    int mes = 1, ano = 2024, diasNoMes = 31, diaSemanaPrimeiroDia = 1;
    try {
        if (request.getParameter("calendario") != null) {
            mes = Integer.parseInt(request.getParameter("mes"));
            ano = Integer.parseInt(request.getParameter("ano"));
        }

        textoMes = listaMeses.get(mes - 1);
        listaDias = new ArrayList<>(Arrays.asList("Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"));

        // Utilizando a classe YearMonth para obter o número de dias no mês de um ano específico
        YearMonth yearMonth = YearMonth.of(ano, mes);
        diasNoMes = yearMonth.lengthOfMonth();

        // Obtendo o dia da semana do primeiro dia do mês
        LocalDate primeiroDia = LocalDate.of(ano, mes, 1);
        // Convertendo para inteiro e seguindo o seguinte modelo: 0 = Domingo, 1 = Segunda-feira, ..., 6 = Sábado
        diaSemanaPrimeiroDia = (primeiroDia.getDayOfWeek().getValue() % 7);
    } catch (Exception ex) {
        errorMessage = ex.getMessage();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/style.css">
        <link rel="stylesheet" href="style/form.css">
    </head>
    <body>
        <div id="header">
            <h1>Calendário</h1>
            <h4><a href="index.jsp">Voltar</a></h4>
        </div>

        <hr>

        <form action="calendario.jsp">
            <div id="form-content">
                <div id="left">
                    <label>Selecione um mês: </label><br>
                    <label>Declare um ano: </label>
                </div>

                <div id="right">
                    <select name="mes">
                        <% for (int i = 0; i < 12; i++) {
                            if (errorMessage == null && mes == (i + 1)) {%>
                                <option value="<%= (i + 1)%>" selected><%= listaMeses.get(i)%></option>
                        <%  } else {%>
                                <option value="<%= (i + 1)%>"><%= listaMeses.get(i)%></option>
                        <%  }
                           } %>
                    </select><br>
                    <%  if (errorMessage == null) {%>
                        <input type="number" name="ano" min="1" value="<%= ano%>">
                    <%  } else { %>
                        <input type="number" name="ano" min="1" value="2024">
                    <%  }%>
                </div>
            </div>

            <input type="submit" name="calendario" value="Gerar calendário">
        </form>

        <hr>

        <div id="div-table">
            <% if (errorMessage == null) {%>
                <h2><%= textoMes%> <%= ano%></h2>
                <table border="1">
                    <tr>
                        <% for (int i = 0; i < 7; i++) {%>
                            <th><%= listaDias.get(i)%></th>
                        <% } %>
                    </tr>
                    <tr>
                        <%  // Criando células vazias antes do primeiro dia do mês, caso haja necessidade
                            for (int i = 0; i < diaSemanaPrimeiroDia; i++) {
                                out.print("<td></td>");
                            }

                            // Processando cada dia do mês
                            for (int dia = 1; dia <= diasNoMes; dia++) {
                                LocalDate data = LocalDate.of(ano, mes, dia);
                                // Convertendo para inteiros, seguindo o seguinte padrão: 0 = Domingo, 1 = Segunda-feira ... 6 = Sábado
                                int diaSemana = (data.getDayOfWeek().getValue() % 7);

                                // Exibindo o dia do mês
                                out.print("<td><h3>" + dia + "</h3></td>");

                                // Verificando se é Sábado (último dia da semana) para fechar a linha e abrir uma nova
                                if (diaSemana == 6) {
                                    out.print("</tr><tr>");
                                }
                            }

                            // Preenchendo o resto da semana com células vazias após o último dia do mês, caso haja necessidade
                            int diaSemanaUltimoDia = (LocalDate.of(ano, mes, diasNoMes).getDayOfWeek().getValue() % 7);
                            for (int i = diaSemanaUltimoDia + 1; i <= 6; i++) {
                                out.print("<td></td>");
                            }
                        %>
                    </tr>
                </table>
            <%  } else {
                out.print(errorMessage);
                }
            %>
        </div>
    </body>
</html>
