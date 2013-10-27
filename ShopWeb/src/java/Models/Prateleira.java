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
    
    public Prateleira() throws Exception {
    }

}
