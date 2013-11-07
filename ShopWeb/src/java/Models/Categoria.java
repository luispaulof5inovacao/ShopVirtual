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

     
    protected String nome = null;
    protected int idUsuario = 0;
    protected int idCategoria = 0;

    public Categoria( String _nome, int _idUsuario, int _idCategoria) {
       this.nome = _nome;
       this.idUsuario = _idUsuario;
       this.idCategoria = _idCategoria;
    }
    public Categoria() {
       this.nome = null;
       this.idUsuario = 0;
       this.idCategoria = 0;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setidUsuario(int  idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public int getIdCategoria() {
        return this.idCategoria;
    }
    
    public String getNome() {
        return this.nome;
    }

    public int getidUsuario() {
        return this.idUsuario ;
    }
    
//    public Categoria( int _idUsuario, String _nomeCategoria, int _idCategoria ) throws Exception {
//         
//        this.nome = _nomeCategoria;
//        this.idUsuario = _idUsuario;
//        
//    }

}
