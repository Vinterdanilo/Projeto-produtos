<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/header.jsp"></c:import>
<div class="container">
		<h1>Listagem de Usuarios</h1>
		<br>
		<h5>
			<a href="<c:url value='/usuario/formularioCadastroUsuario'/>">Cadastrar
				mais usuarios!</a>
		</h5>
		<br>		
		<table id = "tabelaUsuario" class="table table-striped table-bordered table-hover table-sm table-condensed border-dark" >
			<thead class = "thead-dark">
				<tr>
					<th>ID</th>
					<th>Nome "Login"</th>
					<th>Senha</th>
					<th></th>
				</tr>
			<thead>
			<tbody>
				<c:forEach items="${usuarioList}" var="usuario">
					<tr>
						<td><strong>${usuario.id}</strong></td>
						<td>${usuario.nome}</td>
						<td>${usuario.senha}</td>
						<!-- utiliza-se o '?' para passar o paramentro produto.id para o metodo remove da classe ProdutoController -->
						<td>
						<c:if test = "${usuario.id != 1}">
						<a class="btn btn-info"
						href="<c:url value='/usuario/formularioAtualizaUsuario?usuario.id=${usuario.id}'/>"><span class="glyphicon glyphicon-refresh"></a>        
						<a class="btn btn-danger" 
						href="<c:url value='/usuario/remove?usuario.id=${usuario.id}'/>"><span class="glyphicon glyphicon-trash"></a>
						</c:if>
						</td> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
  <script>
  $(document).ready(function(){
      $('#tabelaUsuario').DataTable({
          "language": {
                "lengthMenu": "Mostrar _MENU_ registros por página",
                "zeroRecords": "Não há registros de produtos!",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro disponível!",
                "infoFiltered": "(filtrado de _MAX_ registros no total)"
            }
        });
  });
  </script>
  		<br>
			<c:if test="${(not empty mensagem) && (mensagem eq 'Usuario adicionado com sucesso!')}">
    			<div class="alert bg-success text-white"><strong>${mensagem}</strong></div>
   			</c:if>
   			
   			<c:if test = "${(not empty mensagem) && (mensagem eq 'Usuario atualizado com sucesso!')}">
    	 		<div class="alert bg-info text-white"><strong>${mensagem}</strong></div>
			</c:if>
			
			<c:if test="${(not empty mensagem) && (mensagem eq 'Usuario removido com sucesso!')}">
    			<div class="alert bg-success text-white"><strong>${mensagem}</strong></div>
   			</c:if>
			
	</div>
<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>