/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Produto;
import Models.Produtos;
import Models.Usuario;
import Models.Usuarios;
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
@WebServlet("/produtos/ControllerProdutos")
public class ControllerProdutos extends HttpServlet {

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

    protected void put(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
//        response.setCon   tentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String nomeProduto = request.getParameter("nomeproduto");
            String valor  = request.getParameter("valorproduto");
            valor = valor.replace(",", ".");
            float valorProduto = Float.valueOf(valor);
            int prateleiraProduto = Integer.parseInt(request.getParameter("prateleira"));
            String descricaoProduto = request.getParameter("descricao");
            int idUsuario = Integer.parseInt(request.getParameter("usuario"));

            Produto produto = new Produto(nomeProduto, valorProduto, 
                    prateleiraProduto, descricaoProduto, idUsuario);
            
            Produtos daoProdutos = new Produtos();

            
        if ( daoProdutos.insert(produto) ) {
                   out.println("<script type='text/javascript'> "
                      + "alert('Produto cadastrado com sucesso!');"
                      + " location.href='/ShopWeb/usuarios/categoriasprodutos.jsp?usuario="+idUsuario+"'; "
                      + " </script>");                   
        }   


        } finally {
            out.close();
        }
    }
    
    protected void post(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
//        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String nomeProduto = request.getParameter("nomeproduto");
            String valor  = request.getParameter("valorproduto");
            valor = valor.replace(",", ".");
            float valorProduto = Float.valueOf(valor);
            int prateleiraProduto = Integer.parseInt(request.getParameter("prateleira"));
            String descricaoProduto = request.getParameter("descricao");
            int idUsuario = Integer.parseInt(request.getParameter("usuario"));

            Produto produto = new Produto(nomeProduto, prateleiraProduto, prateleiraProduto, descricaoProduto, idUsuario);
            Produtos daoProdutos = new Produtos();

//            daoProdutos.insert(produto);


        } finally {
            out.close();
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
            Logger.getLogger(ControllerProdutos.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ControllerProdutos.class.getName()).log(Level.SEVERE, null, ex);
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
