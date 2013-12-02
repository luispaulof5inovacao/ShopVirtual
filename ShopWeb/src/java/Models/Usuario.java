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
    protected String cnpj = null;
    protected String endereco = null;
    protected String bairro = null;
    protected String cidade = null;
    protected String cep = null;
    protected String uf = null;
    protected int flFornecedor = 0;
    protected int flAtivo = 0;
    protected int idUsuario = 0;

    public Usuario(String _email, String _sexo, String _nome, String _senha,
            int _flFornecedor, int _idUsuario, String _cnpj, int _flAtivo,
            String _endereco, String _cidade, String _bairro, String _uf, String _cep) throws Exception {
        this.email = _email;
        this.sexo = _sexo;
        this.senha = _senha;
        this.nome = _nome;
        this.endereco = _endereco;
        this.bairro = _bairro;
        this.cidade = _cidade;
        this.uf = _uf;
        this.cep = _cep;
        this.flFornecedor = _flFornecedor;
        this.idUsuario = _idUsuario;
        this.cnpj = _cnpj;
        this.flAtivo = _flAtivo;
    }

    public Usuario() throws Exception {
        this.email = null;
        this.sexo = null;
        this.senha = null;
        this.nome = null;
        this.endereco = null;
        this.bairro = null;
        this.cidade = null;
        this.uf = null;
        this.cep = null;
        this.flFornecedor = 0;
        this.flAtivo = 0;
        this.idUsuario = 0;
        this.cnpj = null;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
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

    public void setflAtivo(int flAtivo) {
        this.flAtivo = flAtivo;
    }

    public void setflFornecedor(int flFornecedor) {
        this.flFornecedor = flFornecedor;
    }

    public void setidUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    
    public String getCep() {
        return this.cep;
    }

    public String getBairro() {
        return this.bairro;
    }

    public String getEndereco() {
        return this.endereco;
    }

    public String getCidade() {
        return this.cidade;
    }

    public String getUf() {
        return this.uf;
    }

    public int getFlAtivo() {
        return this.flAtivo;
    }

    public String getCnpj() {
        return this.cnpj;
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
        return this.flFornecedor;
    }

    public int getidUsuario() {
        return this.idUsuario;
    }

    public String getSenha() {
        return this.senha;
    }
}
