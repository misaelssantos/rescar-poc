package br.gov.serpro.dedat.rescar.acesso.infrastructure.ws.rest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.gov.serpro.dedat.rescar.acesso.application.CepService;
import br.gov.serpro.dedat.rescar.acesso.application.representation.EnderecoRepresentation;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;

@RestController
@RequestMapping(value = "/v1/cep")
public class CepResource {

    private CepService service;

    public CepResource(CepService service) {
        this.service = service;
    }

    @Operation(description = "Busca dados de endereço pelo CEP em api externa")
    @SecurityRequirement(name = "Authorization")
    @GetMapping
    public ResponseEntity<EnderecoRepresentation> find(@RequestParam(name = "cep", required = false) String cep) {
    	
    	EnderecoRepresentation endereco = service.getEndereco(cep);

        return ResponseEntity.ok().body(endereco);
    }
}
