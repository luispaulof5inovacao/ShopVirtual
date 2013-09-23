/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import com.google.common.base.Function;
import com.sun.xml.rpc.processor.config.NoMetadataModelInfo;

/**
 *
 * @author LuisPaulo
 */
public class Usuario {
    
    protected String email;
    protected String nome;
    protected String senha;
    
    public void setEmail( String email ){
      this.email = email;
    }
    
    public void setNome( String nome ){
      this.nome = nome;
    }
    
    public void setSenha( String senha ){
      this.senha = senha;
    }
    
   
    
}
