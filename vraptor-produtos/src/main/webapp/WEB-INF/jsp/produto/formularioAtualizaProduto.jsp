<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<div class="container">
    <div class="  col-md-6 offset-md-3">
	<h1>Atualizar Produto</h1>
	<form action= <c:url value='/produto/atualiza'/> method="post">
	<c:forEach items="${produtoList}" var="produto">
		ID:
		<input class="form-control" type = "text" name= "produto.id" value ="${produto.id}" readonly="readonly"/>
		Nome: ${produto.nome}
		<input class="form-control" type = "text" name= "produto.nome" value ="${produto.nome}"/>
		Valor: 
		<input class="form-control" type = "text" name ="produto.valor" value ="${produto.valor}"/>
		Quantidade: 
		<input class="form-control" type = "text" name="produto.quantidade" value ="${produto.quantidade}"/>
		Unidade de Medida:
		<select class="form-control" name="produto.unidade_medida">
			<option>${produto.unidade_medida}</option>
		    <option>UND</option>
		    <option>KG</option>
		    <option>PC</option>
		    <option>L</option>
		</select>
		</c:forEach>
		<br>		
		<input type="submit" value = "Atualizar" class="btn btn-info" />	
		</form>
	<br>
	<h5><a href="<c:url value='/produto/listaProduto'/>">Voltar.</a></h5>

	<br>

	<c:forEach var="error" items="${errors}">
	<div class= "alert bg-danger text-white">
 	<!-- ${error.category} --> ${error.message}<br />
    </div> 
	</c:forEach>
	
	</div> 
	</div>
	
<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>