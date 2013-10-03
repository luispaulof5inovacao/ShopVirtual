/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Library.Conexao;
import java.sql.ResultSet;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LuisPaulo
 */
public class Usuarios {

    protected Conexao bd;
    protected String email;
    protected String nome;
    protected String senha;
    protected String flFornecedor;

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public void setflFornecedor(String flFornecedor) {
        this.flFornecedor = flFornecedor;
    }
    
    
    public String getEmail() {
        return this.email;
    }

    public String getNome() {
        return this.nome;
    }

    public String getflFornecedor() {
        return this.flFornecedor ;
    }
    
    
    

    public Usuarios() throws Exception {
        this.bd = new Conexao();
    }

    public void insert() throws Exception {

        try {


            Integer contUsuario = 0;

            String query = "INSERT INTO `usuarios`(ST_NOME_USU,ST_EMAIL_USU,ST_SENHA_USU) "
                    + "VALUES ('" + this.nome + "', '" + this.email + "', '" + this.senha + "')";

            String consulta = "SELECT * FROM USUARIOS WHERE ST_EMAIL_USU = '" + this.email + "'";

            ResultSet resultado = bd.execConsulta(consulta);

            while (resultado.next()) {
                contUsuario++;
            }

            if (contUsuario > 0) {
                throw new Exception("Usuario já cadastro");
            }

//     System.out.println("-->"+contUsuario);

            bd.execComando(query);
            bd.fecharConexao();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public boolean auth() throws Exception {

        try {

            Integer contUsuario = 0;

            String consulta = "SELECT * FROM USUARIOS WHERE ST_EMAIL_USU = '" + this.email + "'AND ST_SENHA_USU = '" + this.senha + "' ";
            ResultSet resultado = bd.execConsulta(consulta);

            while (resultado.next())
                 contUsuario++;
              
            if ( contUsuario == 1 ) {
                
                this.setNome(resultado.getString("ST_NOME_USU"));
                this.setEmail(resultado.getString("ST_SENHA_USU"));
                
                return true;
                
            }

            if (contUsuario < 1) {
                return false;
            }
            



        } catch (Exception e) {
            e.printStackTrace();
        }

        bd.fecharConexao();

        return true;
    }

    private String MD5(String senha) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void Exception(String usuario_já_cadastro) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
