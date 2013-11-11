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
public class Prateleiras {

    protected Conexao bd;
    private ResultSet resultado;
 
    public Prateleiras() throws Exception {
        this.bd = new Conexao();
    }

    public boolean insert( Prateleira prateleira, int idUsuario ) throws Exception {
        try {

            Integer contUsuario = 0;

            String queryInsertPrateleiras = "INSERT INTO `prateleiras`(ST_NOME_PRA,ID_CATEGORIA_CAT) "
                    + "VALUES ('" + prateleira.getNome() + "','"+prateleira.getidCategoria()+"')";
            
            bd.execComando( queryInsertPrateleiras );
            
            ResultSet idPrateleira = bd.execConsulta("select * from prateleiras");
            idPrateleira.last();
            
            int _idPrateleira = idPrateleira.getInt("ID_PRATELEIRA_PRA");
            
            String queryUsuarioPrateleiras = "INSERT INTO `prateleiras_usuario`( ID_PRATELEIRA_PRA, ID_USUARIO_USU ) "
                    + "VALUES ('" + _idPrateleira + "', '"+ idUsuario +"')";

            bd.execComando( queryUsuarioPrateleiras );  
                        
            bd.fecharConexao();
            
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }
    
    public ResultSet getPrateleiras () throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "Select * from prateleiras";
            
            ResultSet resultado = bd.execConsulta( query );
            
            return resultado;

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resultado;

    }
    
       public ResultSet doUsuario( int idUsuario) throws Exception {

        try {

            String queryPrateleirasDoUsuario  = "select prateleiras_usuario.*,prateleiras.ST_NOME_PRA\n" +
                            "from prateleiras_usuario\n" +
                            "LEFT JOIN prateleiras on ( prateleiras.ID_PRATELEIRA_PRA = prateleiras_usuario.ID_PRATELEIRA_PRA)\n" +
                            "where prateleiras_usuario.ID_USUARIO_USU = '"+ idUsuario +"' ";
            
            ResultSet resultado = bd.execConsulta( queryPrateleirasDoUsuario );
            
            return resultado;

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resultado;

    }
       public ResultSet daCategoria ( int idCategoria ) throws Exception {

        try {

            String queryPrateleirasDaCategoria  = "select  prateleiras.*, categorias.ST_NOME_CAT\n" +
                                                "from prateleiras\n" +
                                                "LEFT JOIN categorias on (categorias.ID_CATEGORIA_CAT = prateleiras.ID_CATEGORIA_CAT)\n" +
                                                "WHERE categorias.ID_CATEGORIA_CAT = '"+idCategoria+"' ";
            
            ResultSet resultado = bd.execConsulta( queryPrateleirasDaCategoria );
            System.out.println("QYERY:"+ queryPrateleirasDaCategoria );
            
            return resultado;

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resultado;

    }
       
   public boolean update(Prateleira prateleira , int idCategoria) throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "UPDATE `prateleiras` "
                    + "SET `ST_NOME_PRA`='"+prateleira.getNome()+"',\n"+
                    " WHERE (`ID_PRATELEIRA_PRA`='"+prateleira.getidPrateleira()+"') ,\n"+
                    " AND   (`ID_CATEGORIA_CAT`='"+idCategoria+"')";
            
            bd.execComando( query );
            bd.fecharConexao();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }
   public ResultSet comId( int idPrateleira, int idCategoria) throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "SELECT prateleiras.*,categorias.ST_NOME_CAT\n" +
                           "from prateleiras\n" +
                           "LEFT JOIN categorias on (categorias.ID_CATEGORIA_CAT = prateleiras.ID_CATEGORIA_CAT)\n" +
                           "WHERE prateleiras.ID_PRATELEIRA_PRA = '"+idPrateleira+"' \n" +
                           "AND prateleiras.ID_CATEGORIA_CAT = '"+ idCategoria +"' "; 
            
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
