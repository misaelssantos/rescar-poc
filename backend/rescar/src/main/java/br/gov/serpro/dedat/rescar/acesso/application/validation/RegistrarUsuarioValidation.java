package br.gov.serpro.dedat.rescar.acesso.application.validation;

import br.gov.serpro.dedat.rescar.acesso.application.command.RegistrarUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.domain.ValidationRule;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.Perfil;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.repository.UsuarioRepository;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.validation.PermissaoRegistrarUsuario;
import br.gov.serpro.dedat.rescar.acesso.domain.usuario.validation.UsuarioUnico;

public class RegistrarUsuarioValidation implements ValidationRule<RegistrarUsuarioCommand> {

    private UsuarioRepository repository;

    public RegistrarUsuarioValidation(UsuarioRepository repository) {
        this.repository = repository;
    }

    @Override
    public void validate(RegistrarUsuarioCommand command) {
        new PermissaoRegistrarUsuario().validate(Perfil.toEnum(command.getPerfil()));
        new UsuarioUnico(this.repository).validate(command.getEmail());
    }
}