<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Medicamento"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        <script src="scripts/formatacampos.js"></script>
    </head>
    <body>
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
                <h1>Cadastro de Medicamentos </h1>
                <hr /> 
                <label class="cabecalho" id="msg"> 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                <form action="recebedadosmedic.jsp" method="POST">
                    <div>
                        <label>Nome Medicamento</label>
                        <input id="nomeMedicamento" name="nomeMedicamento" type="text" required="required" placeholder="Informe o nome do Medicamento" maxlength="40"/> <br />
                        <br/>
                        
                        <label for="indControlado">Uso Contínuo?</label>
                        <input type="checkbox" id="indControlado" name="indControlado" />
                        <br />

                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'menu.jsp';" />

                    </div>   
                </form>
            </article>
        </section>
        <script>
                            function enviarDados() {
                                var nomeMedicamento = document.getElementsByName("nomeMedicamento");
                                if (nomeMedicamento[0].value === "") {
                                    nomeMedicamento[0].focus();
                                    alert("Informe o nome");
                                    exit();
                                }
                                document.forms[0].submit();
                            }

        </script>    
    </body>
</html>