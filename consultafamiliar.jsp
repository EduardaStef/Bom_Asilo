<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>
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
        <h1>Consulta Familiar</h1>
        <hr />
        <label><%
            if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }%>
        </label><br/>
        
        <%
          Familiar fam = new Familiar();
          List<Familiar> familiar = fam.consultarGeral();
        %>
          
        <table class="table table-striped">
            <thead>
              <th scope="col">Nome</th>
              <th scope="col">CPF</th>
              <th scope="col">Rg</th>
              <th scope="col">Fone Fixo</th>
              <th scope="col">Fone Celular</th>
              <th scope="col">Paciente</th>
              <th scope="col">Login Familiar</th>
              <th scope="col">Endereço</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Familiar f : familiar) { %>
                   <tr>
                        <td><% out.write(f.getNome());  %></td>
                        <td><% out.write(f.getCpfFamiliar());   %></td>
                        <td><% out.write(f.getRg()); %></td>
                        <td><% out.write(f.getFoneFixo()); %></td>
                        <td><% out.write(f.getFoneCelular()); %></td>
                        <td><% out.write(""+f.getPacienteFamiliar().getNome()); %></td>
                        <td><% out.write(f.getLoginFamiliar()); %></td>
                        <td><% out.write(""+ f.getEnderecoCompletoFamiliar().getCep() + " - "
                                           + f.getEnderecoCompletoFamiliar().getRua() + " - "
                                           + f.getEnderecoCompletoFamiliar().getNr() + " - "
                                           + f.getEnderecoCompletoFamiliar().getComplemento() + " - "
                                           + f.getEnderecoCompletoFamiliar().getBairro() + " - "
                                           + f.getEnderecoCompletoFamiliar().getCidade() + " - "
                                           + f.getEnderecoCompletoFamiliar().getUf()); %></td>
                        <td><%out.write("<a href=editarfamiliar.jsp?idFamiliar="+f.getIdFamiliar()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirfamiliar.jsp?idFamiliar="+f.getIdFamiliar()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
