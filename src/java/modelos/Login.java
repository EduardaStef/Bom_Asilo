package modelos;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import util.Conexao;

public class Login {
    
    public String emailUsuario="";
    public String tipoAcesso="";
    public String login="";
    public boolean result = false;
    
    public boolean verificarUsuario(String login, String senha)  {
        String sql = "";
        Connection con = Conexao.conectar();
        //INSTRUÇÃO SQL
        sql += "select emailUsuario, tipoAcesso from usuario ";
        sql += "where login = " + "'" + login + "'";
        sql += "and senha = " + "'" + senha + "'";
            try { Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                result = true;
                emailUsuario = rs.getString("emailUsuario");
                tipoAcesso = rs.getString("tipoAcesso");
            }
            } catch (SQLException e) {
                System.err.println("Erro de conexão na base de dados" + e);
            }
          return result;
           }
    
    public boolean verificarEmail(String emailUsuario)  {
        String sql = "";
        Connection con = Conexao.conectar();
        //INSTRUÇÃO SQL
        sql += "select login, tipoAcesso from usuario ";
        sql += "where emailUsuario = " + "'" + emailUsuario + "'";
            try { Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                result = true;
                login = rs.getString("login");
                tipoAcesso = rs.getString("tipoAcesso");
            }
            } catch (SQLException e) {
                System.err.println("Erro de conexão na base de dados" + e);
            }
          return result;
           }
    
    public boolean mandaEmail(String emailUsuario) {
    Properties props = new Properties();
    /** Parâmetros de conexão com servidor Gmail */
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.socketFactory.port", "465");
    props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.port", "465");

    Session session = Session.getDefaultInstance(props,
            // Entra na Conta
      new javax.mail.Authenticator() {
           @Override
           protected PasswordAuthentication getPasswordAuthentication(){
                 return new PasswordAuthentication("Sistemabom.asilo@gmail.com",
                 "bomasilo123");
           }
      });
    /** Ativa Debug para sessão */
    session.setDebug(true);
    try {
      Message message = new MimeMessage(session);
      message.setFrom(new InternetAddress("Sistemabom.asilo@gmail.com"));
      //Remetente

      Address[] toUser = InternetAddress //Destinatário(s)
                 .parse(emailUsuario);
      message.setRecipients(Message.RecipientType.TO, toUser);
      message.setSubject("Recuperção de Senha - BOM ASILO");//Assunto
      message.setText("  Olá! \n\n Recebemos uma solicitação de RECUPERAÇÃO DE SENHA na sua conta do Bom Asilo. \n Caso não tenha sido você que enviou a solicitação apenas ignore este e-mail. \n\n Clique no link abaixo para ser redirecionado(a) para a Recuperação de sua Senha. \n http://localhost:8080/BomAsilo/familiaralterarusuario.jsp \n\n  Atensiosamente, \n    Equipe Bom Asilo.");
      /**Método para enviar a mensagem criada*/
      Transport.send(message);
      result = true;
      System.out.println("Feito!!!");

     } catch (MessagingException e) {
        throw new RuntimeException(e);
    }
    return result;
  }
}

