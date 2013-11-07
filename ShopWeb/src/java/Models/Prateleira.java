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
public class Prateleira {

    protected String nome = null;
    protected int idUsuario = 0;
    protected int idCategoria = 0;
    
    
    public Prateleira() throws Exception {
        this.nome = null;
        this.idCategoria = 0;
        this.idUsuario = 0;
    }
    
    public Prateleira( String _nome, int _idCategoria, int _idUsuario) throws Exception {
        this.nome = _nome;
        this.idCategoria = _idCategoria;
        this.idUsuario = _idUsuario;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    
    public void setidUsuario(int  idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public void setidCategoria(int  idCategoria) {
        this.idCategoria = idCategoria;
    }
    
    public String getNome() {
        return this.nome;
    }

    public int getidUsuario() {
        return this.idUsuario ;
    }
    
    public int getidCategoria() {
        return this.idCategoria ;
    }
    


}
