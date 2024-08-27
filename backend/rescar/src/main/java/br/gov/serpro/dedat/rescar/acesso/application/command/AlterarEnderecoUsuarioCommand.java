package br.gov.serpro.dedat.rescar.acesso.application.command;

import java.io.Serializable;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class AlterarEnderecoUsuarioCommand implements Serializable {

	private static final long serialVersionUID = 1L;
	
    @JsonIgnore
    private UUID id;

    public UUID getId() {
        return this.id;
    }

    public void setId(UUID id) {
        this.id = id;
    }
    
    private AlterarEnderecoCommand endereco;

	public AlterarEnderecoCommand getEndereco() {
		return endereco;
	}

	public void setEndereco(AlterarEnderecoCommand endereco) {
		this.endereco = endereco;
	}
    
}
