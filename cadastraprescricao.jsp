<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Clinico"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Medicamento"%>
<%@page import="modelos.Paciente"%>
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
                   } else if((p1 !== "adm") && (p1 !== "profsaude")){
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
        <section>
            <article>
                <h1>Cadastro de Prescrição </h1>
                <hr /> 
                 <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                    %>
                    </label>
                    
                    <% 
                        Paciente pa = new Paciente();
                        List<Paciente> pac = pa.consultarGeral();
                        
                        Clinico clinico = new Clinico();
                        List<Clinico> clin = clinico.consultarGeral();
                        
                        Medicamento medicamento = new Medicamento();
                        List<Medicamento> med = medicamento.consultarGeral();
                    %>
                <form action="recebedadosprescricao.jsp" method="POST">
                    
                    <div>
                        <label>Paciente </label> 
                        <select name="cpfPaciente">
                            <option value="" hidden disabled selected> --Selecione o Paciente--</option>
                            <% for(Paciente p: pac){ %>
                            <option value="<%out.write(""+p.getCpfPaciente());%>">
                            <% out.write(p.getCpfPaciente() + " - " + p.getNome()); %></option><%}%>
                        </select> 
                        <a href="cadastrapaciente.jsp" target="_blank"> Cadastrar Paciente </a><br />
                   
                         <label>Clinico </label> 
                        <select name="idClinico">
                            <option value="" hidden disabled selected> --Selecione o Clinico--</option>
                            <% for(Clinico c: clin){ %>
                            <option value="<%out.write(""+c.getIdClinico());%>">
                            <% out.write(c.getNomeClinico()+ " - " + c.getEspecialidadeClinico().getDescEspecialidade()); %></option><%}%>
                        </select> 
                        <a href="cadastraclinico.jsp" target="_blank"> Cadastrar Clinico </a><br />
                        
                        <label>Medicamento </label> 
                        <select name="idMedicamento">
                            <option value="" hidden disabled selected> --Selecione o Medicamento--</option>
                            <% for(Medicamento m: med){ %>
                            <option value="<%out.write(""+m.getIdMedicamento());%>">
                            <% out.write(m.getNomeMedicamento()); %></option><%}%>
                        </select>
                        <a href="cadmedicamentos.jsp" target="_blank"> Cadastrar Medicamento </a><br />
                        
                        <label>Data Consulta</label>
                        <input id="dataConsulta" name="dataConsulta" type="date" required="required" min="1900-01-01" max="2999-12-31"/> <br />
                        
                        <label>Hora Consulta</label>
                        <blockquote><input id="horaConsulta" name="horaConsulta" type="time" required="required" /></blockquote>
                         
                        <label>Descrição Orientação</label>
                        <input id="descOrientacao" name="descOrientacao" type="text" /> <br />
                        
                        <label>Descrição Posologia</label>
                        <input id="descPosologia"  name="descPosologia" type="text"/> <br />
                          
                        
                         <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'menu.jsp';" />
                    </div>   
                </form>
            </article>
        </section>
<script>
    function enviarDados(){
            var dataConsulta = document.getElementsByName("dataConsulta");
            if(dataConsulta[0].value === ""){
                dataConsulta[0].focus();
                alert("Informe a data da consulta");
                exit();
            }
           
            var descPosologia = document.getElementsByName("descPosologia");
            if(descPosologia[0].value === ""){
                descPosologia[0].focus();
                alert("Informe a descrição da posologia");
                exit();
            }
            
            var cpfPaciente = document.getElementsByName("cpfPaciente");
            if(cpfPaciente[0].value === ""){
                cpfPaciente[0].focus();
                alert("Informe o Cpf do Paciente");
                exit();
            }
            
            var idClinico = document.getElementsByName("idClinico");
            if(idClinico[0].value === ""){
                idClinico[0].focus();
                alert("Informe o Clinico");
                exit();
            }
            
            var idMedicamento = document.getElementsByName("idMedicamento");
            if(idMedicamento[0].value === ""){
                idMedicamento[0].focus();
                alert("Informe o Medicamento");
                exit();
            }
            document.forms[0].submit();
    }        
</script>    
    </body>
</html>