<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<!DOCTYPE html>
    <head>
        <script src="https://fontawesome.com/v6.0/icons?d=gallery&p=1&q=home&s=solid" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="styles/menustyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//code-sa1.jivosite.com/widget/7BEqBwjT8Y" async></script>
        <title>Bom Asilo</title>
    </head>
  <style>
.main iframe {
        border: none;
        width:  100%;
        height: 615px;
}
    </style>
   
    <body>
        <%
            //out.println(session.getAttribute("tipoAcesso"));
        %>
         <div class="topnav" id="myTopnav">
            <a href="menu.jsp" class="active"> Home <i class='fa-solid fa-house' style='font-size:8px;color:white'></i></a>
          
            <div class="dropdown">
                <button class="dropbtn">Usuário <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastrarusuario.jsp" target="janela_prog">Cadastrar Usuário</a>
                </div>
            </div> 
             <div class="dropdown">
                <button class="dropbtn"> Funcionário <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastraendereco.jsp" target="janela_prog">Cadastrar Endereço</a>
                    <a href="cadastrarfuncionario.jsp" target="janela_prog">Cadastrar Funcionário</a>
                    <a href="cadastracargo.jsp" target="janela_prog">Cadastrar Cargo</a>                     
                </div>
            </div>  
            <div class="dropdown">
                <button class="dropbtn"> Paciente <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastraendereco.jsp" target="janela_prog">Cadastrar Endereço</a>
                    <a href="cadastrapaciente.jsp" target="janela_prog">Cadastrar Paciente</a>
                    <a href="cadastrafamiliar.jsp" target="janela_prog">Cadastrar Familiar</a>                     
                    <a href="cadastraprontuario.jsp" target="janela_prog">Cadastrar Prontuário</a>
                    <a href="cadastrarotina.jsp" target="janela_prog">Cadastrar Rotina</a>
                </div>
            </div>  
            <div class="dropdown">
                <button class="dropbtn"> Prescrição <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastraprescricao.jsp" target="janela_prog">Cadastrar Prescrição</a>
                    <a href="cadastramedicamento.jsp" target="janela_prog">Cadastrar Medicamentos</a>
                    <a href="cadastraclinico.jsp" target="janela_prog">Cadastrar Clínico</a>                     
                    <a href="cadastraespecialidade.jsp" target="janela_prog">Cadastrar Especialidade</a>
                </div>
            </div>
             <div class="dropdown">
                <button class="dropbtn"> Consultas <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="consultacargo.jsp" target="janela_prog">Cargo</a>
                    <a href="consultaclinico.jsp" target="janela_prog">Clínico</a>
                    <a href="consultaendereco.jsp" target="janela_prog">Endereço</a>                     
                    <a href="consultaespecialidade.jsp" target="janela_prog">Especialidade</a>
                    <a href="consultafamiliar.jsp" target="janela_prog">Familiar</a>
                    <a href="consultafuncionario.jsp" target="janela_prog">Funcionário</a>
                    <a href="consultamedicamento.jsp" target="janela_prog">Medicamento</a>
                    <a href="consultapaciente.jsp" target="janela_prog">Paciente</a>                     
                    <a href="consultaprescricao.jsp" target="janela_prog">Prescrição</a>
                    <a href="consultaprontuario.jsp" target="janela_prog">Prontuário</a>
                    <a href="consultarotina.jsp" target="janela_prog">Rotina</a>
                    <a href="consultausuario.jsp" target="janela_prog">Usuário</a>
                </div> 
             </div>
        <div class="main">
            <iframe name="janela_prog" element.mozRequestFullScreen()></iframe>
        </div>
    </body>
</html>