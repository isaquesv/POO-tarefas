/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        
        // Formatando a MINUTOS
        if (minutosAtual < 10) {
            horarioAtual += "0" + minutosAtual + ":";
        } else {
            horarioAtual += minutosAtual + ":";
        }
        
        // Formatando a SEGUNDOS
        if (segundosAtual < 10) {
            horarioAtual += "0" + segundosAtual;
        } else {
            horarioAtual += segundosAtual;
        }
        
        if (horaAtual > 4 && horaAtual < 12) {
            mensagem = "bom dia";                           // 05h -> 11h
        } else if (horaAtual >= 12 && horaAtual < 18) {
            mensagem = "boa tarde";                         // 12h -> 18h
        } else if (horaAtual >= 18 && horaAtual < 24) {     // 19h -> 23h
            mensagem = "boa noite";
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
