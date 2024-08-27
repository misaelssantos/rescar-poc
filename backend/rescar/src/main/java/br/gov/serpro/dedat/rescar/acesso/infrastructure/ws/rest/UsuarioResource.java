package br.gov.serpro.dedat.rescar.acesso.infrastructure.ws.rest;

import java.net.URI;
import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import br.gov.serpro.dedat.rescar.acesso.application.ManterUsuarioService;
import br.gov.serpro.dedat.rescar.acesso.application.command.AlterarDadosPessoaisCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.AlterarEnderecoUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.AlterarPerfilUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.AlterarSituacaoUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.IncluirEnderecoUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.IncluirUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.command.RegistrarUsuarioCommand;
import br.gov.serpro.dedat.rescar.acesso.application.query.ListarUsuarioPorPerfilQuery;
import br.gov.serpro.dedat.rescar.acesso.application.representation.UsuarioRepresentation;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;

@RestController
@RequestMapping(value = "/v1/usuarios")
public class UsuarioResource {

    private ManterUsuarioService service;

    public UsuarioResource(ManterUsuarioService service) {
        this.service = service;
    }

    @Operation(description = "Registrar Usuario")
    @PostMapping(value = "/registro")
    public ResponseEntity<Void> register(@Valid @RequestBody RegistrarUsuarioCommand command) {
        UsuarioRepresentation representation = this.service.registrar(command);

        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(representation.getId()).toUri();

        return ResponseEntity.created(uri).build();
    }

    @Operation(description = "Incluir Usuario")
    @SecurityRequirement(name = "Authorization")
    @PostMapping
    @PreAuthorize("hasAnyRole('A')")
    public ResponseEntity<Void> insert(@Valid @RequestBody IncluirUsuarioCommand command) {
        UsuarioRepresentation representation = this.service.incluir(command);

        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(representation.getId()).toUri();

        return ResponseEntity.created(uri).build();
    }

    @Operation(description = "Alterar Usuario")
    @SecurityRequirement(name = "Authorization")
    @PutMapping(value = "/{id}")
    public ResponseEntity<Void> update(@Valid @RequestBody AlterarDadosPessoaisCommand command, @PathVariable UUID id) {
        command.setId(id);

        this.service.alterarDadosPessoais(command);

        return ResponseEntity.noContent().build();
    }

    @Operation(description = "Alterar Perfil Usuario")
    @SecurityRequirement(name = "Authorization")
    @PutMapping(value = "/{id}/perfil")
    @PreAuthorize("hasAnyRole('A')")
    public ResponseEntity<Void> updatePerfil(@Valid @RequestBody AlterarPerfilUsuarioCommand command, @PathVariable UUID id) {
        command.setId(id);

        this.service.alterarPerfil(command);

        return ResponseEntity.noContent().build();
    }

    @Operation(description = "Alterar Situacao Usuario")
    @SecurityRequirement(name = "Authorization")
    @PutMapping(value = "/{id}/situacao")
    @PreAuthorize("hasAnyRole('A')")
    public ResponseEntity<Void> updateSituacao(@Valid @RequestBody AlterarSituacaoUsuarioCommand command, @PathVariable UUID id) {
        command.setId(id);

        this.service.alterarSituacao(command);

        return ResponseEntity.noContent().build();
    }
    
    @Operation(description = "Incluir Endereco Usuario")
    @SecurityRequirement(name = "Authorization")
    @PostMapping(value = "/{id}/endereco")
    @PreAuthorize("hasAnyRole('A')")
    public ResponseEntity<Void> incluirEndereco(@Valid @RequestBody IncluirEnderecoUsuarioCommand command, @PathVariable UUID id) {
        command.setId(id);

        this.service.incluirEndereco(command);

        return ResponseEntity.noContent().build();
    }
    
    @Operation(description = "Alterar Endereco Usuario")
    @SecurityRequirement(name = "Authorization")
    @PutMapping(value = "/{id}/endereco")
    @PreAuthorize("hasAnyRole('A')")
    public ResponseEntity<Void> updateEndereco(@Valid @RequestBody AlterarEnderecoUsuarioCommand command, @PathVariable UUID id) {
        command.setId(id);

        this.service.alterarEndereco(command);

        return ResponseEntity.noContent().build();
    }
    
    @Operation(description = "Apagar Endereco Usuario")
    @SecurityRequirement(name = "Authorization")
    @DeleteMapping(value = "/{id}/endereco")
    @PreAuthorize("hasAnyRole('A')")
    public ResponseEntity<Void> removeEndereco(@Valid @PathVariable UUID id) {

        this.service.removerEndereco(id);

        return ResponseEntity.noContent().build();
    }

    @Operation(description = "Obter Usuario por id")
    @SecurityRequirement(name = "Authorization")
    @GetMapping(value = "/{id}")
    public ResponseEntity<UsuarioRepresentation> find(@PathVariable UUID id) {
        return ResponseEntity.ok().body(this.service.obter(id));
    }

    @Operation(description = "Listar usuarios")
    @SecurityRequirement(name = "Authorization")
    @GetMapping
    @PreAuthorize("hasAnyRole('A')")
    public ResponseEntity<List<UsuarioRepresentation>> findAll(@RequestParam(name = "perfil", required = false) String perfil) {
        List<UsuarioRepresentation> list;

        if (perfil != null) {
            ListarUsuarioPorPerfilQuery query = new ListarUsuarioPorPerfilQuery();
            query.setPerfil(perfil);

            list = this.service.listarPorPerfil(query);
        } else {
            list = this.service.listar();
        }

        return ResponseEntity.ok().body(list);
    }
}
