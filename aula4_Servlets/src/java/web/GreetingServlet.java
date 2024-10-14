package web;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// Possibilita a captura de dados atrelados a data
import java.time.LocalDateTime;

/** @author isaquesv */
@WebServlet(name = "GreetingServlet", urlPatterns = {"/greeting.html"})
public class GreetingServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String horarioAtual, mensagem = null;
        LocalDateTime dataAtual = LocalDateTime.now();

        // Capturando a HORA, MINUTOs e SEGUNDOS atuais
        int horaAtual = dataAtual.getHour();
        int minutosAtual = dataAtual.getMinute();
        int segundosAtual = dataAtual.getSecond();
        
        // Formatando a HORA
        if (horaAtual < 10) {
            horarioAtual = "0" + horaAtual + ":";
        } else {
            horarioAtual = horaAtual + ":";
        }
        
        // Formatando os MINUTOS
        if (minutosAtual < 10) {
            horarioAtual += "0" + minutosAtual + ":";
        } else {
            horarioAtual += minutosAtual + ":";
        }
        
        // Formatando os SEGUNDOS
        if (segundosAtual < 10) {
            horarioAtual += "0" + segundosAtual;
        } else {
            horarioAtual += segundosAtual;
        }
        
        if (horaAtual > 4 && horaAtual < 12) {
            mensagem = "bom dia";                           // 05h -> 11h
        } else if (horaAtual >= 12 && horaAtual < 18) {
            mensagem = "boa tarde";                         // 12h -> 18h
        } else if (horaAtual >= 18 && horaAtual < 24) {
            mensagem = "boa noite";                         // 19h -> 23h
        } else {
            mensagem = "vá dormir";                         // 00h -> 04h
        }
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Exercício 2 - GreetingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<a href='index.html'>Voltar</a><hr>");
            out.println("<h1>Horário atual: " + horarioAtual + "</h1>");
            out.println("<h2>" + mensagem + "</h2><hr>");
            out.println("<a href='me.html'><button>MeServlet</button></a>");
            out.println("<a href='random.html'><button>RandomServlet</button></a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
