/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Library;

import java.sql.*;

public class Conexao
{
    private Connection conexao;
    private Statement  comando;
    
    private String drv = "com.mysql.jdbc.Driver";
    private String strCon = "jdbc:mysql://localhost/shopweb";
    private String usr = "root";
    private String senha = "123456";
    

    public Conexao () throws Exception
    {
        try
        {
            Class.forName (this.drv);
        }
        catch (ClassNotFoundException e)
        {
            throw new Exception ("driver");
        }

        try
        {
            
            conexao = DriverManager.getConnection (this.strCon, this.usr, this.senha);
        }
        catch (SQLException e)
        {
            throw new Exception ("conexao");
        }

        try
        {
            comando = conexao.createStatement
                     (ResultSet.TYPE_SCROLL_INSENSITIVE,
                      ResultSet.CONCUR_READ_ONLY);
        }
        catch (SQLException e)
        {
            throw new Exception ("comando");
        }
    }

    public void execComando (String cmdSQL) throws Exception
    {
        try
        {
            System.out.println("-->"+cmdSQL);
            
            this.comando.executeUpdate ( cmdSQL );
            
            
        }
        catch (SQLException e)
        {
            throw new Exception ("execucao comando");
        }
    }

    public ResultSet execConsulta (String qrySQL) throws Exception
    {
        ResultSet resultado = null;

        try
        {
            resultado = this.comando.executeQuery (qrySQL);
        }
        catch (SQLException e)
        {
            throw new Exception ("execucao consulta");
        }

        return resultado;
    }

    public void fecharConexao () throws Exception
    {
        try
        {
            this.comando.close ();
            this.comando = null;

            this.conexao.close ();
            this.conexao = null;
        }
        catch (SQLException e)
        {
            throw new Exception ("fechamento");
        }
    }
}
