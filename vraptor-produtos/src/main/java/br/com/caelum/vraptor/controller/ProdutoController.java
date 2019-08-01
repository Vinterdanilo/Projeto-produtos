package br.com.caelum.vraptor.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.ProdutoDao;
import br.com.caelum.vraptor.model.Produto;
import br.com.caelum.vraptor.validator.Validator;

@Controller
public class ProdutoController {

	private final Result result;
	private final ProdutoDao dao;
	private final Validator validator;
	private final UsuarioLogado usuarioLogado;

	// Anotacao do CDI "injecao de dependencia"
	@Inject
	public ProdutoController(Result result, ProdutoDao dao, Validator validator,
			 UsuarioLogado usuarioLogado) {
		this.result = result;
		this.dao = dao;
		this.validator = validator;
		this.usuarioLogado = usuarioLogado;
	}

	// construtor default
	@Deprecated
	public ProdutoController() {
		this(null, null, null, null);
	}

	public void listaProduto() {
		result.include("produtoList", dao.lista());
	}
	
	public void formularioCadastroProduto() {

	}
	@Get
	public void formularioAtualizaProduto(Produto produto) {
		result.include("produtoList", dao.buscaProdutoPorID(produto));
	}

	// @Valid = validacao do objeto produto antes do mesmo ser adicionado
	@Post
	public void adiciona(@Valid Produto produto) {
		if(dao.buscaUsuarioPorNome(produto)) {
		validator.onErrorForwardTo(this).formularioCadastroProduto();
		dao.adiciona(produto);
		result.include("mensagem", "Produto adicionado com sucesso!");
		result.redirectTo(this).listaProduto();
		}else {
			result.include("mensagem", "Produto já cadastrado no sistema, clique em 'Voltar' e verifique a Listagem!");
			result.redirectTo(this).formularioCadastroProduto();
		}
	}

	@Post
	public void atualiza(@Valid Produto produto) {
		validator.onErrorForwardTo(this).formularioAtualizaProduto(produto);
		dao.atualiza(produto);
		result.include("mensagem", "Produto atualizado com sucesso!");
		result.redirectTo(this).listaProduto();
	
	}

	@Get
	public void remove(Produto produto) {
		if(usuarioLogado.getId() != 1) {
			result.include("mensagem", "Usuário sem permissão, entre em contato com o administrador!");
			result.redirectTo(this).listaProduto();
		}else {
		dao.remove(produto);
		result.include("mensagem", "Produto removido com sucesso!");
		result.redirectTo(this).listaProduto();
		}
	}
}
