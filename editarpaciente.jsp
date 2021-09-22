<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Endereco"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Paciente"%>
<%@page import="modelos.Quarto"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        <script src="scripts/formatacampos.js"></script>
    </head>
        <section>
            <article>
                <body>
                    <h1>Editar Paciente</h1>
                    <hr />    
                    <%
                      Integer idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
                      Paciente p = new Paciente();
                      if (idPaciente != null){
                          p = p.consultarPacienteId(idPaciente);
                      }    
                    %>   
                    
                     <%
          
                    Endereco endereco = new Endereco();
                    List<Endereco> end = endereco.consultarGeral();
                     
                    Quarto quarto = new Quarto();
                    List<Quarto> qua = quarto.consultarGeral();

                    %>  
                    <form action="recebeeditapaciente.jsp" method="POST">
                        <input type="hidden" name="idPaciente" value="<%out.write("" + p.getIdPaciente());%>" />
                        
                        <label>CPF</label>
                        <input type="text" name="cpfPaciente" value="<%out.write(""+p.getCpfPaciente());%>" /> <br />
                                                
                        <label>Rg</label>
                        <input type="text" name="rg"  value="<%out.write(""+p.getRg());%>" /> <br />
                        
                        <label>Nome</label>
                        <input type="text" name="nome" required="required" value="<%out.write(""+p.getNome());%>" /> <br />
                        <label id="validanome" class="validacampos"></label>
                        
                        <label>Data de Nascimento</label>
                        <input type="date" name="dataNascimento" required="required" value="<%out.write(""+p.getDataNascimento());%>" /> <br />
                        <label id="validadata" class="validacampos"></label>
                        
                        <label>Selecione o Quarto</label>
                          <select name="idQuarto">
                              <option value="<%out.write(""+p.getIdQuarto());%>">
                            <% out.write(p.getQuartoPaciente().getDescrQuarto()); %>
                            </option>
                                <% for(Quarto q: qua){ %>
                                    <option value="<%out.write(""+q.getIdQuarto());%>">
                                    <% out.write(q.getDescrQuarto()); %>
                                    </option>
                                <%}%> 
                            </select> <br /> 

                        <label>Nome Contato</label>
                        <input type="text" name="nomeContato" required="required" value="<%out.write(""+p.getNomeContato());%>" /> <br />
                        <label id="validanomecontato" class="validacampos"></label>   
                                                        
                        <label>Telefone Contato</label>
                        <input type="text" name="foneContato" required="required" value="<%out.write(""+p.getFoneContato());%>" 
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);" /> <br />
                        <label id="validafonecontato" class="validacampos"></label> 
                 
                        <label>Selecione o Endereco </label> 
                            <select name="enderecoPaciente">
                                <option value="<%out.write(""+p.getEnderecoPaciente());%>">
                            <% out.write(p.getEnderecoCompletoPaciente().getCep()+ " - " 
                                    + p.getEnderecoCompletoPaciente().getRua()+ " - " 
                                    + p.getEnderecoCompletoPaciente().getNr()); %>
                                <% for(Endereco e: end){ %>
                                    <option value="<%out.write(""+e.getIdEndereco());%>">
                                    <% out.write(e.getCep()+ " - " + e.getRua()+ " - " + e.getNr()); %>
                                    </option>
                                <%}%> 
                            </select> <br /> 
                       
                        <input type="submit" value="Alterar" onclick="location.href = 'consultapaciente.jsp';"/>
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultapaciente.jsp';" />
                    </form>
                </body>
            </article>
        </section>
                        
     <script>
            if (document.getElementByName("nome").value === ""){                    
                document.getElementByName("validanome").innerHTML = "Informe o NOME";
                nome[0].focus();
                exit(0);
            }            

            if ((document.getElementByName("datanasc").value === "")) {                    
                document.getElementByName("validadata").innerHTML = "Informe ao DATA";
                datanasc[0].focus();
                exit(0);
            }            

            if (document.getElementByName("idquarto").value === ""){                    
                document.getElementByName("validaquarto").innerHTML = "Informe o QUARTO";
                quarto[0].focus();
                exit(0);
            }   
            function mask(o, f) {
       setTimeout(function() {
        var v = mphone(o.value);
        if (v != o.value) {
          o.value = v;
            }
        }, 1);
    }

    function mphone(v) {
        var r = v.replace(/\D/g, "");
            r = r.replace(/^0/, "");
        if (r.length > 10) {
            r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");
        } else if (r.length > 5) {
            r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");
        } else if (r.length > 2) {
             r = r.replace(/^(\d\d)(\d{0,5})/, "($1) $2");
        } else {
            r = r.replace(/^(\d*)/, "($1");
        } return r;
    }
        </script>                         
</html>
