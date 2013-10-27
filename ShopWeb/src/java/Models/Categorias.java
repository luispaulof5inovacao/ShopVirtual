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
public class Categorias {

    protected Conexao bd;
    private ResultSet resultado;
    
    public Categorias() throws Exception {
        this.bd = new Conexao();
    }

    public boolean insert( Categoria categoria) throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "INSERT INTO `categorias`(ST_NOME_CAT) "
                    + "VALUES ('" + categoria.getNome() + "')";

            bd.execComando( query );
            bd.fecharConexao();
            
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }
    public ResultSet categorias () throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "Select * from categorias";
            
            ResultSet resultado = bd.execConsulta( query );
            
            return resultado;

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resultado;

    }

    private String MD5(String senha) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void Exception(String usuario_já_cadastro) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
