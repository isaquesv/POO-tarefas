package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import org.json.JSONArray;
import org.json.JSONObject;

/** @author isaquesv */
@WebServlet(name = "ApiLoteriaServlet", urlPatterns = {"/loteria.json"})
public class ApiLoteriaServlet extends HttpServlet {
    private ArrayList<String> listaNumerosLoteria = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            // Limpando os números anteriores do array
            listaNumerosLoteria = new ArrayList<>();
            int valorAtual;
            boolean valorDuplicado = true;
            
            JSONObject obj = new JSONObject();
            obj.put("Data/hora ", new Date());
            
            for (int i = 0; i < 6; i++) {
                do {
                    valorAtual = (int) (Math.random() * 100) + 1; // Gerando um valor aleatório entre 0 e 100
                    valorDuplicado = false;

                    for (int j = 0; j < i; j++) {
                        // Verifica se o valor gerado já existe no array
                        if (listaNumerosLoteria.get(j).equals(String.valueOf(valorAtual))) {
                            valorDuplicado = true;
                            break;
                        }
                    }
                } // Repete o laço enquanto o último valor gerado já estiver no array
                while (valorDuplicado);
                
                if (valorAtual < 10) {
                    listaNumerosLoteria.add("0" + String.valueOf(valorAtual));
                } else {
                    listaNumerosLoteria.add(String.valueOf(valorAtual));
                }
            }
            
            JSONArray arr = new JSONArray();
            for(String e: listaNumerosLoteria){
                arr.put(e);
            }
            obj.put("Números aleatórios loteria:", arr); 
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