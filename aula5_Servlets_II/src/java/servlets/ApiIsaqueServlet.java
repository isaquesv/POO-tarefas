package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import org.json.JSONArray;
import org.json.JSONObject;

/** @author isaquesv */
@WebServlet(name = "ApiIsaqueServlet", urlPatterns = {"/isaque.json"})
public class ApiIsaqueServlet extends HttpServlet {
    private ArrayList<String> listaPlanoDeEnsinoAtual = new ArrayList<>(Arrays.asList("Banco de Dados (IBD002)", "Engenharia de Software III (IES300)", "Programação Orientada a Objetos (ILP007)", "Linguagem de Programação IV - INTERNET (ILP512)", "Sistemas Operacionais II (ISO200)", "Metodologia da Pesquisa científico-Tecnológica (TTG001)"));
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            String RA = "1290482312027";
            String nome = "ISAQUE SILVA VENANCIO";
            
            JSONObject obj = new JSONObject();
            JSONArray arr = new JSONArray();
            
            for(String e: listaPlanoDeEnsinoAtual){
                arr.put(e);
            }
            obj.put("RA: ", RA);
            obj.put("Nome: ", nome);
            obj.put("Plano de Ensino Atual", arr);
            out.print(obj.toString());
            
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
    }
}