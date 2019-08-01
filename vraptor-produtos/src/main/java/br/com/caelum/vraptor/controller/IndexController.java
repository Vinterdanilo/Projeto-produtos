package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.annotations.Public;

@Controller
public class IndexController {

	private final UsuarioLogado usuarioLogado;
	private Result result;

	@Inject
	public IndexController(UsuarioLogado usuarioLogado, Result result) {
		
		this.usuarioLogado = usuarioLogado;
		this.result = result;
	}

	@Deprecated
	public IndexController() {
		this(null, null);
	}
	
	@Get 
	public void zeraIdDoUsuarioLogado() {
		usuarioLogado.setId(0);
		result.redirectTo(this).index();
	}
	
	@Public
	@Get ("/")  
	public void index() {
	}
}
