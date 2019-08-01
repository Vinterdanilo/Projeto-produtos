package br.com.caelum.vraptor.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.caelum.vraptor.model.Produto;

@RequestScoped
public class ProdutoDao {

	private final EntityManager em;

	// injecao de dependencia
	@Inject
	public ProdutoDao(EntityManager em) {
		this.em = em;
	}

	public ProdutoDao() {
		this(null); // utiliza null neste construtor para o uso do CDI
	}

	public void adiciona(Produto produto) {
		em.getTransaction().begin();
		em.persist(produto);
		em.getTransaction().commit();
	}

	public void remove(Produto produto) {
		em.getTransaction().begin();
		em.remove(busca(produto));
		em.getTransaction().commit();
	}

	public Produto busca(Produto produto) {
		return em.find(Produto.class, produto.getId());
	}
	
	public List<Produto> buscaProdutoPorID(Produto produto) {
		String jpql = "select u from Produto u where u.id = :pID";
		TypedQuery<Produto> query = em.createQuery(jpql, Produto.class);
		query.setParameter("pID", produto.getId());
		return query.getResultList();
	}
	
	

	public void atualiza(Produto produto) {
		em.getTransaction().begin();
		Produto atualizarProduto = busca(produto);
		atualizarProduto.setNome(produto.getNome());
		atualizarProduto.setValor(produto.getValor());
		atualizarProduto.setQuantidade(produto.getQuantidade());
		em.getTransaction().commit();

	}

	@SuppressWarnings("unchecked")
	public List<Produto> lista() {
		return em.createQuery("select p from Produto p").getResultList();
	}
	
	public boolean buscaUsuarioPorNome(Produto produto) {
		String jpql = "select u from Produto u where u.nome = :pNome";
		TypedQuery<Produto> query = em.createQuery(jpql, Produto.class);
		query.setParameter("pNome", produto.getNome());
		return query.getResultList().isEmpty();
	}
}