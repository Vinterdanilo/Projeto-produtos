package br.com.caelum.vraptor.interceptor;

import javax.inject.Inject;

import br.com.caelum.vraptor.Accepts;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.annotations.Public;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.controller.LoginController;
import br.com.caelum.vraptor.controller.UsuarioLogado;

//essa anotacao, faz com que a classe consiga executar aluma logica "antes durante e depois" do codigo dos CONTROLLER 
@Intercepts
public class AutorizadorInterceptor {

	@Inject private UsuarioLogado usuarioLogado;
	@Inject private Result result;
	@Inject ControllerMethod controllerMethod;

	@Accepts
	public boolean accepts() {
		return !controllerMethod.containsAnnotation(Public.class);
	}

	@AroundCall
	public void intercepta(SimpleInterceptorStack stack) {

		if (usuarioLogado.getId() == 0) {
			result.redirectTo(LoginController.class).formularioLogin();
			return;
		}

		stack.next();
	}
}
