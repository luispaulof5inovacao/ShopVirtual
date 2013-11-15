/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Categoria;
import Models.Categorias;
import Models.Prateleira;
import Models.Prateleiras;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LuisPaulo
 */
@WebServlet("/prateleiras/ControllerPrateleiras")
public class ControllerPrateleiras extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
                                
           String acao = request.getParameter("acao");
           
           if( acao.equals("post") )
               this.post( request , response );
           
           if( acao.equals("put") )
               this.put( request , response );
           
 
        } finally {            
            out.close();
        }
    }
    
   protected void put( HttpServletRequest request, HttpServletResponse response ) throws Exception{        
                   
            /* TODO output your page here. You may use following sample code. */
        String nomePrateleira = request.getParameter("nome");
        int idUsuario = Integer.parseInt(request.getParameter("usuario"));
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        int idPrateleira = 0;
        
       Prateleira prateleira = new Prateleira( nomePrateleira, idCategoria, idUsuario, idPrateleira);
       Prateleiras daoPrateleiras = new Prateleiras();
       
       Categorias categorias = new Categorias();
       ResultSet _categoria = categorias.categoria(idUsuario, idCategoria);
       _categoria.next();

        if (daoPrateleiras.insert( prateleira, idUsuario )) {
            response.sendRedirect("/ShopWeb/usuarios/prateleiras.jsp?idcategoria="+idCategoria+"&usuario="+idUsuario+"&categoria="+_categoria.getString("ST_NOME_CAT")+" ");
        }       
    
    
    }
   protected void post( HttpServletRequest request, HttpServletResponse response ) throws Exception{        
                   
            /* TODO output your page here. You may use following sample code. */
        String nomePrateleira = request.getParameter("nome").trim();        
        int idUsuario = Integer.parseInt(request.getParameter("usuario"));
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        int idPrateleira = Integer.parseInt(request.getParameter("prateleira"));
        int novaCategoria = Integer.parseInt(request.getParameter("novacategoria"));
        
       Prateleira prateleira = new Prateleira( nomePrateleira , idCategoria, idUsuario , idPrateleira);
       Prateleiras daoPrateleiras = new Prateleiras();
       
              Categorias categorias = new Categorias();
       ResultSet _categoria = categorias.categoria(idUsuario, idCategoria);
       _categoria.next();

        if (daoPrateleiras.update( prateleira, idCategoria, novaCategoria )) {
            response.sendRedirect("/ShopWeb/usuarios/prateleiras.jsp?idcategoria="+idCategoria+"&usuario="+idUsuario+"&categoria="+_categoria.getString("ST_NOME_CAT")+" ");
        }       
    
    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ControllerPrateleiras.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ControllerPrateleiras.class.getName()).log(Level.SEVERE, null, ex);
        }
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
