package Controllers;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Library.Conexao;
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
@WebServlet("/usuarios/ControllerUsuarios")
public class ControllerUsuarios extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     * 
     * 
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
                   throws ServletException, IOException {
        
      try{  
          
          response.setContentType("text/html;charset=UTF-8");
          PrintWriter out = response.getWriter();

          String email = request.getParameter("email");
          String nome = request.getParameter("nome");
          String senha = request.getParameter("senha");
          String confimacaosenha = request.getParameter("confimacaosenha");

          Usuario usuario = new Usuario();
          Usuarios daoUsuarios = new Usuarios();
          
          usuario.setEmail( email );
          usuario.setSenha( senha );
          usuario.setNome( nome );
          
         
          if( !daoUsuarios.insert( usuario )){          
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Erro de cadastro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Email já esta sendo utilizado.</h1>");
            out.println("</body>");
            out.println("</html>");  
          }else{
              
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Sucesso</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Cadastro efetuado com sucesso. </h1>");
            out.println("</body>");
            out.println("</html>");  
            
          }
          
          
          
            
      }catch(Exception e){
      
      }
    
    }
    protected void post(HttpServletRequest request, HttpServletResponse response)
                   throws ServletException, IOException {
        
      try{  
          
          response.setContentType("text/html;charset=UTF-8");
          PrintWriter out = response.getWriter();

          String email = request.getParameter("email").trim();
          String nome = request.getParameter("nome").trim(); 
          String senha = request.getParameter("senha").trim(); 
          String sexo = request.getParameter("sexo").trim(); 
          int idUsuario = Integer.parseInt(request.getParameter("usuario"));
          int flFornecedor = 0;

          Usuario usuario = new Usuario( email, sexo, nome, senha, flFornecedor, idUsuario  );
          Usuarios daoUsuarios = new Usuarios();
          
//          usuario.setEmail( email );
//          usuario.setSenha( senha );
//          usuario.setNome( nome );
//          usuario.setSexo(sexo );
          
         
          if( daoUsuarios.update( usuario )){ 
             response.sendRedirect("/ShopWeb/usuarios/dadosusuario.jsp?usuario="+idUsuario+"");                    
          }  
            
      }catch(Exception e){
      
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
               Logger.getLogger(ControllerUsuarios.class.getName()).log(Level.SEVERE, null, ex);
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
               Logger.getLogger(ControllerUsuarios.class.getName()).log(Level.SEVERE, null, ex);
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
