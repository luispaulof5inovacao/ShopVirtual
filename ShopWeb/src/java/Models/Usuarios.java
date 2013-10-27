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

    public Usuarios() throws Exception {
        this.bd = new Conexao();
    }

    public boolean insert( Usuario usuario) throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "INSERT INTO `usuarios`(ST_NOME_USU,ST_EMAIL_USU,ST_SENHA_USU) "
                    + "VALUES ('" + usuario.getNome() + "', '" + usuario.getEmail() + "', '" + usuario.getSenha() + "')";

            String consulta = "SELECT * FROM USUARIOS WHERE ST_EMAIL_USU = '" + usuario.getEmail() + "'";

            ResultSet resultado = bd.execConsulta(consulta);

            while (resultado.next()) {
                contUsuario++;
            }

            if (contUsuario > 0) 
                return false;
                  
//            System.out.println("-->Inserte : "+usuario.getNome());
//            System.out.println("-->Inserte Email :"+usuario.getEmail());
//            System.out.println("-->Inserte ssenha: "+usuario.getSenha());
            
            bd.execComando( query );
            bd.fecharConexao();
            
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }
    
    public ResultSet comEmail( String email ) throws Exception{
        
        String consulta = "SELECT * FROM USUARIOS WHERE ST_EMAIL_USU = '" + email + "' ";        
        ResultSet dadosUsuario = bd.execConsulta(consulta);
        
        return dadosUsuario;    
    
    }

    public boolean isAutentic( Usuario usuario ) throws Exception {

            Integer contUsuario = 0;

            String consulta = "SELECT * FROM USUARIOS WHERE ST_EMAIL_USU = '" + usuario.getEmail() + "'AND ST_SENHA_USU = '" + usuario.getSenha() + "' ";
            ResultSet dadosUsuario = bd.execConsulta(consulta);
//            bd.fecharConexao();
            
            
            return dadosUsuario.next();

//            while (dadosUsuario.next())
//                 contUsuario++;
//              
//            if ( contUsuario == 1 ) {
//                
//                dadosUsuario.first();
//                
//               Usuario usuarioLogado = new Usuario();
//               
//               usuarioLogado.setEmail( dadosUsuario.getString( "ST_EMAIL_USU" ) );
//               usuarioLogado.setNome( dadosUsuario.getString( "ST_NOME_USU" ) );
//               usuarioLogado.setSenha(  dadosUsuario.getString( "ST_SENHA_USU" ) );
//               usuarioLogado.setflFornecedor( dadosUsuario.getInt( "FL_FORNECEDOR_USU" ) ); 
//               usuarioLogado.setidUsuario( dadosUsuario.getInt( "ID_USUARIO_USU" ) );              
//                   
//                
//                return true;
//                
//            }
//
//            if (contUsuario < 1) {
//                return false;
//            }
            
       

        
//        return false;

        
    }

    private String MD5(String senha) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void Exception(String usuario_já_cadastro) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
