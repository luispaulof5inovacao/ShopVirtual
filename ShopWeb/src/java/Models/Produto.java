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
public class Produto {

    protected String nome = null;
    protected String descricao = null;
    protected int idUsuario = 0;
    protected int idPrateleira = 0;
    protected float valor = 0;

    public Produto(String _nomeProduto, float _valorProduto, int _prateleiraProduto, String _descricaoProduto, int _idUsuario){
        
        this.nome = _nomeProduto;
        this.valor = _valorProduto;
        this.idPrateleira = _prateleiraProduto;
        this.descricao = _descricaoProduto;
        this.idUsuario = _idUsuario;

    }
    
    public Produto(String nomeProduto, String valorProduto, String prateleiraProduto, String descricaoProduto, String idUsuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public void setidUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setidPrateleira(int idCategoria) {
        this.idPrateleira = idCategoria;
    }

    public String getNome() {
        return this.nome;
    }

    public String getDescricao() {
        return this.descricao;
    }

    public float getValor() {
        return this.valor;
    }

    public int getidUsuario() {
        return this.idUsuario;
    }

    public int getidPrateleira() {
        return this.idPrateleira;
    }
}
