package br.gov.serpro.dedat.rescar.acesso.application.command;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import br.gov.serpro.dedat.rescar.acesso.domain.usuario.Perfil;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.validation.beanvalidation.ValidEnum;

public class IncluirUsuarioCommand extends AbstractUsuarioCommand implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull
    @ValidEnum(enumClass = Perfil.class)
    private String perfil;
    
    private IncluirEnderecoCommand endereco;

    public String getPerfil() {
        return this.perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

	public IncluirEnderecoCommand getEndereco() {
		return endereco;
	}

	public void setEndereco(IncluirEnderecoCommand endereco) {
		this.endereco = endereco;
	}
    
}