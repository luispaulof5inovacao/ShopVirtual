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
public class Usuario {

    protected String email = null;
    protected String sexo = null;
    protected String nome = null;
    protected String senha = null;
    protected int flFornecedor = 0;
    protected int idUsuario = 0;
    
    
    public Usuario() throws Exception {
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public void setflFornecedor(int flFornecedor) {
        this.flFornecedor = flFornecedor;
    }
    
    public void setidUsuario(int  idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public void setSexo(String  sexo) {
        this.sexo = sexo;
    }
    
    
    public String getEmail() {
        return this.email;
    }
    
    public String getSexo() {
        return this.sexo;
    }

    public String getNome() {
        return this.nome;
    }

    public int getflFornecedor() {
        return this.flFornecedor ;
    }
    
    public int getidUsuario() {
        return this.idUsuario ;
    }
    
    public String getSenha() {
        return this.senha ;
    }
    
    
 


}
