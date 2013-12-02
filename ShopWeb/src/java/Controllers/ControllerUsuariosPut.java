/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Usuario;
import Models.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LuisPaulo
 */
@WebServlet(name = "ControllerUsuariosPut", urlPatterns = {"/ControllerUsuariosPut"})
public class ControllerUsuariosPut extends HttpServlet {

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

            response.setContentType("text/html;charset=UTF-8");

            String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            String cnpj = request.getParameter("cnpj");
            String confimacaosenha = request.getParameter("confimacaosenha");
            int flFornecedor = 0;

            if (!senha.equals(confimacaosenha)) {
                out.println("<script type='text/javascript'> "
                        + "alert('Senhas diferentes!');"
                        + " location.href='index.html'; "
                        + " </script>");
            } else {

                Usuario usuario = new Usuario();
                Usuarios daoUsuarios = new Usuarios();

                usuario.setEmail(email);
                usuario.setSenha(senha);
                usuario.setNome(nome);
                usuario.setCnpj(cnpj);
                usuario.setflAtivo(flFornecedor);


                if (!daoUsuarios.insert(usuario)) {
                    out.println("<script type='text/javascript'> "
                            + "alert('Erro ao cadastrar CNPJ já esta sendo utilizado!');"
                            + " location.href='index.html'; "
                            + " </script>");

                } else {
                    out.println("<script type='text/javascript'> "
                            + "alert('Cadastrado realizado com sucesso! "
                            + "Aguarde 24 horas para liberação do cadastro.');"
                            + " location.href='login.jsp'; "
                            + " </script>");
                }


            }
        } catch (Exception e) {
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
