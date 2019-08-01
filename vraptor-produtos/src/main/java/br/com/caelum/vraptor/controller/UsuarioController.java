package br.com.caelum.vraptor.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.UsuarioDao;
import br.com.caelum.vraptor.model.Usuario;
import br.com.caelum.vraptor.validator.Validator;

@Controller
public class UsuarioController {
	
	private final Result result;
	private final UsuarioDao dao;
	private final idSelecionado idSelecionado;
	private final Validator validator;



	// Anotacao do CDI "injecao de dependencia"
	@Inject
	public UsuarioController(Result result, UsuarioDao dao, idSelecionado idSelecionado, Validator validator) {
		this.result = result;
		this.dao = dao;
		this.idSelecionado = idSelecionado;
		this.validator = validator;
	}

	// construtor default
	@Deprecated
	public UsuarioController() {
		this(null, null, null, null);
	}
	
	public void listaUsuario() {
		result.include("usuarioList", dao.lista());
	}
	
	public void formularioCadastroUsuario() {
		
	}

	public void formularioAtualizaUsuario(Usuario usuario) {
		result.include("usuarioList", dao.buscaUsuarioPorID(usuario));
	}
	
	
	public void adiciona(@Valid Usuario usuario) {
		if(dao.buscaUsuarioPorNome(usuario)) {
			validator.onErrorForwardTo(this).formularioCadastroUsuario();
			dao.adiciona(usuario);
			result.include("mensagem", "Usuario adicionado com sucesso!");
			result.redirectTo(this).listaUsuario();
		}else {
			result.include("mensagem", "Usuario já cadastrado no sistema, clique em 'Voltar' e verifique a Listagem!");
			result.redirectTo(this).formularioCadastroUsuario();
		}
	}
	
	@Post
	public void atualiza(@Valid Usuario usuario) {
		
		validator.onErrorForwardTo(this).formularioAtualizaUsuario(usuario);
		dao.atualiza(usuario);
		result.include("mensagem", "Usuario atualizado com sucesso!");
		result.redirectTo(this).listaUsuario();
		
	}
	
	@Get
	public void remove(Usuario usuario) {
		dao.remove(usuario);
		result.include("mensagem", "Usuario removido com sucesso!");
		result.redirectTo(this).listaUsuario();
	}
	
}

