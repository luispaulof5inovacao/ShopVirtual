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
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author LuisPaulo
 */
@WebServlet(urlPatterns = {"/ControllerAuth"})
public class ControllerAuth extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            Usuario usuario = new Usuario();            
            Usuarios daoUsuario = new Usuarios();            
            HttpSession session = request.getSession();
                
            usuario.setEmail( email );
            usuario.setSenha( senha );
            
            /*sucesso ao logar*/ 
            if( daoUsuario.isAutentic( usuario )){
                                
                ResultSet dadosUsuario = daoUsuario.comEmail(email);
                dadosUsuario.first();
                
                session.setAttribute("nome", dadosUsuario.getString( "ST_NOME_USU" ));
                session.setAttribute("email", dadosUsuario.getString( "ST_EMAIL_USU" ) );
                session.setAttribute("usuario", dadosUsuario.getInt( "ID_USUARIO_USU" ) );
                session.setAttribute("fornecedor", dadosUsuario.getInt( "FL_FORNECEDOR_USU" ) );

                response.sendRedirect("/ShopWeb/usuarios/home.jsp");  
                
            }else{            
                session.invalidate();
                out.println("<script type='text/javascript'> "
                      + "alert('Verifique seu email ou senha!');"
                      + " location.href='login.jsp'; "
                      + " </script>");   
            }

            
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
        processRequest(request, response);
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
