<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Endereco"%>
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
                   } else if(p1 !== "adm"){
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
                <body>
                    <h1>Editar Endereco</h1>
                    <hr />
                     <%
                      Integer idEndereco = Integer.parseInt(request.getParameter("idEndereco"));
                      Endereco e = new Endereco();
                      if (idEndereco != null){
                          e = e.consultarEndereco(idEndereco);
                      } 
                    %>
                    <form action="recebeeditaendereco.jsp" method="POST">
                        <label>CEP</label>
                        <input type="text" name="cep" 
                               value="<%out.write(e.getCep());%>" 
                               maxlength="14"/><br />
                        
                        <label>Rua</label>
                        <input type="text" name="rua" 
                               value="<%out.write(e.getRua());%>" 
                               maxlength="40"/><br />
                        
                        <label>Nr</label>
                        <input type="text" name="nr" 
                               value="<%out.write(""+e.getNr());%>" 
                               maxlength="10"/><br />
                        
                        <label>Complemento</label>
                        <input type="text" name="complemento" 
                               value="<%out.write(""+e.getComplemento());%>" 
                               maxlength="40"/><br />
                        
                        <label>Bairro</label>
                        <input type="text" name="bairro" 
                               value="<%out.write(""+e.getBairro());%>" 
                               maxlength="20"/><br />
                        
                         <label>Cidade</label>
                        <input type="text" name="cidade" 
                               value="<%out.write(""+e.getCidade());%>" 
                               maxlength="20"/><br />
                        
                         <label>Uf</label>
                        <input type="text" name="uf" 
                               value="<%out.write(""+e.getUf());%>" 
                               maxlength="14"/>
                        
                        <input type="hidden" name="idEndereco" 
                               value="<%out.write("" + e.getIdEndereco());%>" /><br /><hr />
                        
                        <input type="submit" value="Alterar" onclick="location.href = 'consultaendereco.jsp';" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultaendereco.jsp';" />
                    </form>
                </body>
            </article>
        </section>                
</html>
