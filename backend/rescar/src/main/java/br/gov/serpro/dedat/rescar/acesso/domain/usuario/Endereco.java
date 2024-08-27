package br.gov.serpro.dedat.rescar.acesso.domain.usuario;

import java.io.Serializable;
import java.util.Objects;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

import br.gov.serpro.dedat.rescar.acesso.application.representation.EnderecoRepresentation;

@Entity
public class Endereco implements Serializable {

    private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(columnDefinition = "UUID")
    private UUID id;

    @Column(length = 8, nullable = false)
    private String cep;
    
    private String logradouro;
    
    private String numero;
    
    private String complemento;
    
    private String bairro;
    
    private String localidade;
    
    private String uf;
    
    @OneToOne(mappedBy = "endereco")
    private Usuario usuario;
    
    public Endereco() {
    	super();
	}
    
	public Endereco(String cep, String logradouro, String numero, String complemento, String bairro, String localidade,
			String uf, Usuario usuario) {
		super();
		this.cep = cep;
		this.logradouro = logradouro;
		this.numero = numero;
		this.complemento = complemento;
		this.bairro = bairro;
		this.localidade = localidade;
		this.uf = uf;
		this.usuario = usuario;
	}

	public Endereco(EnderecoRepresentation enderecoRepresentation) {
		super();
		this.id = enderecoRepresentation.getId();
		this.cep = enderecoRepresentation.getCep();
		this.logradouro = enderecoRepresentation.getLogradouro();
		this.numero = enderecoRepresentation.getNumero();
		this.complemento = enderecoRepresentation.getComplemento();
		this.bairro = enderecoRepresentation.getBairro();
		this.localidade = enderecoRepresentation.getLocalidade();
		this.uf = enderecoRepresentation.getUf();
	}

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getLocalidade() {
		return localidade;
	}

	public void setLocalidade(String localidade) {
		this.localidade = localidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Endereco other = (Endereco) obj;
		return Objects.equals(id, other.id);
	}
	
    public void alterarDadosEndereco(String cep, String logradouro, String numero, String complemento, String bairro, String localidade,
			String uf) {
		this.setCep(cep);
		this.setLogradouro(logradouro);
		this.setNumero(numero);
		this.setComplemento(complemento);
		this.setBairro(bairro);
		this.setLocalidade(localidade);
		this.setUf(uf);
    }
	
}
