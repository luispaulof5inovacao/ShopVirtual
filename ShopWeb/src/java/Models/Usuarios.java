/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;
import Library.Conexao;

/**
 *
 * @author LuisPaulo
 */
public class Usuarios extends Usuario{
    
    Conexao bd;

    public Usuarios() throws Exception {
        this.bd = new Conexao ();
    }
    
    public void insert() throws Exception{
        
     String query = "INSERT INTO `usuarios`(ST_NOME_USU,ST_EMAIL_USU,ST_SENHA_USU) "
             + "VALUES ('Luis', 'sim', '745623')";
    
       System.out.println(query);
     
      bd.execComando(query);
      bd.fecharConexao ();
    
    
    }

    private String MD5(String senha) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    
}
