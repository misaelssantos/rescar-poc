package br.gov.serpro.dedat.rescar.acesso.application.validation;

import br.gov.serpro.dedat.rescar.acesso.domain.ObjetoExistente;
import br.gov.serpro.dedat.rescar.acesso.domain.ValidationRule;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.Usuario;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.validation.UsuarioAtivo;

public class RenovarCredenciaisValidation implements ValidationRule<Usuario> {

    @Override
    public void validate(Usuario usuarioLogado) {
        new ObjetoExistente().validate(usuarioLogado);
        new UsuarioAtivo().validate(usuarioLogado);
    }
}