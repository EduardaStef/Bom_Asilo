<%@page import="java.util.List"%>
<%@page import="modelos.Endereco"%>
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
        
        <h1>Consulta Endereco</h1>
        <hr />
        <label>
            <%
            if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }
            %>
        </label>
        
            <%
          Endereco end = new Endereco();
          List<Endereco> endereco = end.consultarGeral();
             %>
        <table class="table table-striped">
            <thead>
              <th scope="col">CEP</th>
              <th scope="col">Rua</th>
              <th scope="col">Nr</th>
              <th scope="col">Complemento</th>
              <th scope="col">Bairro</th>
              <th scope="col">Cidade </th>
              <th scope="col">Uf</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Endereco e : endereco) { %>
                   <tr>
                        <td><% out.write(e.getCep());  %></td>
                        <td><% out.write(e.getRua());   %></td>
                        <td><% out.write(e.getNr()); %></td>
                        <td><% out.write(""+e.getComplemento()); %></td>
                        <td><% out.write(""+e.getBairro()); %></td>
                        <td><% out.write(""+e.getCidade()); %></td>
                        <td><% out.write(""+e.getUf()); %></td>
                        <td><%out.write("<a href=editarendereco.jsp?cep="+ e.getCep()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirendereco.jsp?cep="+e.getCep()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
