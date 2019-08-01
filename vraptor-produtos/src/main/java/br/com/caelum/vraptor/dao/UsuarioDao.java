package br.com.caelum.vraptor.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.caelum.vraptor.controller.idSelecionado;
import br.com.caelum.vraptor.model.Produto;
import br.com.caelum.vraptor.model.Usuario;

@RequestScoped
public class UsuarioDao {

	private final EntityManager em;
	private idSelecionado idSelecionado;

	@Inject
	public UsuarioDao(EntityManager em, idSelecionado idSelecionado) {
		this.em = em;
		this.idSelecionado = idSelecionado;
	}

	@Deprecated
	public UsuarioDao() {
		this(null, null); // para uso do CDI
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> lista() {
		return em.createQuery("select u from Usuario u").getResultList();
	}

	public void adiciona(Usuario usuario) {
		em.getTransaction().begin();
		em.persist(usuario);
		em.getTransaction().commit();
	}

	public void remove(Usuario usuario) {
		em.getTransaction().begin();
		em.remove(busca(usuario));
		em.getTransaction().commit();
	}
	
	
	public void atualiza(Usuario usuario) {
		em.getTransaction().begin();
		Usuario atualizarUsuario = busca(usuario);
		if(usuario.getNome() != null) {
		atualizarUsuario.setNome(usuario.getNome());
		}
		if(usuario.getSenha() != null) {
		atualizarUsuario.setSenha(usuario.getSenha());
		}
		em.getTransaction().commit();

	}
	
	public boolean existe(Usuario usuario) {
		String jpql = "select u from Usuario u where u.nome = :pNome and u.senha = :pSenha";
		TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
		query.setParameter("pNome", usuario.getNome());
		query.setParameter("pSenha", usuario.getSenha());
		return query.getResultList().isEmpty();
	
	}

	public Usuario buscaLogin(Usuario usuario) {
		String jpql = "select u from Usuario u where u.nome = :pNome and u.senha = :pSenha";
		TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
		query.setParameter("pNome", usuario.getNome());
		query.setParameter("pSenha", usuario.getSenha());
		return query.getSingleResult();
	}
	
	public Usuario busca(Usuario usuario) {
		return em.find(Usuario.class, usuario.getId());
	}
	
	public List<Usuario> buscaUsuarioPorID(Usuario usuario) {
		String jpql = "select u from Usuario u where u.id = :pID";
		TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
		query.setParameter("pID", usuario.getId());
		return query.getResultList();
	}

	public boolean buscaUsuarioPorNome(Usuario usuario) {
		String jpql = "select u from Usuario u where u.nome = :pNome";
		TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
		query.setParameter("pNome", usuario.getNome());
		return query.getResultList().isEmpty();
	}
}

