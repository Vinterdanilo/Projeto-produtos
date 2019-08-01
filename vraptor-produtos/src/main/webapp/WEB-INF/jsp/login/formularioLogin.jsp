<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container">
<div class="  col-md-6 offset-md-3">
	<form action="<c:url value = 'autentica'/>" method="post">
		<h2 class="form-signin-heading">Login</h2>
		<br>
		<input type="text" class="form-control" name="usuario.nome" placeholder="Nome" /> 
		<input type="password" class="form-control"name="usuario.senha" placeholder="Senha" /> 
		<br>
		<button type="submit" class="btn btn-lg btn-dark btn-block">Autenticar</button>
	</form>
<br>
	<c:if test="${not empty mensagem}">
		<div class="alert bg-danger text-white">
			<strong>${mensagem}</strong>
		</div>
		<br>
		<a class = "text-dark" href="${linkTo[LoginController].formularioRecuperaSenha()}">Recuperar senha:</a>
	</c:if>
</div>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />