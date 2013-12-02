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

    public boolean insert(Usuario usuario) throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "INSERT INTO `usuarios`(ST_NOME_USU,ST_EMAIL_USU,ST_SENHA_USU,ST_CNPJ_USU,"
                    + "FL_ATIVO_USU,FL_FORNECEDOR_USU) "
                    + "VALUES ('" + usuario.getNome() + "', '" + usuario.getEmail() + "', "
                    + "'" + usuario.getSenha() + "', '"+usuario.getCnpj()+"', "
                    + "'" +usuario.getFlAtivo()+"', '"+usuario.getflFornecedor()+"'  )";

            String consulta = "SELECT * FROM USUARIOS WHERE ST_CNPJ_USU = '" + usuario.getCnpj() + "'";

            ResultSet resultado = bd.execConsulta(consulta);

            while (resultado.next()) {
                contUsuario++;
            }

            if (contUsuario > 0) {
                return false;
            }

            bd.execComando(query);
            bd.fecharConexao();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }

    public boolean update(Usuario usuario) throws Exception {

        try {

            Integer contUsuario = 0;

            String query = "UPDATE `usuarios` "
                    + "SET `ST_NOME_USU`='"+usuario.getNome()+"',\n"
                    + "`ST_EMAIL_USU`='"+usuario.getEmail()+"',\n"
                    + "`ST_SENHA_USU`='"+usuario.getSenha()+"', \n"
                    + "`FL_FORNECEDOR_USU`='"+usuario.getflFornecedor()+"', \n"
                    + "`ST_SEXO_USU`='"+usuario.getSexo()+"', \n" 
                    + "`ST_CEP_USU`='"+usuario.getCep()+"', \n" 
                    + "`ST_UF_USU`='"+usuario.getUf()+"', \n" 
                    + "`ST_ENDERECO_USU`='"+usuario.getEndereco()+"', \n"
                    + "`ST_BAIRRO_USU`='"+usuario.getBairro()+"', \n" 
                    + "`ST_CIDADE_USU`='"+usuario.getCidade()+"'\n" +
                    " WHERE (`ID_USUARIO_USU`='"+usuario.getidUsuario()+"') ";
            
            bd.execComando( query );
            bd.fecharConexao();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }
    public boolean ativarEmpresa(int idEmpresa) throws Exception {

        try {

            String query = "UPDATE `usuarios` SET `FL_ATIVO_USU`= '1' WHERE (`ID_USUARIO_USU`='"+idEmpresa+"') ";
            
            bd.execComando( query );
            bd.fecharConexao();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }

    public ResultSet comEmail(String email) throws Exception {

        String consulta = "SELECT * FROM USUARIOS WHERE ST_EMAIL_USU = '" + email + "' ";
        ResultSet dadosUsuario = bd.execConsulta(consulta);

        return dadosUsuario;

    }

    public ResultSet comId(int idUsuario) throws Exception {

        String consulta = "SELECT * FROM USUARIOS WHERE ID_USUARIO_USU = '" + idUsuario + "' ";

//        System.out.println("comId:" + consulta);

        ResultSet dadosUsuario = bd.execConsulta(consulta);

        return dadosUsuario;

    }

    public boolean isAutentic(Usuario usuario) throws Exception {

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
