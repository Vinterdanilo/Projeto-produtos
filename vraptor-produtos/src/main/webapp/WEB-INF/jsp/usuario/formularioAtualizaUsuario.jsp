<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<div class="container">
    <div class="  col-md-6 offset-md-3">
	<h2>Atualizar Usuario</h2>
	<br>
	<form action=<c:url value='/usuario/atualiza'/> method="post">
		<c:forEach items="${usuarioList}" var="usuario">	
		<!-- "usuario.nome" = atribuicao do parametro do objeto produto! -->
		ID:
		<input class="form-control" type = "text" name= "usuario.id" value ="${usuario.id}" readonly="readonly"/>
		Nome: 
		<input class="form-control" type = "text" name= "usuario.nome" value ="${usuario.nome}"/>
		Senha: 
		<input class="form-control" type = "text" name ="usuario.senha" value ="${usuario.senha}"/>
		</c:forEach>
		<br>
		<input type="submit" value = "Atualizar" class="btn btn-info" />	
	</form>
	
	<br>
	
	<h5><a href="<c:url value='/usuario/listaUsuario'/>">Voltar.</a></h5>
	
	<br>
	
	<c:forEach var="error" items="${errors}">
	<div class= "alert bg-danger text-white">
 	<!-- ${error.category} --> ${error.message}<br />
    </div> 
	</c:forEach>
	
	</div>
</div>
	
<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>