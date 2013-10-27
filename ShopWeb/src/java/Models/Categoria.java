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
public class Categoria {

    protected Conexao bd;
    protected String nome = null;
    protected int idUsuario = 0;

    public Categoria() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setidUsuario(int  idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public String getNome() {
        return this.nome;
    }

    public int getidUsuario() {
        return this.idUsuario ;
    }
    
    public Categoria( int _idUsuario, String _nomeCategoria) throws Exception {
         
        this.nome = _nomeCategoria;
        this.idUsuario = _idUsuario;
        
    }

}
