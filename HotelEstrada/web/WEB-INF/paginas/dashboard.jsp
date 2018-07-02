<%-- 
    Document   : dashboard
    Created on : 16/06/2018, 00:46:34
    Author     : Marciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="img/icon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="styleSheet" type="text/css" href="css/style.css" media="screen" >
        <title>Hotel Estrada Feliz - Dashboard</title>
    </head>
    <body>
        <div class="navbar" ><img src="img/estrada.png"></div>        
        
        <h3><center><font color="gray">Logado como funcionário ${funcionarioLogado.nome}, para deslogar <a href="Controller?tarefa=Login&metodo=logout">clique aqui</a>.</font></center></h3>
        
        <%//${funcionarioLogado.nivelAcesso}%>
        
        <div class="nav2">
        <center>
                <div class="navopcao">
                    
                    <c:if test="${funcionarioLogado.nivelAcesso == 2}">
                       <a href="#linkcons">Cadastrar consumo</a>
                    </c:if>
                       
                    <c:if test="${funcionarioLogado.nivelAcesso == 1}">
                       <a href="#linkfunc">Cadastrar Funcionário</a>
                    </c:if>

                </div>
        </center>
        </div>
        
        <div class="cadHospForm">
        <h2>Cadastrar hospedes</h2><br><br>
        <form action="Controller">
            <label for="input1" class="hora">Nome:</label> <input type="text" name="nome" id="input1"><br/><br/>
            <label for="input2" class="hora">CPF:</label> <input type="text" name="cpf" id="input2"><br/><br/>
            <label for="input3" class="hora">Endereço:</label> <input type="text" name="endereco" id="input3"><br/><br/>
            <label for="input4" class="hora">Data de Nascimento:</label> <input type="date" name="dataNascimento" id="input4"><br/><br/>
            <label for="input5" class="hora">Observações:</label> <input type="text" name="observacao" id="input5"><br/><br/>
            <input type="hidden" name="tipo" value="hospede">
            <input type="hidden" name="tarefa" value="NovaPessoa">
            <br/>
            <button type="submit"class="botao">Enviar</button>
        </form>
        
        </div>
        
        <div class="cadRes">
            
            <h2>Fazer reserva</h2><br/><br/>
        <form action="Controller">
            <label for="input6" class="hora2">Hóspede cadastrado: </label>
            <select name="hospede">
                <c:forEach var="hospede" items="${hospede}">
                    <option id="input6" value="${hospede.id}">${hospede.nome}</option>                    
                </c:forEach>
            </select><br/><br/>
            <label for="input7" class="hora2">Vaga do estacionamento (opcional):</label>
            <select name="estacionamento">
                <c:forEach var="est" items="${estacionamento}">
                    <c:if test="${est.disponibilidade == true}">
                        <option  id="input7" value="${est.idVaga}">${est.idVaga}</option> 
                    </c:if>
                </c:forEach>
            </select><br/><br/>
            <label for="input8" class="hora2">Apartamento:</label> 
            <select name="apartamento">
                <c:forEach var="apt" items="${apartamento}">
                    <c:if test="${apt.disponibilidade == true}">
                        <option id="input8" value="${apt.idApartamento}">${apt.predio.nomePredio} ${apt.andarQuarto}°Andar quarto ${apt.numeroQuarto}</option>                    
                    </c:if>
                </c:forEach>
            </select><br/><br/><br/><br/>
            <input type="hidden" name="recepcionista" value="${funcionarioLogado.id}">
            <input type="hidden" name="tarefa" value="NovaReserva">
            <button type="submit" class="botao">Enviar</button>
        </form>
            
        </div>
            
        <div class="consulta">
        <form action="Controller">
            <h3>Consulta de pessoas:</h3>
            <input type="hidden" name="tarefa" value="Lista">
            <button type="submit" class="botao2">Ver lista</button>
        </form></br></br>
                    
            <h3>Consulta de reservas:</h3>
            <a href="Controller?tarefa=NovaReserva&metodo=getReservas"><button class="botao2">Ver lista</button></a>
            
        </div>
        
            <br/><br/><br/>
            
             <div class="cadFunc">
        
                <c:if test="${funcionarioLogado.nivelAcesso == 1}">
                      
                   
                
         <a name="linkfunc"><h2>Cadastrar Funcionários</h2></a><br/>
        <form action="Controller">
            <label for="input9" class="hora2">Nome:</label> <input id="input9" type="text" name="nome"><br/><br/>
            <label for="input10" class="hora2">CPF:</label> <input id="input10" type="text" name="cpf"><br/><br/>
            <label for="input11" class="hora2">Endereço:</label> <input id="input11" type="text" name="endereco"><br/><br/>
            <label for="input12" class="hora2">Data de Nascimento:</label> <input id="input12" type="date" name="dataNascimento"><br/><br/>
            <label for="input13" class="hora2">Email:</label> <input id="input13" type="email" name="email"> <br/><br/>
            <label for="input14" class="hora2">Senha:</label> <input id="input14" type="password" name="senha"> <br/><br/>
            <label for="input15" class="hora2">Tipo:</label><select id="input15" name="tipo">
                <option value="gerente">Gerente</option>
                <option value="recepcionista">Recepcionista</option>
            </select><br/><br/>
            <input type="hidden" name="tarefa" value="NovaPessoa">
            <button type="submit" class="botao">Enviar</button> 
        </form>
         
        
         
         </c:if>
         
            <c:if test="${funcionarioLogado.nivelAcesso == 2}">
               <a name="linkcons"><h2>Cadastro de consumo</h2></a>
            </c:if>
             </div> 
        <div class="footer"> </div>
        
    </body>
</html>
