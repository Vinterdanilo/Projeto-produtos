<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/header.jsp"></c:import>
<div class="container">
    <div class="  col-md-6 offset-md-3">
	<h2>Cadastrar Usuario</h2>
	<br>
	<form action=<c:url value='/usuario/adiciona'/> method="post">
	
		<!-- "usuario.nome" = atribuicao do parametro do objeto produto! -->
		
		Nome: 
		<input class="form-control" type = "text" name= "usuario.nome" value ="${usuario.nome}"/>
		Senha: 
		<input class="form-control" type = "text" name ="usuario.senha" value ="${usuario.senha}"/>
		<br>
		<input type="submit" value = "Adicionar" class="btn btn-success" />	
	</form>
	
	<br>
	<h5><a href="<c:url value='/usuario/listaUsuario'/>">Voltar.</a></h5>
	
	<br>
	
	<c:forEach var="error" items="${errors}">
	<div class= "alert bg-danger text-white">
 	<!-- ${error.category} --> ${error.message}<br />
    </div> 
	</c:forEach>
	
	<c:if test="${not empty mensagem}">
    	<div class="alert bg-warning text-dark"><strong>${mensagem}</strong></div>
	</c:if>
	
	</div>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>