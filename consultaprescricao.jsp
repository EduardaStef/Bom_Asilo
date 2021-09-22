<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.util.List"%>
<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Medicamento"%>
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
        
        <h1>Consulta Prescricao</h1>
        <hr />
        <%
            if(request.getParameter("pmensagem") != null)         
                out.write(request.getParameter("pmensagem"));
        %>
        
        <%
          Prescricao pre = new Prescricao();
          List<Prescricao> prescricao = pre.consultarGeral();
        %>
         <table class="table table-striped">
            <thead>
              <th scope="col">Clinico</th>
              <th scope="col">Medicamento</th>
              <th scope="col">Data Consulta</th>
              <th scope="col">Hora Consulta</th>
              <th scope="col">Descrição Orientação</th>
              <th scope="col">Descrição Posologia</th>
              <th scope="col">Paciente</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Prescricao p : prescricao) { %>
                   <tr>
                        <td><% out.write(""+p.getClinicoPrescricao().getNomeClinico() + " - " 
                                + p.getClinicoPrescricao().getEspecialidadeClinico().getDescEspecialidade());%></td>
                        <td><% out.write(""+p.getMedicamentoPrescricao().getNomeMedicamento());   %></td>
                        <td><% out.write(""+p.getDataConsulta());   %></td>
                        <td><% out.write(""+p.getHoraConsulta());  %></td>
                        <td><% out.write(""+p.getDescOrientacao());  %></td>
                        <td><% out.write(""+p.getDescPosologia());  %></td>
                        <td><% out.write(p.getCpfPaciente() + " - " + p.getPacientePrescricao().getNome());%></td>
                        <td><%out.write("<a href=editarprescricao.jsp?idPrescricao="+p.getIdPrescricao()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirprescricao.jsp?idPrescricao="+p.getIdPrescricao()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
    </table>
    </body>
</html>