<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../base.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet">



<title>Sistema de Produtos</title>

<link href="<c:url value='/css/bootstrap.css'/>" rel="stylesheet" />

</head>

<body class="bg-light">

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		
		<a class="navbar-brand text-warning" href="#">SGCP</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#conteudoNavbarSuportado"
			aria-controls="conteudoNavbarSuportado" aria-expanded="false"
			aria-label="Alterna navegação">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
				<a class="nav-link" href="${linkTo[IndexController].index()}">Home</a>
				</li>
				<c:if test= "${usuarioLogado.id ==1}">
				<li class="nav-item active">
				<a class="nav-link" href="${linkTo[UsuarioController].listaUsuario()}">Usuarios</a>
				</li>
				</c:if>
				<c:if test= "${usuarioLogado.id != 0}">
				<li class="nav-item active">
				<a class="nav-link" href="${linkTo[ProdutoController].listaProduto()}">Produtos</a>
				</li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li class="nav-item dropdown ">
			<a  class="nav-link dropdown-toggle bg-dark text-warning" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 		
				<span class="glyphicon glyphicon-user text-warning" style="font-size:18px;"></span></a>
					<div class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
						<c:if test= "${usuarioLogado.id == 0}">
						<a class="dropdown-item bg-dark text-warning" href="${linkTo[LoginController].formularioLogin()}">Entrar</a> 
						</c:if>
						<div class="dropdown-divider bg-light"></div>
						<c:if test= "${usuarioLogado.id != 0}">
						<a class="dropdown-item bg-dark text-warning" data-toggle="modal" href="#modalSair">Sair</a>
						</c:if>
					</div>
			</li>
			</ul>
		</div>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="modalSair" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content modal-danger">
				<div class="modal-header">
					<h4 class="modal-title">Sair</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p>Deseja sair da aplicacao?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<a class="btn btn-success"
						href="${linkTo[IndexController].zeraIdDoUsuarioLogado()}">Sair</a>
				</div>
			</div>
		</div>
	</div>
	<!-- FIM Modal content-->

	<div class="container">
		<div class= "col align-self-center">
			<main class="col-sm-8">