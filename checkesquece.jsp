<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Email"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Login" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% Login log = new Login();
        String emailUsuario = request.getParameter("emailUsuario");
        boolean status = log.verificarEmail(emailUsuario);
        boolean manda = log.mandaEmail(emailUsuario);
       
        if(status == true){
            if(manda == true){
            out.println("Para atualizar sua senha verifique a caixa de entrada do seu e-mail!");
            }
            else{
                out.println("Problemas ao enviar E-mail! Verifique se seu e-mail está digitado corretamente ou");
                out.println("entre em contato com Sistemabom.asilo@gmail.com para mais informações");
            }
        }else{
            out.println("E-mail não cadastrado! Verifique se seu e-mail está digitado corretamente");
         }
        %>
    </body>
</html>