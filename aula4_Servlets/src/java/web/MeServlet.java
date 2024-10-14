package web;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// Possibilita a captura de dados atrelados a data
import java.util.Calendar;
import java.util.Date;

/** @author isaquesv */
@WebServlet(name = "MeServlet", urlPatterns = {"/me.html"})
public class MeServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Criando um objeto Date
        Date data = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(data);
        // Capturando o ano atual
        int anoAtual = calendar.get(Calendar.YEAR);
        
        String RA = "1290482312027";
        String nome = "ISAQUE SILVA VENANCIO";
        int idade = anoAtual - 2005;
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Exercício 1 - MeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<a href='index.html'>Voltar</a><hr>");
            out.println("<h1>RA: " + RA + "</h1>");
            out.println("<h2>Nome: " + nome + "</h2>");
            out.println("<h2>Idade: " + idade + " anos</h2><hr>");
            out.println("<a href='greeting.html'><button>GreetingServlet</button></a>");
            out.println("<a href='random.html'><button>RandomServlet</button></a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
