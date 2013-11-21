/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Categoria;
import Models.Categorias;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/categorias/ControllerCategorias")
public class ControllerCategorias extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

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
        
        PrintWriter out = response.getWriter();
                   
        int idUsuario = Integer.parseInt(request.getParameter("usuario"));
        String nomeCategoria = request.getParameter("nome");
        String descricaoCategoria = request.getParameter("descricao");
        
        int idCategoria = 0;
        
        Categoria categoria = new Categoria(nomeCategoria, idUsuario, idCategoria, descricaoCategoria );
        Categorias daoCategoria = new Categorias();

        if (daoCategoria.insert(categoria, idUsuario)) {
            
                   out.println("<script type='text/javascript'> "
                      + "alert('Categoria cadastrada com sucesso!');"
                      + " location.href='/ShopWeb/usuarios/categorias.jsp'; "
                      + " </script>");  

        }       
    
    
    }
    protected void post( HttpServletRequest request, HttpServletResponse response ) throws Exception{
    
        PrintWriter out = response.getWriter();
        int idUsuario = Integer.parseInt(request.getParameter("usuario"));
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        
        String descricao = request.getParameter("descricao");        
        String nomeCategoria = request.getParameter("nome");
        
        Categoria categoria = new Categoria( nomeCategoria, idUsuario, idCategoria, descricao );
        Categorias daoCategoria = new Categorias();

        if (daoCategoria.post( categoria )) {
                  out.println("<script type='text/javascript'> "
                      + "alert('Categoria alterada com sucesso!');"
                      + " location.href='/ShopWeb/usuarios/categorias.jsp'; "
                      + " </script>");              
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
            Logger.getLogger(ControllerCategorias.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ControllerCategorias.class.getName()).log(Level.SEVERE, null, ex);
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
