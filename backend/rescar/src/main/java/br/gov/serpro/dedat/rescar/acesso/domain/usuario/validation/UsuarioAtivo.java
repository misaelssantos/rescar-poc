package br.gov.serpro.dedat.rescar.acesso.domain.usuario.validation;

import br.gov.serpro.dedat.rescar.acesso.domain.ValidationRule;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.SituacaoUsuario;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.Usuario;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.exception.RescarSecurityException;
import br.gov.serpro.dedat.rescar.acesso.infrastructure.internacionalization.Mensagens;

public class UsuarioAtivo implements ValidationRule<Usuario> {

    @Override
    public void validate(Usuario usuario) {
        if (!usuario.getSituacao().equals(SituacaoUsuario.ATIVO)) {
            throw new RescarSecurityException(Mensagens.get("usuario-inativo"));
        }
    }
}