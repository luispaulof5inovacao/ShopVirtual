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

    public boolean insert( Categoria categoria , int idUsuario) throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "INSERT INTO `categorias`(ST_NOME_CAT) "
                    + "VALUES ('" + categoria.getNome() + "')";
            
            bd.execComando( query );
            
            ResultSet idCategoria = bd.execConsulta("select * from categorias");
            idCategoria.last();
            
            int _idCategoria = idCategoria.getInt("ID_CATEGORIA_CAT");
            
            String queryUsuarioCategorias = "INSERT INTO `categorias_usuario`( ID_CATEGORIA_CAT, ID_USUARIO_USU ) "
                    + "VALUES ('" + _idCategoria + "', '"+ idUsuario +"')";

            bd.execComando( queryUsuarioCategorias );  
            
            
            bd.fecharConexao();
            
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }
    public ResultSet getCategorias () throws Exception {

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
    
   public ResultSet doUsuario( int idUsuario) throws Exception {

        try {

            String queryCategoriasDoUsuario  = "select categorias_usuario.*,categorias.ST_NOME_CAT\n" +
                            "from categorias_usuario\n" +
                            "LEFT JOIN categorias on ( categorias.ID_CATEGORIA_CAT = categorias_usuario.ID_CATEGORIA_CAT)\n" +
                            "where categorias_usuario.ID_USUARIO_USU = '"+ idUsuario +"' ";
            
            ResultSet resultado = bd.execConsulta( queryCategoriasDoUsuario );
            
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
