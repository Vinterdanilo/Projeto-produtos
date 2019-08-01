<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/header.jsp"/>
	<div class="container">
		<h1>Listagem de Produtos</h1>
		<br>
		<h5>
			<a href="<c:url value='/produto/formularioCadastroProduto'/>">Cadastrar
				mais produtos!</a>
		</h5>
		<br>
		
		<link href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet">
		
		<table id = "tabelaProduto" class="table table-striped table-bordered table-hover table-sm table-condensed border-dark" >
			<thead class = "thead-dark">
				<tr>
					<th>ID</th>
					<th>Nome do Produto</th>
					<th>Valor Unitário</th>
					<th>Quantidade</th>
					<th>Unidade de Medida</th>
					<th></th>
				</tr>
			<thead>
			<tbody>
				<c:forEach items="${produtoList}" var="produto">	
					<tr>
						<td><strong>${produto.id}</strong></td>
						<td>${produto.nome}</td>
						<td>${produto.valor}</td>
						<td>${produto.quantidade}</td>
						<td>${produto.unidade_medida}</td>
						<!-- utiliza-se o '?' para passar o paramentro produto.id para o metodo remove da classe ProdutoController -->
						<td>
						<a class="btn btn-info"
							href="<c:url value='/produto/formularioAtualizaProduto?produto.id=${produto.id}'/>"><span class="glyphicon glyphicon-refresh"></a>
						<a class="btn btn-danger" 
							href="<c:url value='/produto/remove?produto.id=${produto.id}'/>"><span class="glyphicon glyphicon-trash"></span></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
  
  <script>
  $(document).ready(function(){
      $('#tabelaProduto').DataTable({
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
    		<c:if test="${(not empty mensagem) && ((mensagem eq 'Produto adicionado com sucesso!') || (mensagem eq 'Produto removido com sucesso!'))}">
    			<div class="alert bg-success text-white"><strong>${mensagem}</strong></div>
   			</c:if>
   			
   			<c:if test = "${(not empty mensagem) && (mensagem eq 'Produto atualizado com sucesso!')}">
    	 		<div class="alert bg-info text-white"><strong>${mensagem}</strong></div>
			</c:if>
   			
   			<c:if test = "${(not empty mensagem) && (mensagem eq 'Usuário sem permissão, entre em contato com o administrador!')}">
    	 		<div class="alert bg-warning text-dark"><strong>${mensagem}</strong></div>
			</c:if>
	</div>
<c:import url="/WEB-INF/jsp/footer.jsp"/>