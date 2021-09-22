<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.util.List"%>
<%@page import="modelos.Rotina"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        <script src="scripts/formatacampos.js"></script>
    </head>
    <header>
             <script>
                function validaAcesso(p1){
                   if(p1 === ""){
                     alert("Realize o acesso!");
                     window.location.href = "index.html";
                   } else if((p1 !== "adm") && (p1 !== "profsaude") && (p1 !== "familiar")){
                    alert("Você não possui acesso a esta página!"); 
                    window.location.href = "menu.jsp";
                   }
                }   
            </script> 
    </header>
   <body>
            <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null){
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);            
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");  
        %>
        
        <script src="scripts/menu.js"></script>  
        <h1>Consulta Rotina</h1>
        <hr />
        <%
          Rotina rot = new Rotina();
          List<Rotina> rotina = rot.consultarGeral();
          %>
        <table class="table table-striped">
            <thead>
              <th scope="col">CPF do Paciente</th>
              <th scope="col">Data do Evento</th>
              <th scope="col">hora de Inicio</th>
              <th scope="col">Hora Final</th>
              <th scope="col">Descricao do Evento</th>
              <th scope="col">Status</th>
              <th scope="col">Qtd Intervalo </th>
              <th scope="col">Prescricao </th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Rotina r : rotina) { %>
                   <tr>
                        <td><% out.write(r.getCpfPaciente());  %></td>
                        <td><% out.write(""+r.getDataEvento());   %></td>
                        <td><% out.write(r.getHoraInicio()); %></td>
                        <td><% out.write(""+r.getHoraFinal()); %></td>
                        <td><% out.write(""+r.getDescEvento()); %></td>
                        <td><% out.write(""+r.getStatus()); %></td>
                        <td><% out.write(""+r.getQtdIntervalo()); %></td>
                        <td><% out.write(""+r.getPrescricaoRotina().getDescOrientacao()
                                           + r.getPrescricaoRotina().getDescPosologia()+ " - "
                                           + r.getPrescricaoRotina().getHoraConsulta()); %></td>
                        <td><%out.write("<a href=editarotina.jsp?idEvento="+ r.getIdEvento()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirotina.jsp?idEvento="+r.getIdEvento()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
