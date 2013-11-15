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
public class Produtos {

    protected Conexao bd;
    private ResultSet resultado;
 
    public Produtos() throws Exception {
        this.bd = new Conexao();
    }

    public boolean insert( Produto produto ) throws Exception {

        try {

            Integer contUsuario = 0;

            String queryProduto = "INSERT INTO `produtos`(ST_NOME_PRO,VL_PRODUTO_PRO,ST_DESCRICAO_PRO) "
                    + "VALUES ('" + produto.getNome() + "','"+produto.getValor()+"','"+produto.getDescricao()+"')";
            bd.execComando( queryProduto );
            
            ResultSet idProduto = bd.execConsulta("select * from produtos");
            idProduto.last();
            
            int _idProduto = idProduto.getInt("ID_PRODUTO_PRO");
            
            
            String queryProdutoUsuario = "INSERT INTO `produtos_usuario`( ID_USUARIO_USU, ID_PRODUTO_PRO ) "
                    + "VALUES ('" + produto.getidUsuario()+ "','"+_idProduto+"' )";
            bd.execComando( queryProdutoUsuario );
            
            
            
            String queryProdutoPrateleira = "INSERT INTO `produtos_prateleiras`( ID_PRODUTO_PRO, ID_PRATELEIRA_PRA ) "
                    + "VALUES ('" + _idProduto + "','"+produto.getidPrateleira()+"' )";
            bd.execComando( queryProdutoPrateleira );
            
            
            bd.fecharConexao();
            
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }
    
    public ResultSet produtos () throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "Select * from produtos";
            
            ResultSet resultado = bd.execConsulta( query );
            
            return resultado;

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resultado;

    }
    
    public ResultSet doUsuario ( int idUsuario, int idPrateleira ) throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "SELECT produtos_usuario.ID_USUARIO_USU,produtos.*\n" +
                             "from produtos_usuario\n" +
                            "LEFT JOIN produtos on (produtos.ID_PRODUTO_PRO = produtos_usuario.ID_PRODUTO_PRO)\n" +
                            "LEFT JOIN produtos_prateleiras on (produtos_prateleiras.ID_PRODUTO_PRO = produtos.ID_PRODUTO_PRO)\n" +
                            "where produtos_usuario.ID_USUARIO_USU = '"+idUsuario+"'\n" +
                            "and produtos_prateleiras.ID_PRATELEIRA_PRA = '"+idPrateleira+"' ";
            
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
