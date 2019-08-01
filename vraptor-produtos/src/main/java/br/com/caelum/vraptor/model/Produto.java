package br.com.caelum.vraptor.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Produto {

	@Id
	@GeneratedValue
	private int id;

	@NotEmpty(message = "{nome.empty}")
	private String nome;
	
	@Min(value = 0, message = "{quantidade.negativa}")
	private Integer quantidade;
	
	@Min(value = 0, message = "{valor.negativo}")
	private Double valor;

	@NotEmpty(message = "{unidade_medida.empty}")
	private String unidade_medida;
	
	public Produto() {
	}

	public Produto(String nome, Double valor, Integer quantidade, String unidade_medida) {
		this.nome = nome;
		this.valor = valor;
		this.quantidade = quantidade;
		this.unidade_medida = unidade_medida;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public String getUnidade_medida() {
		return unidade_medida;
	}
	
	public void setUnidade_medida(String unidade_medida) {
		this.unidade_medida = unidade_medida;
	}
}