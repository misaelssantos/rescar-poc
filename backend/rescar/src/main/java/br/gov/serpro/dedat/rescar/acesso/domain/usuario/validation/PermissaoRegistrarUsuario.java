package br.gov.serpro.dedat.rescar.acesso.domain.usuario.validation;

import br.gov.serpro.dedat.rescar.acesso.domain.ValidationRule;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.Perfil;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.exception.RescarBusinessException;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.internacionalization.Mensagens;

public class PermissaoRegistrarUsuario implements ValidationRule<Perfil> {

    @Override
    public void validate(Perfil perfil) {
        if (perfil.equals(Perfil.ADMINISTRADOR)) {
            throw new RescarBusinessException(Mensagens.get("usuario-sem-permissao-registro"));
        }
    }

}