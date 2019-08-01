package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.annotations.Public;
import br.com.caelum.vraptor.dao.UsuarioDao;
import br.com.caelum.vraptor.model.Usuario;

@Controller
public class LoginController {

	private final UsuarioDao dao;
	private final Result result;
	private final UsuarioLogado usuarioLogado;

	@Inject
	public LoginController(UsuarioDao dao, Result result, UsuarioLogado usuarioLogado) {
		this.dao = dao;
		this.result = result;
		this.usuarioLogado = usuarioLogado;
	}

	public LoginController() {
		this(null, null, null);
	}

	@Get
	@Public
	public void formularioLogin() {
		
	}
	
	@Get
	@Public
	public void formularioRecuperaSenha() {
		
	}
	
	@Post 
	@Public
	public void recuperaSenha(Usuario usuario, String confirmaSenha) {
		if(usuario.getSenha() == confirmaSenha) {
		dao.atualiza(usuario);
		}
	}
	
	@Post
	@Public
	public void autentica(Usuario usuario) {
		if (dao.existe(usuario)) {
			result.include("mensagem", "Login ou Senha incorretos!");
			result.redirectTo(this).formularioLogin();
		} else {
			usuarioLogado.setUsuario(usuario);
			result.redirectTo(IndexController.class).index();
			Usuario usuarioArmazenado = dao.buscaLogin(usuario);
			if (usuarioArmazenado != null) {
				usuarioLogado.setId(usuarioArmazenado.getId());
			}
		}  
	}
}
